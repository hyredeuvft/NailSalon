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
    /// Логика взаимодействия для OrderAddEditWindow.xaml
    /// </summary>
    public partial class OrderAddEditWindow : Window
    {
        private bool isChange = false;
        private Order editOrder;
        public OrderAddEditWindow()
        {
            InitializeComponent();

            cmbClient.ItemsSource = EFClass.Context.Client.ToList();
            cmbClient.SelectedIndex = 0;
            cmbClient.DisplayMemberPath = "LastName";
        }

        public OrderAddEditWindow(Order order)
        {
            InitializeComponent();

            cmbClient.ItemsSource = EFClass.Context.Client.ToList();
            cmbClient.DisplayMemberPath = "LastName";
            cmbClient.SelectedItem = EFClass.Context.Client.Where(i => i.IdClient == order.IdClient).FirstOrDefault();
            dpSaleDate.Text = order.SaleDate.ToString();
            tbFinalCost.Text = order.FinalCost.ToString();
            if (order.IsPerformed)/* ==true*/
            {
                rbTrue.IsChecked = true;
            }
            else
            {
                rbFalse.IsChecked = true;
            }

            isChange = true;
            editOrder = order;
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            OrderListWindow listRecordWindow = new OrderListWindow();
            listRecordWindow.Show();
            this.Close();
        }

        private void btnAddEdit_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(dpSaleDate.Text) ||
                string.IsNullOrWhiteSpace(tbFinalCost.Text))
            {
                MessageBox.Show("Не все поля заполнены!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (isChange)
            {
                editOrder.IdClient = (cmbClient.SelectedItem as Client).IdClient;
                editOrder.SaleDate = Convert.ToDateTime(dpSaleDate.Text);
                editOrder.FinalCost = Convert.ToDecimal(tbFinalCost.Text);
                if (rbTrue.IsChecked == true)
                {
                    editOrder.IsPerformed = true;
                }
                if (rbFalse.IsChecked == true)
                {
                    editOrder.IsPerformed = false;
                }

                EFClass.Context.SaveChanges();
                MessageBox.Show("Запись успешно обновлена!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
            else
            {
                Order order = new Order();
                order.IdClient = (cmbClient.SelectedItem as Client).IdClient;
                order.SaleDate = Convert.ToDateTime(dpSaleDate.Text);
                order.FinalCost = Convert.ToDecimal(tbFinalCost.Text);
                if (rbTrue.IsChecked == true)
                {
                    order.IsPerformed = true;
                }
                if (rbFalse.IsChecked == true)
                {
                    order.IsPerformed = false;
                }

                EFClass.Context.Order.Add(order);
                EFClass.Context.SaveChanges();
                MessageBox.Show("Запись успешно добавлена", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
        }
    }
}
        