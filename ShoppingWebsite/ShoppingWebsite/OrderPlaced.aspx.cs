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
            Label2.Text = HttpContext.Current.Session["orderId"].ToString();
        }

        protected void ContinueShopping(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}