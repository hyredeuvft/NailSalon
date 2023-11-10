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
    /// Логика взаимодействия для EmployeeAddEditWindow.xaml
    /// </summary>
    public partial class EmployeeAddEditWindow : Window
    {
        private bool isChange = false;
        private Employee editEmployee;
        public EmployeeAddEditWindow()
        {
            InitializeComponent();

            cmbGender.ItemsSource = EFClass.Context.Gender.ToList();
            cmbGender.SelectedIndex = 0;
            cmbGender.DisplayMemberPath = "Title";
        }

        public EmployeeAddEditWindow(Employee employee)
        {
            InitializeComponent();

            cmbGender.ItemsSource = EFClass.Context.Gender.ToList();
            cmbGender.DisplayMemberPath = "Title";

            tbLastName.Text = employee.LastName.ToString();
            tbFirstName.Text = employee.FirstName.ToString();
            tbPatronymic.Text = employee.Patronymic.ToString();
            dpBirthday.Text = employee.Birthday.ToString(); /*???????????????????*/
            tbPassportSeries.Text = employee.PassportSeries.ToString();
            tbPassportNumber.Text = employee.PassportNumber.ToString();
            cmbGender.SelectedItem = EFClass.Context.Gender.Where(i => i.GenderCode == employee.GenderCode).FirstOrDefault();
            tbPhone.Text = employee.Phone.ToString();
            tbEmail.Text = employee.Email.ToString();
            tbLogin.Text = employee.Login.ToString();
            tbPassword.Password = employee.Password.ToString();

            isChange = true;
            editEmployee = employee;
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            EmployeeListWindow listEmployeeWindow = new EmployeeListWindow();
            listEmployeeWindow.Show();
            this.Close();
        }

        private void btnAddEdit_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbLastName.Text) ||
                string.IsNullOrWhiteSpace(tbFirstName.Text) ||
                string.IsNullOrWhiteSpace(tbPatronymic.Text) ||
                string.IsNullOrWhiteSpace(dpBirthday.Text) ||
                string.IsNullOrWhiteSpace(tbPhone.Text))
            {
                MessageBox.Show("Не все поля заполнены!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (isChange)
            {
                editEmployee.LastName = tbLastName.Text;
                editEmployee.FirstName = tbFirstName.Text;
                editEmployee.Patronymic = tbPatronymic.Text;
                editEmployee.Birthday = Convert.ToDateTime(dpBirthday.Text);
                editEmployee.PassportSeries = tbPassportSeries.Text;
                editEmployee.PassportNumber = tbPassportNumber.Text;
                editEmployee.GenderCode = (cmbGender.SelectedItem as Gender).GenderCode;
                editEmployee.Phone = tbPhone.Text;
                editEmployee.Email = tbEmail.Text;
                editEmployee.Login = tbLogin.Text;
                editEmployee.Password = tbPassword.Password;

                EFClass.Context.SaveChanges();
                MessageBox.Show("Сотрудник успешно обновлен!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
            else
            {
                Employee employee = new Employee();
                employee.LastName = tbLastName.Text;
                employee.FirstName = tbFirstName.Text;
                employee.Patronymic = tbPatronymic.Text;
                employee.Birthday = Convert.ToDateTime(dpBirthday.Text);
                employee.PassportSeries = tbPassportSeries.Text;
                employee.PassportNumber = tbPassportNumber.Text;
                employee.GenderCode = (cmbGender.SelectedItem as Gender).GenderCode;
                employee.Phone = tbPhone.Text;
                employee.Email = tbEmail.Text;
                employee.Login = tbLogin.Text;
                employee.Password = tbPassword.Password;

                EFClass.Context.Employee.Add(employee);
                EFClass.Context.SaveChanges();
                MessageBox.Show("Сотрудник успешно добавлен", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
        }
    }
}
