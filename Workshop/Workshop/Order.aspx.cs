using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
{
    List<Class1> order_list;
    List<Class1> order_list1;
    List<Class1> order_list2;

    protected void Page_Load(object sender, EventArgs e)
    {

        order_list = (List<Class1>)Session["Order_Suckmydick"];
        order_list1 = (List<Class1>)Session["Order_Suckmydick2"];
        order_list2 = (List<Class1>)Session["Order_Suckmydick3"];

        if (!IsPostBack)
        {
            GridView1.DataSource = order_list;
            GridView2.DataSource = order_list1;
            GridView3.DataSource = order_list2;

            GridView1.DataBind();
            GridView2.DataBind();
            GridView3.DataBind();

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
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument);

            for (int i = 0; i < order_list1.Count; i++)
            {
                System.Diagnostics.Debug.WriteLine("IN FOR" + id + " CAT " + order_list1[i].P_ID);

                if (order_list1[i].P_ID == id)
                {
                    System.Diagnostics.Debug.WriteLine("IN IF" + order_list1[i].ToString());

                    order_list1.RemoveAt(i);
                    GridView2.DataSource = order_list1;
                    GridView2.DataBind();
                    System.Diagnostics.Debug.WriteLine("AFTER IF" + order_list1.Count);

                }
            }
        }



    }

    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Delete")
        {
            int id = Convert.ToInt32(e.CommandArgument);

            for (int i = 0; i < order_list2.Count; i++)
            {
                System.Diagnostics.Debug.WriteLine("IN FOR" + id + " CAT " + order_list2[i].P_ID);

                if (order_list2[i].P_ID == id)
                {
                    System.Diagnostics.Debug.WriteLine("IN IF" + order_list2[i].ToString());

                    order_list2.RemoveAt(i);
                    GridView3.DataSource = order_list2;
                    GridView3.DataBind();
                    System.Diagnostics.Debug.WriteLine("AFTER IF" + order_list2.Count);

                }
            }
        }



    }

    protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }



    protected void Button3_Click(object sender, EventArgs e)
    {
        this.calculator();
    }
    protected void calculator()
    {
        long sumcal = 0;
        if (GridView1.Rows.Count >0 )
        {
        foreach (GridViewRow row in GridView1.Rows)
        {
            long number = long.Parse(row.Cells[2].Text);
            long price = long.Parse(row.Cells[1].Text);
            sumcal += number * price;
        }
        GridViewRow gvrow = GridView1.Rows[0];
        }
        if (GridView2.Rows.Count > 0)
        {
        foreach (GridViewRow row in GridView2.Rows)
        {
            long number = long.Parse(row.Cells[2].Text);
            long price = long.Parse(row.Cells[1].Text);
            sumcal += number * price;
        }
        GridViewRow gvrow1 = GridView2.Rows[0];
        }
        if (GridView3.Rows.Count > 0)
        {
        foreach (GridViewRow row in GridView3.Rows)
        {
            long number = long.Parse(row.Cells[2].Text);
            long price = long.Parse(row.Cells[1].Text);
            sumcal += number * price;
        }
        GridViewRow gvrow2 = GridView3.Rows[0];
        }
        Label2.Text = sumcal.ToString();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {

    }

    protected void bill()
    {
        string strConn = WebConfigurationManager.ConnectionStrings["SuckreedConnectionString3"].ConnectionString;
        using (SqlConnection Objconn = new SqlConnection(strConn))
        {
            Objconn.Open();
            using (SqlCommand ObjCM = new SqlCommand())
            {
                ObjCM.Connection = Objconn;
                ObjCM.CommandType = CommandType.StoredProcedure;
               
                    ObjCM.CommandText = "sqlbill";
                    ObjCM.Parameters.AddWithValue("@O_ID", );
                
               
             
                SqlDataReader ObjDR = ObjCM.ExecuteReader();

            }
            Objconn.Close();
        }
    }
}

