using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingWebsite
{
    public partial class OrderPlaced : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Label2.Text = HttpContext.Current.Session["orderId"].ToString();
            }
            catch (Exception ex)
            {
                Response.Write("<script>if(confirm('Something Bad happened, Please contact Administrator!!!!')){window.location=Home.aspx}</script>");
            }
        }

        protected void Btn_ContinueShopping(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}