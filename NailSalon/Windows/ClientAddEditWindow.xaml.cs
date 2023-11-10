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
    /// Логика взаимодействия для ClientAddEditWindow.xaml
    /// </summary>
    public partial class ClientAddEditWindow : Window
    {
        private bool isChange = false;
        private Client editClient;
        public ClientAddEditWindow()
        {
            InitializeComponent();

            cmbGender.ItemsSource = EFClass.Context.Gender.ToList();
            cmbGender.SelectedIndex = 0;
            cmbGender.DisplayMemberPath = "Title";
        }

        public ClientAddEditWindow(Client client)
        {
            InitializeComponent();

            cmbGender.ItemsSource = EFClass.Context.Gender.ToList();
            cmbGender.SelectedIndex = 0;
            cmbGender.DisplayMemberPath = "Title";

            tbLastName.Text = client.LastName.ToString();
            tbFirstName.Text = client.FirstName.ToString();
            tbPatronymic.Text = client.Patronymic.ToString();
            dpBirthday.Text = client.Birthday.ToString(); /*???????????????????*/
            dpRegistrationDate.Text = client.RegistrationDate.ToString();
            cmbGender.SelectedItem = EFClass.Context.Gender.Where(i => i.GenderCode == client.GenderCode).FirstOrDefault();
            tbPhone.Text = client.Phone.ToString();

            isChange = true;
            editClient = client;
        }
        private void btnAddEdit_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbLastName.Text) ||
                string.IsNullOrWhiteSpace(tbFirstName.Text) ||
                string.IsNullOrWhiteSpace(tbPatronymic.Text) ||
                string.IsNullOrWhiteSpace(dpBirthday.Text) ||
                string.IsNullOrWhiteSpace(dpRegistrationDate.Text) ||
                string.IsNullOrWhiteSpace(tbPhone.Text))
            {
                MessageBox.Show("Не все поля заполнены!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (isChange)
            {
                editClient.LastName = tbLastName.Text;
                editClient.FirstName = tbFirstName.Text;
                editClient.Patronymic = tbPatronymic.Text;
                editClient.Birthday = Convert.ToDateTime(dpBirthday.Text);
                editClient.RegistrationDate = Convert.ToDateTime(dpRegistrationDate.Text);
                editClient.GenderCode = (cmbGender.SelectedItem as Gender).GenderCode;
                editClient.Phone = tbPhone.Text;

                EFClass.Context.SaveChanges();
                MessageBox.Show("Клиент успешно обновлен!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
            else
            {
                Client client = new Client();
                client.FirstName = tbFirstName.Text;
                client.LastName = tbLastName.Text;
                client.Patronymic = tbPatronymic.Text;
                client.Birthday = Convert.ToDateTime(dpBirthday.Text);
                client.RegistrationDate = Convert.ToDateTime(dpRegistrationDate.Text);
                client.GenderCode = (cmbGender.SelectedItem as Gender).GenderCode;
                client.Phone = tbPhone.Text;

                EFClass.Context.Client.Add(client);
                EFClass.Context.SaveChanges();
                MessageBox.Show("Клиент успешно добавлен", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            ClientListWindow listClientWindow = new ClientListWindow();
            listClientWindow.Show();
            this.Close();
        }
    }
}
