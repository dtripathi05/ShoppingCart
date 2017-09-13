using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

namespace ShoppingWebsite
{
    public partial class Home : System.Web.UI.Page
    {
        Dictionary<string, float> cartItem;
        static SqlConnection connect;
        Dictionary<int, int> count;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                connect = new SqlConnection(@"Data Source=TAVDESKRENT011;Initial Catalog=Products;User Id=sa;Password=test123!@#");
                connect.Open();
                SqlCommand command = new SqlCommand("select * from Products", connect);
                SqlDataReader reader = command.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
                connect.Close();
            }
        }
        protected void AddToCart(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "MoveToCart")
            {
                if (Session["quantity"] == null)
                {
                    count = new Dictionary<int, int>();
                    Session["quantity"] = count;
                }
                else
                {
                    count = (Dictionary<int, int>)Session["quantity"];
                }
                int rowIndex = Int32.Parse((string)e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                var pId = row.Cells[0].Text;
                var pName = row.Cells[1].Text + "-" + pId ;
                var cost = row.Cells[2].Text;
                if (!count.ContainsKey(int.Parse(pId)))
                {
                    count[int.Parse(pId)] = 1;
                }
                else count[int.Parse(pId)]++;
                if (ViewState["cartItem"] == null)
                {
                    cartItem = new Dictionary<string, float>();
                    cartItem[pName] = int.Parse(cost);
                    ViewState["cartItem"] = cartItem;
                    HttpContext.Current.Session["cartItem"] = cartItem;
                }
                else
                {
                    //cartItem = new Dictionary<string, float>();
                    cartItem = (Dictionary<string, float>)ViewState["cartItem"];
                    cartItem[pName] = int.Parse(cost);
                    HttpContext.Current.Session["cartItem"] = cartItem;
                }
            }
        }
        protected void GoToCart(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void AdminLogIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
    }
}