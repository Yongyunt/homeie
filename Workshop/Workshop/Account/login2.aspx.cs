using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login2 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)

    {

        string u = txtUser.Text;
        string p = txtPass.Text;
        login(u, p);
        if (Session["User"] != null)
        {
            Response.RedirectPermanent("default.aspx");
        }
        


        string ua = txtUser.Text;
        string pa = txtPass.Text;
        Adminlogin(ua, pa);
        if (Session["Admin"] != null)
        {
            Response.RedirectPermanent("Admin.aspx");
        }



    }
    protected void login(string u, string p)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["SuckreedConnectionString3"].ConnectionString;
        using (SqlConnection Objconn = new SqlConnection(strConn))
        {
            Objconn.Open();
            using (SqlCommand ObjCM = new SqlCommand())
            {
                ObjCM.Connection = Objconn;
                ObjCM.CommandType = CommandType.StoredProcedure;
                ObjCM.CommandText = "sqllogin";
                ObjCM.Parameters.AddWithValue("@Username", u);
                ObjCM.Parameters.AddWithValue("@Password", p);
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
    protected void Adminlogin(string ua, string pa)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["SuckreedConnectionString3"].ConnectionString;
        using (SqlConnection Objconn = new SqlConnection(strConn))
        {
            Objconn.Open();
            using (SqlCommand ObjCM = new SqlCommand())
            {
                ObjCM.Connection = Objconn;
                ObjCM.CommandType = CommandType.StoredProcedure;
                ObjCM.CommandText = "sqlAdminlogin";
                ObjCM.Parameters.AddWithValue("@Username", ua);
                ObjCM.Parameters.AddWithValue("@Password", pa);
                SqlDataReader ObjDR = ObjCM.ExecuteReader();
                ObjDR.Read();
                if (ObjDR.HasRows)
                {
                    Session["Admin"] = ObjDR["Username"].ToString();
                }


            }
            Objconn.Close();

        }
    }
}
