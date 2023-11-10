using NailSalon.ClassHelper;
using NailSalon.DB;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Net;
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
    /// Логика взаимодействия для CartWindow.xaml
    /// </summary>
    public partial class CartWindow : Window
    {
        public CartWindow()
        {
            InitializeComponent();

            dpDate.DisplayDateStart = DateTime.Now;

            cmbEmployee.ItemsSource = EFClass.Context.Employee.ToList();
            cmbEmployee.SelectedIndex = 0;
            cmbEmployee.DisplayMemberPath = "LastName";

            cmbClient.ItemsSource = EFClass.Context.Client.ToList();
            cmbClient.SelectedIndex = 0;
            cmbClient.DisplayMemberPath = "LastName";

            GetListProduct();
        }

        private void GetListProduct()
        {
            ObservableCollection<Product> products = new ObservableCollection<Product>(CartClass.Products);
            ObservableCollection<Service> services = new ObservableCollection<Service>(CartClass.Services);
            LvProductList.ItemsSource = products;
            LvServiceList.ItemsSource = services;
            GetPrice(products);
        }

        private void GetPrice(ObservableCollection<Product> products)
        {
            decimal price = 0;
            foreach (var item in CartClass.Products)
            {
                price += item.Cost * item.Quantity;
            }
            foreach (var item in CartClass.Services)
            {
                price += item.Cost;
            }
            price = Math.Round(price, 2);
            tbPrice.Text = price.ToString();
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnMinus_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if (button == null)
            {
                return;
            }

            Product selectedProduct = button.DataContext as Product;

            if (selectedProduct != null)
            {
                if (selectedProduct.Quantity == 1 || selectedProduct.Quantity == 0)
                {
                    CartClass.Products.Remove(selectedProduct);
                }
                else
                {
                    selectedProduct.Quantity--;
                    int newCount = CartClass.Products.IndexOf(selectedProduct);
                    CartClass.Products.Remove(selectedProduct);
                    CartClass.Products.Insert(newCount, selectedProduct);
                }
            }
            GetListProduct();
        }

        private void btnPlus_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if (button == null)
            {
                return;
            }

            Product selectedProduct = button.DataContext as Product;

            if (selectedProduct != null)
            {
                selectedProduct.Quantity++;
                int newCount = CartClass.Products.IndexOf(selectedProduct);
                CartClass.Products.Remove(selectedProduct);
                CartClass.Products.Insert(newCount, selectedProduct);
            }
            GetListProduct();
        }

        private void btnBuy_Click(object sender, RoutedEventArgs e)
        {
            if (CartClass.Products != null)
            {
                Order order = new Order();
                order.FinalCost = Convert.ToDecimal(tbPrice.Text);
                order.IdClient = (cmbClient.SelectedItem as Client).IdClient;
                order.SaleDate = dpDate.SelectedDate.Value;
                if (dpDate.SelectedDate.Value > DateTime.Now)
                {
                    order.IsPerformed = false;
                }
                else
                {
                    order.IsPerformed = true;
                }
                if (order != null)
                {
                    EFClass.Context.Order.Add(order);
                    EFClass.Context.SaveChanges();
                }
                foreach (var item in CartClass.Products)
                {
                    OrderProduct orderProduct = new OrderProduct();
                    orderProduct.IdOrder = EFClass.Context.Order.ToList().LastOrDefault().IdOrder;
                    orderProduct.IdProduct = item.IdProduct;
                    orderProduct.Quantity = Convert.ToInt16(item.Quantity);
                    orderProduct.PreliminaryCost = item.Cost * item.Quantity;

                    EFClass.Context.OrderProduct.Add(orderProduct);
                    EFClass.Context.SaveChanges();
                }

                if (CartClass.Services != null)
                {
                    order.IsPerformed = true;
                    foreach (var item in CartClass.Services)
                    {
                        OrderService orderService = new OrderService();
                        orderService.IdOrder = EFClass.Context.Order.ToList().LastOrDefault().IdOrder;
                        orderService.IdService = item.IdService;
                        orderService.IdEmployee =(cmbEmployee.SelectedItem as Employee).IdEmployee;

                        EFClass.Context.OrderService.Add(orderService);
                        EFClass.Context.SaveChanges();
                    }
                }

                MessageBox.Show("Покупка совершена!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                CartClass.Products.Clear();
                CartClass.Services.Clear();
                this.Close();
            }
        }

        private void btnMinusService_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if (button == null)
            {
                return;
            }

            Service selectedProduct = button.DataContext as Service;

            if (selectedProduct != null)
            {
                CartClass.Services.Remove(selectedProduct);
            }
            GetListProduct();
        }
    }
}
