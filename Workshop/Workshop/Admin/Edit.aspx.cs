using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.calculator();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        UpdateSa();

    }
    protected void UpdateSa()
    {
        string strConn = WebConfigurationManager.ConnectionStrings["SuckreedConnectionString3"].ConnectionString;
        using (SqlConnection Objconn = new SqlConnection(strConn))
        {
            Objconn.Open();
            using (SqlCommand ObjCM = new SqlCommand())
            {
                ObjCM.Connection = Objconn;
                ObjCM.CommandType = CommandType.StoredProcedure;

                ObjCM.CommandText = "sqlupdatestatus";
                ObjCM.Parameters.AddWithValue("@O_Status", DropDownList1.SelectedItem.Text);
                ObjCM.Parameters.AddWithValue("@O_ID", Request.QueryString["id"]);

                if (ObjCM.ExecuteNonQuery() != 0)
                {
                    Response.Redirect("A.aspx");
                };

            }
            Objconn.Close();
        }
    }
    protected void calculator()
    {
        long sumcal = 0;
        if (GridView1.Rows.Count > 0)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                long number = long.Parse(row.Cells[3].Text);
                long price = long.Parse(row.Cells[4].Text);
                sumcal += number * price;
            }
            GridViewRow gvrow = GridView1.Rows[0];
            Label2.Text = sumcal.ToString();
        }
    }
}