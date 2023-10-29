using BusinessObjects.Models;

namespace BirdRepository
{
    public interface IUserRepository
    {
        User getUserByEmail(string email);
    }
}
