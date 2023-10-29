using BirdDAO;
using BusinessObjects.Models;

namespace BirdRepository
{
    public class UserRepository : IUserRepository
    {
        public User getUserByEmail(string email)
        => UserDAO.Instance.GetUserByEmail(email);
    }
}