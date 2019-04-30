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
    List<Class1> Class1s = new List<Class1>();

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
       
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Lc();
        Response.RedirectPermanent("Order.aspx");
    }
    private void Lc()
    {

        foreach (GridViewRow row in GridView1.Rows)
        {
            TextBox txtbox = (TextBox)row.FindControl("txtcal");
            HiddenField P_ID = (HiddenField)row.FindControl("HFID");
            int number = int.Parse(txtbox.Text);
            int P_ID1 = int.Parse(P_ID.Value);
            int QueryString = int.Parse(Request.QueryString["S_ID"]);
            int price = int.Parse(row.Cells[1].Text);
            string name = row.Cells[0].Text;

            if (number > 0 )
            {
                Class1s.Add(new Class1(P_ID1, QueryString, number, name, price));
            }

        }


       
        Session["Order_Suckmydick"] = Class1s;
    }


    
}