using RepairEquipment.Entities;
using RepairEquipment.Windows.Director;
using RepairEquipment.Windows.Executor;
using RepairEquipment.Windows.Manager;
using System;
using System.Linq;
using System.Windows;

namespace RepairEquipment.Windows
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public RepairEntities _context = new RepairEntities();
        public MainWindow()
        {
            InitializeComponent();
        }

        private void AuthBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(loginTb.Text) || !string.IsNullOrWhiteSpace(passwordPb.Password))
                {
                    var employee = _context.employee.Where(s => s.login == loginTb.Text && s.password == passwordPb.Password).FirstOrDefault();

                    if (employee != null)
                    {
                        switch (employee.post_id)
                        {
                            case 1:
                                MessageBox.Show("Успешная авторизация! Вы зашли как Исполнитель!");
                                ExecutorMenu executorMenu = new ExecutorMenu();
                                executorMenu.Show();
                                this.Hide();
                                break;
                            case 2:
                                MessageBox.Show("Успешная авторизация! Вы зашли как Менеджер!");
                                ManagerMenu managerMenu = new ManagerMenu();
                                managerMenu.Show();
                                this.Hide();
                                break;
                            case 3:
                                MessageBox.Show("Успешная авторизация! Вы зашли как Директор!");
                                DirectorMenu directorMenu = new DirectorMenu();
                                directorMenu.Show();
                                this.Hide();
                                break;
                        }
                    }
                    else
                    {
                        MessageBox.Show("Неверный логин или пароль!");
                    }
                }
        }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
}
    }
}
