using RepairEquipment.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;

namespace RepairEquipment.Windows.Executor
{
    /// <summary>
    /// Логика взаимодействия для ExecutorMenu.xaml
    /// </summary>
    public partial class ExecutorMenu : Window
    {
        public RepairEntities _context = new RepairEntities();
        public List<order> orderList = new List<order>();
        public ExecutorMenu()
        {
            InitializeComponent();

            equipmentsCmb.ItemsSource = _context.equipment.ToList();
            equipmentsCmb.DisplayMemberPath = "name";

            crashesCmb.ItemsSource = _context.crash_type.ToList();
            crashesCmb.DisplayMemberPath = "name";

            clientsCmb.ItemsSource = _context.client.Select(s => new { fullName = (s.surname + " " + s.name + " " + s.patronymic).Trim() }).ToList();
            clientsCmb.DisplayMemberPath = "fullName";

            employeeCmb.ItemsSource = _context.employee.Where(s => s.post_id == 1).Select(s => new { fullName = (s.surname + " " + s.name + " " + s.patronymic).Trim() }).ToList();
            employeeCmb.DisplayMemberPath = "fullName";

            prioritesCmb.ItemsSource = _context.priority_order.ToList();
            prioritesCmb.DisplayMemberPath = "name";

            reasonsCmb.ItemsSource = _context.crash_reason.ToList();
            reasonsCmb.DisplayMemberPath = "name";

            materialsCmb.ItemsSource = _context.material.ToList();
            materialsCmb.DisplayMemberPath = "name";

            orderList = _context.order.Where(x => x.status_id == 2).ToList();
            orderListDg.ItemsSource = orderList;
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Hide();
        }

        private void applicationBtn_Click(object sender, RoutedEventArgs e)
        {

            try
            {
                if (equipmentsCmb.SelectedIndex != -1 && crashesCmb.SelectedIndex != -1 && clientsCmb.SelectedIndex != -1 && employeeCmb.SelectedIndex != -1 && prioritesCmb.SelectedIndex != -1 && crashesCmb.SelectedIndex != -1 && !string.IsNullOrWhiteSpace(descriptionCrashTb.Text) && !string.IsNullOrWhiteSpace(additionalTb.Text) || !string.IsNullOrWhiteSpace(timeTb.Text))
                {
                    var employees = _context.employee.Where(s => s.post_id == 1).Select(s => new { s.id, fullName = (s.surname + " " + s.name + " " + s.patronymic).Trim() }).ToList();
                    var newOrder = new order
                    {
                        date = DateTime.Now,
                        equipment_id = equipmentsCmb.SelectedIndex + 1,
                        crash_type_id = crashesCmb.SelectedIndex + 1,
                        client_id = clientsCmb.SelectedIndex + 1,
                        employee_id = employees[employeeCmb.SelectedIndex].id,
                        status_id = 2,
                        description_crash = descriptionCrashTb.Text,
                        priority_order_id = prioritesCmb.SelectedIndex + 1,
                        crash_reason_id = crashesCmb.SelectedIndex + 1,
                        additional_info = additionalTb.Text,
                        time_of_completion = Convert.ToInt32(timeTb.Text)
                    };
                    _context.order.Add(newOrder);
                    _context.SaveChanges();
                    MessageBox.Show("Заявка оставлена!");
                }
                else
                {
                    MessageBox.Show("Заполните все поля!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void repairBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (materialsCmb.SelectedIndex == -1 || countTb.Text == "")
                {
                    MessageBox.Show("Заполните поля!");
                }
                else
                {
                    var selectedOrderIndex = orderListDg.SelectedIndex;

                    if (selectedOrderIndex == -1)
                    {
                        MessageBox.Show("Выберите заказ для ремонта!");
                        return;
                    }

                    var selectedOrder = orderList[selectedOrderIndex];

                    var newMaterialList = new material_list
                    {
                        material_id = materialsCmb.SelectedIndex + 1,
                        count = Convert.ToInt32(countTb.Text),
                        order_id = selectedOrder.id
                    };
                    _context.material_list.Add(newMaterialList);

                    selectedOrder.status_id = 1;

                    _context.SaveChanges();
                    MessageBox.Show("Успешно!");

                  
                    orderList = _context.order.Where(x => x.status_id == 2).ToList();
                    orderListDg.ItemsSource = orderList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }


        private void addClientBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(surnameTb.Text) && !string.IsNullOrWhiteSpace(nameTb.Text) && !string.IsNullOrWhiteSpace(patronymicTb.Text) && !string.IsNullOrWhiteSpace(phoneTb.Text))
                {
                    var newClient = new client
                    {
                        surname = surnameTb.Text,
                        name = nameTb.Text,
                        patronymic = patronymicTb.Text,
                        phone = phoneTb.Text
                    };
                    _context.client.Add(newClient);
                    _context.SaveChanges();
                    MessageBox.Show("Клиент добавлен!");

                    clientsCmb.ItemsSource = _context.client.Select(s => new { fullName = (s.surname + " " + s.name + " " + s.patronymic).Trim() }).ToList();
                    clientsCmb.DisplayMemberPath = "fullName";
                }
                else
                {
                    MessageBox.Show("Введите все поля!");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void TabControl_SelectionChanged(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            orderList = _context.order.Where(x => x.status_id == 2).ToList();
            orderListDg.ItemsSource = orderList;
        }
    }
}
