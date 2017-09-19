using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using System.Web.Configuration;

namespace ShoppingWebsite
{
    public partial class Home : System.Web.UI.Page
    {
        Dictionary<string, float> cartItem;
        static SqlConnection connect;
        Dictionary<int, int> count;
        static string connectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            connectionString = WebConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString;
           // connectionString = "Data Source=TAVDESK043;Initial Catalog=Products;User Id=sa;Password=test123!@#";
            using (connect=new SqlConnection(connectionString)) {
                if (!IsPostBack)
                {
                    try
                    {
                       // connect = new SqlConnection(@"Data Source=TAVDESK043;Initial Catalog=Products;User Id=sa;Password=test123!@#");
                        connect.Open();
                        SqlCommand command = new SqlCommand("select * from Products", connect);
                        SqlDataReader reader = command.ExecuteReader();
                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>if(confirm('Something Bad happened, Please contact Administrator!!!!')){window.location=Home.aspx}</script>");
                    }

                }
            } }
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
        protected void Btn_GoToCart(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
        protected void Btn_AdminLogIn(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
    }
}