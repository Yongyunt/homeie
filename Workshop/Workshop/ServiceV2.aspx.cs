using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Service_reed : System.Web.UI.Page
{
    List<Class1> Class1s = new List<Class1>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["S_ID"]=="2")
        {
            Label2.Text = "รีด";
            
        }
        if (Request.QueryString["S_ID"] == "3")
        {
            Label2.Text = "ซัก&รีด";
            Button1.Text = "Submit";
        }

        
    }

    protected void Button2_Click(object sender, EventArgs e)
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
            long price = long.Parse(row.Cells[2].Text);
            sumcal += number * price;
        }
        GridViewRow gvrow = GridView1.Rows[2];

        Label1.Text = sumcal.ToString();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Lc();
        //if (Session["Order_Suckmydick"] == null)
        //{
         //   Response.Redirect("ServiceV2.aspx?S_ID=1");
        //}
      
        if (Request.QueryString["S_ID"]=="1")
        {
        Response.Redirect("ServiceV2.aspx?S_ID=2");
        }
        else if (Request.QueryString["S_ID"] == "2")
        {
            Response.Redirect("ServiceV2.aspx?S_ID=3");
        }
        else if (Request.QueryString["S_ID"] == "3")
        {
            Response.Redirect("Order.aspx");   
        }
        
        
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
            int price = int.Parse(row.Cells[2].Text);
            string name = row.Cells[0].Text;

            if (number > 0)
            {
                Class1s.Add(new Class1(P_ID1, QueryString, number, name, price));
            }

        }

        if (Request.QueryString["S_ID"] == "1")
        {

            Session["Order_Suckmydick"] = Class1s;
        }
        else if (Request.QueryString["S_ID"] == "2")
        {
            Session["Order_Suckmydick2"] = Class1s;
        }
        else if (Request.QueryString["S_ID"] == "3")
        {
            Session["Order_Suckmydick3"] = Class1s;
        }
        else
        {
           
        }
    }
}