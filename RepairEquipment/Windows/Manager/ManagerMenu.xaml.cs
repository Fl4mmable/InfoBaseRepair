using RepairEquipment.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Media.Imaging;
using System.Windows.Controls;
using ZXing;

namespace RepairEquipment.Windows.Manager
{
    /// <summary>
    /// Логика взаимодействия для ManagerMenu.xaml
    /// </summary>
    public partial class ManagerMenu : Window
    {
        public RepairEntities _context = new RepairEntities();
        public List<order> orderList = new List<order>();
        public ManagerMenu()
        {
            InitializeComponent();

            employeesCmb.ItemsSource = _context.employee.Where(s => s.post_id == 1).Select(s => new { fullName = (s.surname + " " + s.name + " " + s.patronymic).Trim() }).ToList();
            employeesCmb.DisplayMemberPath = "fullName";

            statusesCmb.ItemsSource = _context.status.ToList();
            statusesCmb.DisplayMemberPath = "name";

            orderList = _context.order.ToList();
            orderListDg.ItemsSource = orderList;

        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Hide();
        }

        private void saveAsBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var statuses = _context.status.ToList();
                var employees = _context.employee.Where(s => s.post_id == 1).Select(s => new { s.id, fullName = (s.surname + " " + s.name + " " + s.patronymic).Trim() }).ToList();

                order selectedOrder = orderList[orderListDg.SelectedIndex];

                selectedOrder.status_id = statuses[statusesCmb.SelectedIndex].id;
                selectedOrder.employee_id = employees[employeesCmb.SelectedIndex].id;
                selectedOrder.additional_info = newInfoTb.Text;
                selectedOrder.time_of_completion = Convert.ToInt32(newdate.Text);

                _context.SaveChanges();
                MessageBox.Show("Изменения сохранены");
                orderList = _context.order.ToList();
                orderListDg.ItemsSource = orderList;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void orderListDg_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            statusesCmb.SelectedIndex = (int)orderList[orderListDg.SelectedIndex].status_id;
            employeesCmb.SelectedIndex = (int)orderList[orderListDg.SelectedIndex].employee_id;
            newInfoTb.Text = orderList[orderListDg.SelectedIndex].additional_info.ToString();
            newdate.Text = orderList[orderListDg.SelectedIndex].time_of_completion.ToString();

        }
        private void GenerateQRCode(string url, System.Windows.Controls.Image imageControl)
        {
            BarcodeWriter barcodeWriter = new BarcodeWriter();
            barcodeWriter.Format = BarcodeFormat.QR_CODE;

         
            ZXing.Common.EncodingOptions encodingOptions = new ZXing.Common.EncodingOptions
            {
                Width = 300,  
                Height = 300, 
                Margin = 10    
            };

            barcodeWriter.Options = encodingOptions;

            // Генерация QR-кода
            var barcodeBitmap = barcodeWriter.Write(url);

            // Присвоение изображения элементу управления Image
            imageControl.Source = ConvertBitmapToBitmapImage(barcodeBitmap);
        }

        private System.Windows.Media.Imaging.BitmapImage ConvertBitmapToBitmapImage(System.Drawing.Bitmap bitmap)
        {
            using (MemoryStream memory = new MemoryStream())
            {
                bitmap.Save(memory, System.Drawing.Imaging.ImageFormat.Png);
                memory.Position = 0;

                System.Windows.Media.Imaging.BitmapImage bitmapImage = new System.Windows.Media.Imaging.BitmapImage();
                bitmapImage.BeginInit();
                bitmapImage.StreamSource = memory;
                bitmapImage.CacheOption = System.Windows.Media.Imaging.BitmapCacheOption.OnLoad;
                bitmapImage.EndInit();

                return bitmapImage;
            }
        }

        private void codebutton_Click(object sender, RoutedEventArgs e)
        {
            string urlToEncode = "https://forms.yandex.ru/u/657090e85056902a3f577104/"; // Замените на ваш URL
            GenerateQRCode(urlToEncode, codeimage);
        }
    }
}
