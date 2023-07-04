using PaperStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace PaperStore
{
    public partial class MainWindow : Window
    {
        User? currentUser = null;
        public MainWindow(User user)
        {
            InitializeComponent();

            using (PaperStoreContext db = new PaperStoreContext())
            {
                if (user != null)
                {
                    currentUser = user;
                    statusUser.Text = $"{user.RoleNavigation.Name}: {user.Surname} {user.Name} \r{user.Patronymic} \r\t";
                    MessageBox.Show($"{user.RoleNavigation.Name}: {user.Surname} {user.Name} {user.Patronymic} \r\t");

                }

                productlistView.ItemsSource = db.Products.ToList();

                List<string> sortList = new List<string>() { "По возрастанию цены", "По убыванию цены" };
                sortProductComboBox.ItemsSource = sortList.ToList();

                List<string> filtertList = db.Products.Select(u => u.Category).Distinct().ToList();
                filtertList.Insert(0, "Все товары");
                filterProductComboBox.ItemsSource = filtertList.ToList();

                countProducts.Text = $"Количество: {db.Products.Count()}";

                if (currentUser == null || currentUser.RoleNavigation.Name != "Менеджер")
                {
                    addProduct.Visibility = Visibility.Collapsed;
                    deleteProduct.Visibility = Visibility.Collapsed;
                }
            }
        }

        private void exitButtonClick(object sender, RoutedEventArgs e)
        {
            new LoginWindow().Show();
            this.Close();
        }

        private void sortProductComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            using (PaperStoreContext db = new PaperStoreContext())
            {
                if (sortProductComboBox.SelectedValue == "По убыванию цены")
                {
                    productlistView.ItemsSource = db.Products.OrderByDescending(u => u.Cost).ToList();
                }

                if (sortProductComboBox.SelectedValue == "По возрастанию цены")
                {
                    productlistView.ItemsSource = db.Products.OrderBy(u => u.Cost).ToList();
                }
            }
            UpdateProducts();
        }

        private void filterProductComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            using (PaperStoreContext db = new PaperStoreContext())
            {
                if (db.Products.Select(u => u.Manufacturer).Distinct().ToList().Contains(filterProductComboBox.SelectedValue))
                {
                    productlistView.ItemsSource = db.Products.Where(u => u.Manufacturer == filterProductComboBox.SelectedValue).ToList();
                }
                else
                {
                    productlistView.ItemsSource = db.Products.ToList();
                }
            }
            UpdateProducts();
        }

        private void сlearButton_Click(object sender, RoutedEventArgs e)
        {
            searchBox.Text = "";
            sortProductComboBox.SelectedIndex = -1;
            filterProductComboBox.SelectedIndex = -1;
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            using (PaperStoreContext db = new PaperStoreContext())
            {
                if (searchBox.Text.Length > 0)
                {
                    productlistView.ItemsSource = db.Products.Where(u => u.Name.Contains(searchBox.Text) || u.Description.Contains(searchBox.Text)).ToList();
                }

            }
            UpdateProducts();
        }

        private void UpdateProducts()
        {
            using (PaperStoreContext db = new PaperStoreContext())
            {
                var currentProducts = db.Products.ToList();
                productlistView.ItemsSource = currentProducts;

                //Сортировка
                if (sortProductComboBox.SelectedIndex != -1)
                {
                    if (sortProductComboBox.SelectedValue == "По убыванию цены")
                    {
                        currentProducts = currentProducts.OrderByDescending(u => u.Cost).ToList();
                    }
                    if (sortProductComboBox.SelectedValue == "По возрастанию цены")
                    {
                        currentProducts = currentProducts.OrderBy(u => u.Cost).ToList();
                    }
                }

                // Фильтрация
                if (filterProductComboBox.SelectedIndex != -1)
                {
                    if (db.Products.Select(u => u.Category).Distinct().ToList().Contains(filterProductComboBox.SelectedValue))
                    {
                        currentProducts = currentProducts.Where(u => u.Category == filterProductComboBox.SelectedValue.ToString()).ToList();
                    }
                    else
                    {
                        currentProducts = currentProducts.ToList();
                    }
                }

                // Поиск
                if (searchBox.Text.Length > 0)
                {
                    currentProducts = currentProducts.Where(u => u.Name.Contains(searchBox.Text) || u.Description.Contains(searchBox.Text)).ToList();
                }
                productlistView.ItemsSource = currentProducts;

                countProducts.Text = $"Количество: {currentProducts.Count} из {db.Products.ToList().Count}";
            }
        }

        private void addProductButtonClick(object sender, RoutedEventArgs e)
        {
            new AddProductWindow(null).ShowDialog();
        }

        private void EditProduct_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (currentUser == null || currentUser.RoleNavigation.Name == "Менеджер")
            {
                Product p = (sender as ListView).SelectedItem as Product;
                new AddProductWindow(p).ShowDialog();
            }

        }
    

    private void delProductButton(object sender, RoutedEventArgs e)
        {
            using (PaperStoreContext db = new PaperStoreContext())
            {
                var product = (productlistView.SelectedItem) as Product;

                    if (product != null)
                    {

                        if (MessageBox.Show($"Вы точно хотите удалить {product.Name}", "Внимание!",
                            MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                        {
                            db.Products.Remove(product);
                            db.SaveChanges();
                            MessageBox.Show($"Товар {product.Name} удален!");
                            productlistView.ItemsSource = db.Products.ToList();
                            countProducts.Text = $"Количество: {db.Products.Count()}";
                        }
                    }
            }
        }
    }
}
