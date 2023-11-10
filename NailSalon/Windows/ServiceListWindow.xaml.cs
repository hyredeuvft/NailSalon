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
using NailSalon.DB;
using NailSalon.Windows;
using static NailSalon.ClassHelper.EFClass;
using NailSalon.ClassHelper;
using System.Diagnostics;

namespace NailSalon.Windows
{
    /// <summary>
    /// Логика взаимодействия для ServiceListWindow.xaml
    /// </summary>
    public partial class ServiceListWindow : Window
    {
        List<Service> services = new List<Service>();
        List<string> sortList = new List<string>()
        {
            "По умолчанию",
            "По названию (а -> я)",
            "По названию (я -> а)",
            "По цене",
            "По продолжительности"
        };
        List<string> filterList = new List<string>()
        {
            "Все",
            "Маникюр",
            "Покрытие",
            "Укрепление",
            "Педикюр",
            "Подология",
            "SPA-уход",
            "Дизайны",
            "Дополнительные услуги"
        };
        public ServiceListWindow()
        {
            InitializeComponent();

            cmbSort.ItemsSource = sortList;
            cmbSort.SelectedIndex = 0;

            cmbFilter.ItemsSource = filterList;
            cmbFilter.SelectedIndex = 0;

            GetSortListService();
        }

        private void GetSortListService()
        {
            services = Context.Service.ToList();
            services = services.Where(i => i.Title.Contains(tbSearch.Text) ||
                                            i.Description.Contains(tbSearch.Text)).ToList();
            switch (cmbSort.SelectedIndex)
            {
                case 0:
                    services = services.OrderBy(i => i.IdService).ToList();
                    break;
                case 1:
                    services = services.OrderBy(i => i.Title).ToList();
                    break;
                case 2:
                    services = services.OrderByDescending(i => i.Title).ToList();
                    break;
                case 3:
                    services = services.OrderBy(i => i.Cost).ToList();
                    break;
                case 4:
                    services = services.OrderBy(i => i.DurationInMinute).ToList();
                    break;
                default:
                    break;
            }
            if (cmbFilter.SelectedIndex == 0)
            {
                LvServiceList.ItemsSource = services;
            }
            else
            {
                services = services.Where(i => i.IdCategory == cmbFilter.SelectedIndex).ToList();
            }
            LvServiceList.ItemsSource = services;
        }

        private void btnAddEditService_Click(object sender, RoutedEventArgs e)
        {
            if (LvServiceList.SelectedItem is Service)
            {
                var service = LvServiceList.SelectedItem as Service;
                ServiceAddEditWindow serviceAddEditWindow = new ServiceAddEditWindow(service);
                this.Hide();
                serviceAddEditWindow.ShowDialog();
                this.Show();
            }
            else
            {
                ServiceAddEditWindow addEditServiceWindow = new ServiceAddEditWindow();
                this.Hide();
                addEditServiceWindow.ShowDialog();
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
            if (LvServiceList.SelectedItem is Service)
            {
                var item = LvServiceList.SelectedItem as Service;
                GetSortListService();
                var dialogResult = MessageBox.Show("Вы действительно хотите удалить?", "Внимание!", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    Context.Service.Remove(item);
                    Context.SaveChanges();
                    MessageBox.Show("Запись успешно удалена!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    GetSortListService();
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
            GetSortListService();
        }

        private void cmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GetSortListService();
        }

        private void btnCart_Click(object sender, RoutedEventArgs e)
        {
            CartWindow cartWindow = new CartWindow();
            this.Hide();
            cartWindow.Show();
            this.Show();
        }

        private void btnAddToCart_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            bool seek = true;
            if (button == null)
            {
                return;
            }

            var selectedService = button.DataContext as Service;
            if (selectedService != null)
            {
                if (seek)
                {
                    CartClass.Services.Add(selectedService);
                }
            }
        }

        private void cmbFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GetSortListService();
        }
    }
}

