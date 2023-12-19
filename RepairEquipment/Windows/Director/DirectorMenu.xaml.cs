using RepairEquipment.Entities;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace RepairEquipment.Windows.Director
{
    /// <summary>
    /// Логика взаимодействия для DirectorMenu.xaml
    /// </summary>
    public partial class DirectorMenu : Window
    {
        public RepairEntities _context = new RepairEntities();
        public DirectorMenu()
        {
            InitializeComponent();

            postsCmb.ItemsSource = _context.post.ToList();
            postsCmb.DisplayMemberPath = "name";

            typesCrashCmb.ItemsSource = _context.crash_type.ToList();
            typesCrashCmb.DisplayMemberPath = "name";

            employeeListDg.ItemsSource = _context.employee.ToList();

            var orderList = _context.order.Select(s => new
            {
                s.id,
                s.equipment,
                fullName = (s.employee.surname + " " + s.employee.name + " " + s.employee.patronymic).Trim(),
                s.crash_type,
                s.description_crash,
                s.priority_order,
                s.crash_reason,
                s.additional_info,
                s.time_of_completion
            }).ToList();
            ordersListDg.ItemsSource = orderList;

            int amountCompleteOrders = _context.order.Where(s => s.status_id == 1).Count();
            int amountAllOrders = _context.order.Count();

            orderStatslbl.Text = $"Выполнено {amountCompleteOrders} из {amountAllOrders} заявок.";

            double averageDays = (double)_context.order.Average(s => s.time_of_completion);
            averageDaylbl.Text = $"Среднее выполнение заявок составляет {averageDays} дня(-ей).";
        }

        private void BackBtn_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
            this.Hide();
        }

        private void employeeListDg_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                var employees = _context.employee.ToList();
                employee selectedEmployee = employees[employeeListDg.SelectedIndex];
                surnameTb.Text = selectedEmployee.surname;
                nametb.Text = selectedEmployee.name;
                patronymicTb.Text = selectedEmployee.patronymic;
                loginTb.Text = selectedEmployee.login;
                passwordTb.Text = selectedEmployee.password;
                postsCmb.SelectedIndex = (int)selectedEmployee.post_id - 1;
        
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void addEmployeeBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var newEmployee = new employee
                {
                    surname = surnameTb.Text,
                    name = nametb.Text,
                    patronymic = patronymicTb.Text,
                    login = loginTb.Text,
                    password = passwordTb.Text,
                    post_id = postsCmb.SelectedIndex + 1
                };
                _context.employee.Add(newEmployee);
                _context.SaveChanges();
                MessageBox.Show("Сотрудник добавлен!");

                employeeListDg.ItemsSource = _context.employee.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void editEmployeeBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var employees = _context.employee.Where(s => s.post_id == 1 || s.post_id == 2 || s.post_id ==3).ToList();
                employee selectedEmployee = employees[employeeListDg.SelectedIndex];

                selectedEmployee.surname = surnameTb.Text;
                    selectedEmployee.name = nametb.Text;
                    selectedEmployee.patronymic = patronymicTb.Text;
                    selectedEmployee.login = loginTb.Text;
                    selectedEmployee.password = passwordTb.Text;
                selectedEmployee.post_id = postsCmb.SelectedIndex + 1;
                _context.SaveChanges();
                MessageBox.Show("Сотрудник успешно изменён!");


                employeeListDg.ItemsSource = _context.employee.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void typesCrashCmb_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var crashesTypes = _context.crash_type.ToList();

            crash_type selectedType = crashesTypes[typesCrashCmb.SelectedIndex];

            var statsCrashTypes = _context.order.Where(s => s.crash_type.name == selectedType.name).Select(s => new
            {
                s.id,
                s.equipment,
                fullName = (s.employee.surname + " " + s.employee.name + " " + s.employee.patronymic).Trim(),
                s.crash_type,
                s.description_crash,
                s.priority_order,
                s.crash_reason,
                s.additional_info,
                s.time_of_completion
            }).ToList();
            ordersListDg.ItemsSource = statsCrashTypes;

        }

        private void resetBtn_Click(object sender, RoutedEventArgs e)
        {
            var orderList = _context.order.Select(s => new
            {
                s.id,
                s.equipment,
                fullName = (s.employee.surname + " " + s.employee.name + " " + s.employee.patronymic).Trim(),
                s.crash_type,
                s.description_crash,
                s.priority_order,
                s.crash_reason,
                s.additional_info,
                s.time_of_completion
            }).ToList();
            ordersListDg.ItemsSource = orderList;
        }
    }
}
