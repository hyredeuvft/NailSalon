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
    /// Логика взаимодействия для ProductListWindow.xaml
    /// </summary>
    public partial class ProductListWindow : Window
    {
        List<Product> products = new List<Product>();
        List<string> sortList = new List<string>()
        {
            "По умолчанию",
            "По названию",
            "По цене"
        };
        List<string> filterList = new List<string>()
        {
            "Все",
            "Очищающие средства",
            "Тонизирующие средства",
            "Увлажняющие средства",
            "Краска для волос",
            "Средства для покраски волос",
            "Маникюрные принадлежности",
            "Педикюрные принадлежности",
            "Средства для волос"
        };
        public ProductListWindow()
        {
            InitializeComponent();

            cmbSort.ItemsSource = sortList;
            cmbSort.SelectedIndex = 0;
            cmbFilter.ItemsSource = filterList;
            cmbFilter.SelectedIndex = 0;
            GetSortListProduct();
        }
        private void GetSortListProduct()
        {
            products = EFClass.Context.Product.ToList();
            products = products.Where(i => i.Title.Contains(tbSearch.Text)).ToList();
            switch (cmbSort.SelectedIndex)
            {
                case 0:
                    products = products.OrderBy(i => i.IdProduct).ToList();
                    break;
                case 1:
                    products = products.OrderBy(i => i.Title).ToList();
                    break;
                case 2:
                    products = products.OrderBy(i => i.Cost).ToList();
                    break;
                default:
                    break;
            }
            if (cmbFilter.SelectedIndex == 0)
            {
                LvProductList.ItemsSource = products;
            }
            else
            {
                products = products.Where(i => i.IdCategoryProduct == cmbFilter.SelectedIndex).ToList();
            }
            LvProductList.ItemsSource = products;
        }

        private void btnCart_Click(object sender, RoutedEventArgs e)
        {
            CartWindow cartWindow = new CartWindow();
            this.Hide();
            cartWindow.Show();
            this.Show();
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            HomeWindow homeWindow = new HomeWindow();
            homeWindow.Show();
            this.Close();
        }

        private void btnAddToCart_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            bool seek = true;
            if (button == null)
            {
                return;
            }

            var selectedProduct = button.DataContext as Product;
            if (selectedProduct != null)
            {
                for (int i = 0; i < CartClass.Products.Count; i++)
                {
                    if (CartClass.Products[i] == selectedProduct)
                    {
                        CartClass.Products[i].Quantity++;
                        seek = false;
                    }
                }
                if (seek)
                {
                    CartClass.Products.Add(selectedProduct);
                }
            }
        }

        private void btnAddEditProduct_Click(object sender, RoutedEventArgs e)
        {
            if (LvProductList.SelectedItem is Product)
            {
                var product = LvProductList.SelectedItem as Product;
                ProductAddEditWindow addEditProductWindow = new ProductAddEditWindow(product);
                this.Hide();
                addEditProductWindow.Show();
                this.Show();
            }
            else
            {
                ProductAddEditWindow addEditProductWindow = new ProductAddEditWindow();
                this.Hide();
                addEditProductWindow.Show();
                this.Show();
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (LvProductList.SelectedItem is Product)
            {
                var item = LvProductList.SelectedItem as Product;
                GetSortListProduct();
                var dialogResult = MessageBox.Show("Вы действительно хотите удалить?", "Внимание!", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (dialogResult == MessageBoxResult.Yes)
                {
                    EFClass.Context.Product.Remove(item);
                    EFClass.Context.SaveChanges();
                    MessageBox.Show("Запись успешно удалена!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    GetSortListProduct();
                }
                else { }
            }
            else
            {
                MessageBox.Show("Запись не выбрана", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void cmbSort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GetSortListProduct();
        }

        private void tbSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            GetSortListProduct();
        }

        private void cmbFilter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            GetSortListProduct();
        }

    }
}