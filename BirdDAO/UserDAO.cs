using BusinessObjects.Models;

namespace BirdDAO
{
    public class UserDAO
    {
        private static UserDAO instance;
        public static UserDAO Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new UserDAO();
                }
                return instance;
            }
        }
        public User GetUserByEmail(String email)
        {
            try
            {
                var dbContent = new BirdeePlatformContext();
                return dbContent.Users.SingleOrDefault(m => m.Email.Equals(email));
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
