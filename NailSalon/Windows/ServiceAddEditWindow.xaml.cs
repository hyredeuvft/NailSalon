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
using NailSalon.DB;
using static NailSalon.ClassHelper.EFClass;
using NailSalon.ClassHelper;

namespace NailSalon.Windows
{
    /// <summary>
    /// Логика взаимодействия для ServiceAddEditWindow.xaml
    /// </summary>
    public partial class ServiceAddEditWindow : Window
    {
        private bool isChange = false;
        private Service editService;
        public ServiceAddEditWindow()
        {
            InitializeComponent();

            cmbCategory.ItemsSource = Context.Category.ToList();
            cmbCategory.SelectedIndex = 0;
            cmbCategory.DisplayMemberPath = "Title";
        }

        public ServiceAddEditWindow(Service service)
        {
            InitializeComponent();

            cmbCategory.ItemsSource = Context.Category.ToList();
            cmbCategory.DisplayMemberPath = "Title";

            tbTitle.Text = service.Title.ToString();
            cmbCategory.SelectedItem = EFClass.Context.Category.Where(i => i.IdCategory == service.IdCategory).FirstOrDefault();
            tbDescription.Text = service.Description.ToString();
            tbCost.Text = service.Cost.ToString();
            tbDurationInMinute.Text = service.DurationInMinute.ToString();

            isChange = true;
            editService = service;
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            ServiceListWindow listServiceWindow = new ServiceListWindow();
            listServiceWindow.Show();
            this.Close();
        }

        private void btnAddEdit_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbTitle.Text) ||
                string.IsNullOrWhiteSpace(tbCost.Text))
            {
                MessageBox.Show("Не все поля заполнены!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (isChange)
            {
                editService.Title = tbTitle.Text;
                editService.IdCategory = (cmbCategory.SelectedItem as Category).IdCategory;
                editService.Description = tbDescription.Text;
                editService.Cost = Convert.ToDecimal(tbCost.Text);
                editService.DurationInMinute = Convert.ToInt16(tbDurationInMinute.Text);

                Context.SaveChanges();
                MessageBox.Show("Услуга успешно обновлена!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
            else
            {
                Service service = new Service();
                service.Title = tbTitle.Text;
                service.IdCategory = (cmbCategory.SelectedItem as Category).IdCategory;
                service.Description = tbDescription.Text;
                service.Cost = Convert.ToDecimal(tbCost.Text);
                service.DurationInMinute = Convert.ToInt16(tbDurationInMinute.Text);

                Context.Service.Add(service);
                Context.SaveChanges();
                MessageBox.Show("Услуга успешно добавлена", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
        }
    }
}
