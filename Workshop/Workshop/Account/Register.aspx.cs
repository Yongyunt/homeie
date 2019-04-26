using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    


    protected void Button1_Click(object sender, EventArgs e)
    {
        Registers();
        Response.RedirectPermanent("/Account/login2.aspx");
    }
    
    protected void Registers()
    {
        string strConn = WebConfigurationManager.ConnectionStrings["SuckreedConnectionString3"].ConnectionString;
        using (SqlConnection Objconn = new SqlConnection(strConn))
        {
            Objconn.Open();
            using (SqlCommand ObjCM = new SqlCommand())
            {
                ObjCM.Connection = Objconn;
                ObjCM.CommandType = CommandType.StoredProcedure;
                if (DropDownList1.SelectedItem.Text == "ลูกค้า")
                {
                    ObjCM.CommandText = "sqlRegister";
                    ObjCM.Parameters.AddWithValue("@Address", txtAddress.Text);
                }
                else
                {
                    ObjCM.CommandText = "sqlRegisterAdmin";
                }
                ObjCM.Parameters.AddWithValue("@Firstname ", txtName.Text);
                ObjCM.Parameters.AddWithValue("@Lastname", txtLastname.Text);
                ObjCM.Parameters.AddWithValue("@Username", txtUserid.Text);
                ObjCM.Parameters.AddWithValue("@Password", txtPassword.Text);
                ObjCM.Parameters.AddWithValue("@Phone", txtPhone.Text);

                SqlDataReader ObjDR = ObjCM.ExecuteReader();
              
            }
            Objconn.Close();
        }
    }

}
    