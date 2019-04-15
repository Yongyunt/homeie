<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        {
    public object ConnectionString { get; private set; }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string U = TextBox1.Text;
        string P = TextBox2.Text;
        if (!string.IsNullOrWhiteSpace(U) && string.IsNullOrWhiteSpace(P))
        {
            string ConnStr = WebConfigurationManager.ConnectionStrings["HAHAConnectionString"].ConnectionString;
            using (SqlConnection ConnObj = new SqlConnection(ConnStr))
            {
                ConnObj.Open();
                string SQL = "SELECT C_ID FROM Customers WHERE(Username = '" + U + "') AND(Password = '" + P + "')";
                using (SqlCommand CmObj = new SqlCommand())
                {
                    CmObj.CommandText = SQL;
                    CmObj.Connection = ConnObj;
                    using (SqlDataReader DrObj = CmObj.ExecuteReader())
                    {
                        DrObj.Read();
                        if (DrObj.HasRows)
                        {
                            Session["SES_CUSTOMER_ID"] = DrObj["C_ID"].ToString();
                            Response.Redirect("Myprofile.aspx");
                        }
                        DrObj.Close();
                    }
                }
                ConnObj.Close();
            }
        }
    }
}
    </h1>
</asp:Content>

