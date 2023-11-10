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
using static NailSalon.ClassHelper.EFClass;
using NailSalon.Windows;
using NailSalon.ClassHelper;

namespace NailSalon.Windows
{
    /// <summary>
    /// Логика взаимодействия для RegistrationWindow.xaml
    /// </summary>
    public partial class RegistrationWindow : Window
    {
        public RegistrationWindow()
        {
            InitializeComponent();
        }

        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbLastName.Text) ||
                string.IsNullOrWhiteSpace(tbFirstName.Text) ||
                string.IsNullOrWhiteSpace(DpBirthDay.Text) ||
                string.IsNullOrWhiteSpace(tbPhone.Text) ||
                string.IsNullOrWhiteSpace(tbLogin.Text) ||
                string.IsNullOrWhiteSpace(tbPassword.Password))
            {
                MessageBox.Show("Все поля должны быть заполнены!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            var authEmployee = EFClass.Context.Employee.ToList()
                .Where(x => x.Login == tbLogin.Text).FirstOrDefault();
            if (authEmployee != null)
            {
                MessageBox.Show("Такой логин уже есть", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            else
            {
                if (Int64.TryParse(tbPhone.Text, out long i))
                {
                    Employee employee = new Employee();
                    employee.LastName = tbLastName.Text;
                    employee.FirstName = tbFirstName.Text;
                    employee.Patronymic = tbPatronymic.Text;
                    employee.Birthday = Convert.ToDateTime(DpBirthDay.Text);
                    employee.PassportSeries = null;
                    employee.PassportNumber = null;
                    if (rbMale.IsChecked == true)
                    {
                        employee.GenderCode = "м";
                    }
                    if (rbFemale.IsChecked == true)
                    {
                        employee.GenderCode = "ж";
                    }
                    employee.Phone = tbPhone.Text;
                    employee.Email = null;
                    employee.Login = tbLogin.Text;
                    employee.Password = tbPassword.Password;

                    EFClass.Context.Employee.Add(employee);
                    EFClass.Context.SaveChanges();
                    MessageBox.Show("Вы успешно зарегестрировались!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    Windows.АuthorizationWindow authorizationWindow = new Windows.АuthorizationWindow();
                    authorizationWindow.Show();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Введите данные правильно!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void tbSignIn_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            Windows.АuthorizationWindow authorizationWindow = new Windows.АuthorizationWindow();
            authorizationWindow.Show();
            this.Close();
        }
    }
}
