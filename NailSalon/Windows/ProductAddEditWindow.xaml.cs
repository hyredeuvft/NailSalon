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
    /// Логика взаимодействия для ProductAddEditWindow.xaml
    /// </summary>
    public partial class ProductAddEditWindow : Window
    {
        private bool isChange = false;
        private Product editProduct;
        public ProductAddEditWindow()
        {
            InitializeComponent();

            cmbCategory.ItemsSource = EFClass.Context.CategoryProduct.ToList();
            cmbCategory.SelectedIndex = 0;
            cmbCategory.DisplayMemberPath = "Title";
        }

        public ProductAddEditWindow(Product product)
        {
            InitializeComponent();

            cmbCategory.ItemsSource = EFClass.Context.CategoryProduct.ToList();
            cmbCategory.SelectedIndex = 0;
            cmbCategory.DisplayMemberPath = "Title";

            tbTitle.Text = product.Title.ToString();
            tbCost.Text = product.Cost.ToString();
            cmbCategory.SelectedItem = EFClass.Context.CategoryProduct.Where(i => i.IdCategoryProduct == product.IdCategoryProduct).FirstOrDefault();
            tbQuantityInStock.Text = product.QuantityInStock.ToString();

            isChange = true;
            editProduct = product;
        }

        private void btnAddEdit_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(tbTitle.Text) ||
                string.IsNullOrWhiteSpace(tbCost.Text) ||
                string.IsNullOrWhiteSpace(tbQuantityInStock.Text))
            {
                MessageBox.Show("Не все поля заполнены!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                return;
            }

            if (isChange)
            {
                editProduct.Title = tbTitle.Text;
                editProduct.Cost = Convert.ToDecimal(tbCost.Text);
                editProduct.IdCategoryProduct = (cmbCategory.SelectedItem as CategoryProduct).IdCategoryProduct;
                editProduct.QuantityInStock = Convert.ToInt32(tbQuantityInStock.Text);

                EFClass.Context.SaveChanges();
                MessageBox.Show("Товар успешно обновлен!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
            else
            {
                Product product = new Product();
                product.Title = tbTitle.Text;
                product.Cost = Convert.ToDecimal(tbCost.Text);
                product.IdCategoryProduct = (cmbCategory.SelectedItem as CategoryProduct).IdCategoryProduct;
                product.QuantityInStock = Convert.ToInt32(tbQuantityInStock.Text);

                EFClass.Context.Product.Add(product);
                EFClass.Context.SaveChanges();
                MessageBox.Show("Товар успешно добавлен", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                this.Close();
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            ProductListWindow listProductWindow = new ProductListWindow();
            listProductWindow.Show();
            this.Close();
        }
    }
}