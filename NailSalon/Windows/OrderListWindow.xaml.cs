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
    /// Логика взаимодействия для OrderListWindow.xaml
    /// </summary>
    public partial class OrderListWindow : Window
    {
        List<Order> orders = new List<Order>();
        List<string> sortList = new List<string>()
        {
            "По умолчанию",
            "По дате"
        };
        public OrderListWindow()
        {
            InitializeComponent();

            cmbSort.ItemsSource = sortList;
            cmbSort.SelectedIndex = 0;

            GetSortListRecord();
        }

        private void GetSortListRecord()
        {
            orders = EFClass.Context.Order.ToList();
            orders = orders.Where(i => i.Client.LastName.Contains(tbSearch.Text)).ToList();
            switch (cmbSort.SelectedIndex)
            {
                case 0:
                    orders = orders.OrderBy(i => i.IdOrder).ToList();
                    break;
                case 1:
                    orders = orders.OrderBy(i => i.SaleDate).ToList();
                    break;
                default:
                    break;
            }

            LvRecordList.ItemsSource = orders;
        }

        private void btnAddEditRecord_Click(object sender, RoutedEventArgs e)
        {
            if (LvRecordList.SelectedItem is Order)
            {
                var order = LvRecordList.SelectedItem as Order;
                OrderAddEditWindow addEditRecordWindow = new OrderAddEditWindow(order);
                this.Hide();
                addEditRecordWindow.ShowDialog();
                this.Show();
            }
            else
            {
                OrderAddEditWindow addEditRecordWindow = new OrderAddEditWindow();
                this.Hide();
                addEditRecordWindow.ShowDialog();
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
            if (LvRecordList.SelectedItem is Order)
            {
                var item = LvRecordList.SelectedItem as Order;
                GetSortListRecord();
                var dialogResult = MessageBox.Show("Вы действительно хотите удалить?", "Внимание!", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    EFClass.Context.Order.Remove(item);
                    EFClass.Context.SaveChanges();
                    MessageBox.Show("Запись успешно удалена!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    GetSortListRecord();
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
            GetSortListRecord();
        }

        private void cmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GetSortListRecord();
        }
    }
}