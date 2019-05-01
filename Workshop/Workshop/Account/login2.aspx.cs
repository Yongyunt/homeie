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
        Session.RemoveAll();
    }

    protected void Button1_Click(object sender, EventArgs e)

    {

        string u = txtUser.Text;
        string p = txtPass.Text;
        if (u.Length > 0 || p.Length > 0)
        {
            login(u, p);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "swal('Good job!', 'Please!', 'error');", true);

        }

        if (Session["User"] != null)
        {
            Response.Redirect("default.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "swal('Good job!', 'Please!', 'error');", true);
        }
        


        string ua = txtUser.Text;
        string pa = txtPass.Text;
        Adminlogin(ua, pa);
        if (Session["Admin"] != null)
        {
            Response.Redirect("~/Admin/A.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "swal('Good job!', 'Please!', 'error');", true);
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
                    Session["UserID"] = ObjDR["C_ID"].ToString();
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
