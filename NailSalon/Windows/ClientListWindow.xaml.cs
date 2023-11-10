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
    /// Логика взаимодействия для ClientListWindow.xaml
    /// </summary>
    public partial class ClientListWindow : Window
    {
        List<Client> clients = new List<Client>();
        List<string> sortList = new List<string>()
        {
            "По умолчанию",
            "По фамилии (а -> я)",
            "По фамилии (я -> а)",
            "По дате регистрации",
            "По дате рождения"
        };
        public ClientListWindow()
        {
            InitializeComponent();

            cmbSort.ItemsSource = sortList;
            cmbSort.SelectedIndex = 0;

            GetSortListClient();
        }
        private void GetSortListClient()
        {
            clients = EFClass.Context.Client.ToList();
            clients = clients.Where(i => i.LastName.Contains(tbSearch.Text) ||
                                    i.FirstName.Contains(tbSearch.Text)).ToList();
            switch (cmbSort.SelectedIndex)
            {
                case 0:
                    clients = clients.OrderBy(i => i.IdClient).ToList();
                    break;
                case 1:
                    clients = clients.OrderBy(i => i.LastName).ToList();
                    break;
                case 2:
                    clients = clients.OrderByDescending(i => i.LastName).ToList();
                    break;
                case 3:
                    clients = clients.OrderBy(i => i.RegistrationDate).ToList();
                    break;
                case 4:
                    clients = clients.OrderBy(i => i.Birthday).ToList();
                    break;
                default:
                    break;
            }
            LvClientList.ItemsSource = clients;
        }

        private void btnAddEditClient_Click(object sender, RoutedEventArgs e)
        {
            if (LvClientList.SelectedItem is Client)
            {
                var client = LvClientList.SelectedItem as Client;
                ClientAddEditWindow addEditClientWindow = new ClientAddEditWindow(client);
                this.Hide();
                addEditClientWindow.ShowDialog();
                this.Show();
            }
            else
            {
                ClientAddEditWindow addEditClientWindow = new ClientAddEditWindow();
                this.Hide();
                addEditClientWindow.ShowDialog();
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
            if (LvClientList.SelectedItem is Client)
            {
                var item = LvClientList.SelectedItem as Client;
                GetSortListClient();
                var dialogResult = MessageBox.Show("Вы действительно хотите удалить?", "Внимание!", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    EFClass.Context.Client.Remove(item);
                    EFClass.Context.SaveChanges();
                    MessageBox.Show("Запись успешно удалена!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    GetSortListClient();
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
            GetSortListClient();
        }

        private void cmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GetSortListClient();
        }
    }
}