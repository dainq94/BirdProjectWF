using BirdService;
using BusinessObjects.Models;

namespace BirdManagementSystem
{
    public partial class Form1 : Form
    {
        private readonly IUserService _userService = null;
        public Form1()
        {
            InitializeComponent();
            _userService = new UserService();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                User user = new User();
                user = _userService.GetUserByEmail(txtUsername.Text.Trim());
                if (user != null && txtPassword.Text.Trim().Equals(user.Password))
                {
                    //MainForm mainForm = new MainForm();
                    //mainForm.Show();
                    MessageBox.Show("Hello may ku8");
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("Please check username and password");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }
    }
}