using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShoppingWebsite
{
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void lbInsert_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["Product_Name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TextName")).Text;
            SqlDataSource1.InsertParameters["Price"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TextPrice")).Text;
            SqlDataSource1.InsertParameters["Quantity"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TextQuantity")).Text;
            SqlDataSource1.Insert();
        }
        protected void Btn_Home_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

    }
}