using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class navLeft : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            Button1.Text = "Log out";
        }
        else if (Session["Admin"] != null)
        {
            Button1.Text = "Log out ";
        }
        else
        {
            Button1.Text = "Log in ";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Button1.Text == "Log in ")
        {
            Response.Redirect("~/Account/login2.aspx");
        }
        else
        {
            Session.RemoveAll();
            Response.Redirect("~/default.aspx");

        }
    }
}