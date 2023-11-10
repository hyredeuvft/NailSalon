using System;
using System.Collections.Generic;
using System.Linq;
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
using NailSalon.Windows;
using NailSalon.ClassHelper;
using static NailSalon.ClassHelper.EFClass;

namespace NailSalon.Windows
{
    /// <summary>
    /// Логика взаимодействия для HomeWindow.xaml
    /// </summary>
    public partial class HomeWindow : Window
    {
        public HomeWindow()
        {
            InitializeComponent();
            tblWelcome.Text = "Добро пожаловать, " + DataClass.Employee.LastName;
        }

        private void btnListService_Click(object sender, RoutedEventArgs e)
        {
            ServiceListWindow serviceListWindow = new ServiceListWindow();
            serviceListWindow.Show();
            this.Close();
        }

        private void btnListClient_Click(object sender, RoutedEventArgs e)
        {
            ClientListWindow clientListWindow = new ClientListWindow();
            clientListWindow.Show();
            this.Close();
        }

        private void btnListEmployee_Click(object sender, RoutedEventArgs e)
        {
            EmployeeListWindow employeeListWindow = new EmployeeListWindow();
            employeeListWindow.Show();
            this.Close();
        }

        private void btnListRecord_Click(object sender, RoutedEventArgs e)
        {
            OrderListWindow orderListWindow = new OrderListWindow();
            orderListWindow.Show();
            this.Close();
        }

        private void btnListProduct_Click(object sender, RoutedEventArgs e)
        {
            ProductListWindow productListWindow = new ProductListWindow();
            productListWindow.Show();
            this.Close();
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            var DialogResult = MessageBox.Show("Вы уверены, что хотите выйти?", "Внимание!", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (DialogResult == MessageBoxResult.Yes)
            {
                Windows.АuthorizationWindow authWindow = new Windows.АuthorizationWindow();
                authWindow.Show();
                this.Close();
            }
        }
    }
}
