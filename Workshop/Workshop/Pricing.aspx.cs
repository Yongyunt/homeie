using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pricing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

  

    protected void Button1_Click1(object sender, EventArgs e)
    {
        this.calculator();
    }
    protected void calculator()
    {
        long sumcal = 0;
        foreach (GridViewRow row in GridView1.Rows)
        {
            TextBox txtbox = (TextBox)row.FindControl("txtcal");
            long number = long.Parse(txtbox.Text);
            long price = long.Parse(row.Cells[1].Text);
            sumcal += number * price;
        }
        GridViewRow gvrow = GridView1.Rows[1];

        Label1.Text = sumcal.ToString();
       // Response.RedirectPermanent("Pricing.aspx?S_ID=1");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.RedirectPermanent("Order.aspx");
    }
}