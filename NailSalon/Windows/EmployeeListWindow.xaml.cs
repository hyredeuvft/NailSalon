using NailSalon.ClassHelper;
using NailSalon.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace NailSalon.Windows
{
    /// <summary>
    /// Логика взаимодействия для EmployeeListWindow.xaml
    /// </summary>
    public partial class EmployeeListWindow : Window
    {
        List<Employee> employees = new List<Employee>();
        List<string> sortList = new List<string>()
        {
            "По умолчанию",
            "По фамилии (а -> я)",
            "По фамилии (я -> а)",
            "По дате рождения"
        };
        public EmployeeListWindow()
        {
            InitializeComponent();
            cmbSort.ItemsSource = sortList;
            cmbSort.SelectedIndex = 0;

            GetSortListEmployee();
        }

        private void GetSortListEmployee()
        {
            employees = EFClass.Context.Employee.ToList();
            employees = employees.Where(i => i.LastName.Contains(tbSearch.Text) ||
                                    i.FirstName.Contains(tbSearch.Text)).ToList();
            switch (cmbSort.SelectedIndex)
            {
                case 0:
                    employees = employees.OrderBy(i => i.IdEmployee).ToList();
                    break;
                case 1:
                    employees = employees.OrderBy(i => i.LastName).ToList();
                    break;
                case 2:
                    employees = employees.OrderByDescending(i => i.LastName).ToList();
                    break;
                case 3:
                    employees = employees.OrderBy(i => i.Birthday).ToList();
                    break;
                default:
                    break;
            }

            LvEmployeeList.ItemsSource = employees;
        }

        private void btnAddEditEmployee_Click(object sender, RoutedEventArgs e)
        {
            if (LvEmployeeList.SelectedItem is Employee)
            {
                var employee = LvEmployeeList.SelectedItem as Employee;
                EmployeeAddEditWindow addEditEmployeeWindow = new EmployeeAddEditWindow(employee);
                this.Hide();
                addEditEmployeeWindow.ShowDialog();
                this.Show();
            }
            else
            {
                EmployeeAddEditWindow addEditEmployeeWindow = new EmployeeAddEditWindow();
                this.Hide();
                addEditEmployeeWindow.ShowDialog();
                this.Show();
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            HomeWindow homeWindow = new HomeWindow();
            homeWindow.Show();
            this.Close();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (LvEmployeeList.SelectedItem is Employee)
            {
                var item = LvEmployeeList.SelectedItem as Employee;
                GetSortListEmployee();
                var dialogResult = MessageBox.Show("Вы действительно хотите удалить?", "Внимание!", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    EFClass.Context.Employee.Remove(item);
                    EFClass.Context.SaveChanges();
                    MessageBox.Show("Запись успешно удалена!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    GetSortListEmployee();
                }
                else { }
            }
            else
            {
                MessageBox.Show("Запись не выбрана", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void tbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            GetSortListEmployee();
        }

        private void cmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GetSortListEmployee();
        }
    }
}
