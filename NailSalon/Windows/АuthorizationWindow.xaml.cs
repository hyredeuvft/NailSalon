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
using static NailSalon.ClassHelper.EFClass;
using NailSalon.DB;
using NailSalon.ClassHelper;

namespace NailSalon.Windows
{
    /// <summary>
    /// Логика взаимодействия для АuthorizationWindow.xaml
    /// </summary>
    public partial class АuthorizationWindow : Window
    {
        public АuthorizationWindow()
        {
            InitializeComponent();
        }

        private void btnLogIn_Click(object sender, RoutedEventArgs e)
        {
            var auth = EFClass.Context.Employee.ToList()
                .Where(i => i.Login == tbLogin.Text && i.Password == pbPassword.Password).FirstOrDefault();

            if (auth != null)
            {
                DataClass.Employee = auth;
                HomeWindow homeWindow = new HomeWindow();
                homeWindow.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Такой пользователь не найден.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btnRegOn_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            RegistrationWindow registrationWindow = new RegistrationWindow();
            registrationWindow.Show();
            this.Close();
        }
    }
}
