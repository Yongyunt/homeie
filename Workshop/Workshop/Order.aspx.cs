using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    List<Class1> order_list;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        order_list = (List<Class1>)Session["Order"];

        if (!IsPostBack)
        {
            GridView1.DataSource = order_list;
            GridView1.DataBind();
        }
        this.calculator();
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {


        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument);

            for (int i = 0; i < order_list.Count; i++)
            {
                System.Diagnostics.Debug.WriteLine("IN FOR" + id + " CAT " + order_list[i].P_ID);

                if (order_list[i].P_ID == id)
                {
                    System.Diagnostics.Debug.WriteLine("IN IF" + order_list[i].ToString());

                    order_list.RemoveAt(i);
                    GridView1.DataSource = order_list;
                    GridView1.DataBind();
                    System.Diagnostics.Debug.WriteLine("AFTER IF" + order_list.Count);


                }
            }
        }



    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        this.calculator();
    }
    protected void calculator()
    {
        long sumcal = 0;
        foreach (GridViewRow row in GridView1.Rows)
        {

            long number = long.Parse(row.Cells[2].Text);
            long price = long.Parse(row.Cells[1].Text);
            sumcal += number * price;
        }
        GridViewRow gvrow = GridView1.Rows[1];

        Label2.Text = sumcal.ToString();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}

