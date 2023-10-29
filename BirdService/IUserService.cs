using BusinessObjects.Models;

namespace BirdService
{
    public interface IUserService
    {
        User GetUserByEmail(string email);
    }
}
