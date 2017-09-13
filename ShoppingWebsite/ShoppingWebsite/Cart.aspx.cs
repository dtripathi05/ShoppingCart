using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Generic.Dictionary<string, float>;

namespace ShoppingWebsite
{
    public partial class Cart : System.Web.UI.Page
    {
        static string connectionString;
        Dictionary<string, float> cartItems;
        Dictionary<int, int> itemCount; 
        Label[] productName;
        Label[] productId;
        Label[] price;
        Label[] quantity;
        Label amount, totalPrice;
        float total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = "Data Source=TAVDESKRENT011;Initial Catalog=Products;User Id=sa;Password=test123!@#";
            cartItems = (Dictionary<string, float>)(HttpContext.Current.Session["cartItem"]);
            itemCount = (Dictionary<int, int>)Session["quantity"];
            KeyCollection coll = cartItems.Keys;
            List<string> items = coll.ToList();
            productName = new Label[cartItems.Count];
            price = new Label[cartItems.Count];
            productId = new Label[cartItems.Count];
            quantity = new Label[cartItems.Count];
            for (int i = 0; i < cartItems.Count; i++)
            {
                productName[i] = new Label();
                price[i] = new Label();
                productId[i] = new Label();
                quantity[i] = new Label();
                string tmp = items[i];
                var str = tmp.Split('-');
                productId[i].Text = str[1];
                productName[i].Text = str[0];
                total += (cartItems[items[i]])* (itemCount[Convert.ToInt32(str[1])]);
                price[i].Text = cartItems[items[i]].ToString();
                quantity[i].Text = itemCount[Convert.ToInt32(str[1])].ToString();
                this.Controls.Add(productName[i]);
                this.Controls.Add(new LiteralControl("          "));
                this.Controls.Add(productId[i]);
                this.Controls.Add(new LiteralControl("          "));
                this.Controls.Add(quantity[i]);
                this.Controls.Add(new LiteralControl("<br >"));
                this.Controls.Add(price[i]);
                this.Controls.Add(new LiteralControl("<br >"));
                this.Controls.Add(new LiteralControl("<br >"));
            }
            amount = new Label();
            totalPrice = new Label();
            amount.Text = total.ToString();
            totalPrice.Text = "Total Price: ";
            this.Controls.Add(totalPrice);
            this.Controls.Add(amount);
            //DataTable dt = new DataTable();
            //dt.Columns.Add("ProductName", typeof(string));
            //dt.Columns.Add("ProductId", typeof(int));
            //dt.Columns.Add("Price", typeof(float));
            //dt.Columns.Add("Quantity", typeof(int));

        }

        protected void Onclick(object sender, EventArgs e)
        {
            var orderId = SaveOrder();
            var cart = (Dictionary<string, float>)(HttpContext.Current.Session["cartItem"]);

            foreach (var key in cart.Keys)
            {
                var str = key.Split('-');
                var pId= str[1];
                var PName= str[0];
                var Quantity=((Dictionary<int, int>)Session["quantity"])[Convert.ToInt32(str[1])];
                SaveOrderItem(orderId, pId, cart[key],Quantity);
            }
            Session["cart"] = new Dictionary<string, int>();
            Response.Redirect("OrderPlaced.aspx");
        }
        private void SaveOrderItem(Guid orderId, string productId, float price,int quantity)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string command = $"insert into OrderDetails values('{productId}','{orderId}','{quantity}','{price}')";
                SqlCommand cmd = new SqlCommand(command, conn);
                cmd.ExecuteNonQuery();
            }
        }
        private Guid SaveOrder()
        {
            var orderId = Guid.NewGuid();
            HttpContext.Current.Session["orderId"] = orderId;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string command = $"insert into [Order] values('{orderId}',CURRENT_TIMESTAMP,'{total}')";
                SqlCommand cmd = new SqlCommand(command, conn);
                cmd.ExecuteNonQuery();
                return orderId;
            }
        }

    }
}