using BusinessObjects.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace BirdDAO
{
    public partial class BirdeePlatformContext : DbContext
    {
        public BirdeePlatformContext()
        {
        }

        public BirdeePlatformContext(DbContextOptions<BirdeePlatformContext> options)
            : base(options)
        {
        }

        public virtual DbSet<BestSeller> BestSellers { get; set; } = null!;
        public virtual DbSet<BirdDetail> BirdDetails { get; set; } = null!;
        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<Collection> Collections { get; set; } = null!;
        public virtual DbSet<ImageProduct> ImageProducts { get; set; } = null!;
        public virtual DbSet<NewArrival> NewArrivals { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderDetail> OrderDetails { get; set; } = null!;
        public virtual DbSet<Payment> Payments { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<ProductCollection> ProductCollections { get; set; } = null!;
        public virtual DbSet<ProductTag> ProductTags { get; set; } = null!;
        public virtual DbSet<RateProduct> RateProducts { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<StatusOrder> StatusOrders { get; set; } = null!;
        public virtual DbSet<Tag> Tags { get; set; } = null!;
        public virtual DbSet<BusinessObjects.Models.Type> Types { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer(GetConnectionString());
            }
        }
        private string GetConnectionString()
        {
            IConfiguration config = new ConfigurationBuilder()
                 .SetBasePath(Directory.GetCurrentDirectory())
                        .AddJsonFile("appsettings.json", true, true)
                        .Build();
            var strConn = config["ConnectionStrings:DefaultConnectionStringDB"];

            return strConn;
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BestSeller>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Best_Seller");

                entity.Property(e => e.DeleteFlag).HasColumnName("deleteFlag");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.HasOne(d => d.Product)
                    .WithMany()
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_Best_Seller_Products");
            });

            modelBuilder.Entity<BirdDetail>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Bird_Details");

                entity.Property(e => e.Dob)
                    .HasColumnType("date")
                    .HasColumnName("dob");

                entity.Property(e => e.Gender).HasColumnName("gender");

                entity.Property(e => e.Height).HasColumnName("height");

                entity.Property(e => e.Origin)
                    .HasMaxLength(250)
                    .HasColumnName("origin");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.Weight).HasColumnName("weight");

                entity.HasOne(d => d.Product)
                    .WithMany()
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_Bird_Details_Products");
            });

            modelBuilder.Entity<Category>(entity =>
            {
                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.CategoryName).HasMaxLength(255);

                entity.Property(e => e.Description).HasColumnType("text");

                entity.HasOne(d => d.Tag)
                    .WithMany(p => p.Categories)
                    .HasForeignKey(d => d.TagId)
                    .HasConstraintName("FK_Categories_Tags");
            });

            modelBuilder.Entity<Collection>(entity =>
            {
                entity.Property(e => e.CollectionId).HasColumnName("CollectionID");

                entity.Property(e => e.CollectionName).HasMaxLength(255);

                entity.Property(e => e.Description).HasColumnType("text");

                entity.Property(e => e.Link)
                    .IsUnicode(false)
                    .HasColumnName("link");
            });

            modelBuilder.Entity<ImageProduct>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Image_Product");

                entity.Property(e => e.DeleteFlag).HasColumnName("deleteFlag");

                entity.Property(e => e.Image)
                    .HasColumnType("text")
                    .HasColumnName("image");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.HasOne(d => d.Product)
                    .WithMany()
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_Image_Product_Products");
            });

            modelBuilder.Entity<NewArrival>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("New_Arrival");

                entity.Property(e => e.DeleteFlag).HasColumnName("deleteFlag");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.HasOne(d => d.Product)
                    .WithMany()
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_New_Arrival_Products");
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.OrderId)
                    .ValueGeneratedNever()
                    .HasColumnName("OrderID");

                entity.Property(e => e.CustomerAddress)
                    .HasMaxLength(255)
                    .HasColumnName("Customer_Address");

                entity.Property(e => e.CustomerEmail)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("Customer_Email");

                entity.Property(e => e.CustomerName)
                    .HasMaxLength(255)
                    .HasColumnName("Customer_Name");

                entity.Property(e => e.CustomerPhone)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("Customer_Phone");

                entity.Property(e => e.DateTime).HasColumnType("datetime");

                entity.Property(e => e.TotalOrder).HasColumnType("money");

                entity.HasOne(d => d.DeliverStatusNavigation)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.DeliverStatus)
                    .HasConstraintName("FK_Orders_StatusOrder");

                entity.HasOne(d => d.OrderFromUserNavigation)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.OrderFromUser)
                    .HasConstraintName("FK_Orders_User1");

                entity.HasOne(d => d.PaymentMethodNavigation)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.PaymentMethod)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Orders_Payments");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.HasKey(e => e.OrderDetailsId);

                entity.Property(e => e.TotalPrice).HasColumnType("money");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderDetails_Orders");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_OrderDetails_Products");
            });

            modelBuilder.Entity<Payment>(entity =>
            {
                entity.Property(e => e.PaymentId).ValueGeneratedNever();

                entity.Property(e => e.Method).HasMaxLength(255);
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.ClassValue).HasMaxLength(50);

                entity.Property(e => e.CreateDate)
                    .HasColumnType("date")
                    .HasColumnName("createDate");

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.Price).HasColumnType("money");

                entity.Property(e => e.ShopId).HasColumnName("ShopID");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_Products_Products");
            });

            modelBuilder.Entity<ProductCollection>(entity =>
            {
                entity.HasKey(e => new { e.ProductId, e.CollectionId })
                    .HasName("Product_Collection_PKs");

                entity.ToTable("Product_Collection");

                entity.HasOne(d => d.Collection)
                    .WithMany(p => p.ProductCollections)
                    .HasForeignKey(d => d.CollectionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Collection_Collections");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductCollections)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Collection_Products");
            });

            modelBuilder.Entity<ProductTag>(entity =>
            {
                entity.HasKey(e => new { e.ProductId, e.TagId })
                    .HasName("Product_Tag_PKs");

                entity.ToTable("Product_Tag");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductTags)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Tag_Products");

                entity.HasOne(d => d.Tag)
                    .WithMany(p => p.ProductTags)
                    .HasForeignKey(d => d.TagId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_Tag_Tags1");
            });

            modelBuilder.Entity<RateProduct>(entity =>
            {
                entity.HasKey(e => e.RateId);

                entity.ToTable("Rate_Product");

                entity.Property(e => e.RateId).HasColumnName("RateID");

                entity.Property(e => e.CustomerId).HasColumnName("CustomerID");

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.DeleteFlag).HasColumnName("deleteFlag");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.RateProducts)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK_Rate_Product_User");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.RateProducts)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_Rate_Product_Products");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.Property(e => e.RoleName).HasMaxLength(255);
            });

            modelBuilder.Entity<StatusOrder>(entity =>
            {
                entity.ToTable("StatusOrder");

                entity.Property(e => e.StatusOrderId)
                    .ValueGeneratedNever()
                    .HasColumnName("StatusOrderID");

                entity.Property(e => e.StatusValue).HasMaxLength(255);
            });

            modelBuilder.Entity<Tag>(entity =>
            {
                entity.Property(e => e.Description).HasColumnType("text");

                entity.Property(e => e.TagName).HasMaxLength(255);
            });

            modelBuilder.Entity<BusinessObjects.Models.Type>(entity =>
            {
                entity.ToTable("Type");

                entity.Property(e => e.TypeId)
                    .ValueGeneratedNever()
                    .HasColumnName("TypeID");

                entity.Property(e => e.Name).HasMaxLength(255);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.ToTable("User");

                entity.Property(e => e.UserId).HasColumnName("UserID");

                entity.Property(e => e.Avatar).HasColumnType("text");

                entity.Property(e => e.Dob)
                    .HasColumnType("date")
                    .HasColumnName("DOB");

                entity.Property(e => e.Email)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.EmailId)
                    .HasColumnType("text")
                    .HasColumnName("EmailID");

                entity.Property(e => e.FullName).HasMaxLength(255);

                entity.Property(e => e.Gender)
                    .HasMaxLength(50)
                    .HasColumnName("gender");

                entity.Property(e => e.ManagerId).HasColumnName("ManagerID");

                entity.Property(e => e.Password)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Phone)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.Property(e => e.RoleId).HasColumnName("RoleID");

                entity.HasOne(d => d.Manager)
                    .WithMany(p => p.InverseManager)
                    .HasForeignKey(d => d.ManagerId)
                    .HasConstraintName("FK_User_User");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Users)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_User_Role");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
