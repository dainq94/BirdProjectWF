using BirdRepository;
using BusinessObjects.Models;

namespace BirdService
{
    public class UserService : IUserService
    {
        private readonly IUserRepository _userRepository = null;
        public UserService()
        {
            _userRepository = new UserRepository();
        }
        public User GetUserByEmail(string email)
        {
            return _userRepository.getUserByEmail(email);
        }
    }
}