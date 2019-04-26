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

    }
    
    protected void Registers(string u, string p)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["SuckreedConnectionString3"].ConnectionString;
        using (SqlConnection Objconn = new SqlConnection(strConn))
        {
            Objconn.Open();
            using (SqlCommand ObjCM = new SqlCommand())
            {
                ObjCM.Connection = Objconn;
                ObjCM.CommandType = CommandType.StoredProcedure;
                ObjCM.CommandText = "sqlRegister";
                //ObjCM.Parameters.AddWithValue("@C_Firstname ", cf);
                //ObjCM.Parameters.AddWithValue("@C_Lastname", cl);

                SqlDataReader ObjDR = ObjCM.ExecuteReader();
                ObjDR.Read();
                if (ObjDR.HasRows)
                {
                    Session["User"] = ObjDR["Username"].ToString();
                }
                ObjDR.Close();

            }
            Objconn.Close();
        }
    }

}
    