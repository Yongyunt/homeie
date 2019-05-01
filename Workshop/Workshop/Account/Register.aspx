<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>Register</h1>
    <form>
     <div class="form-group">
        <label for="exampleInputEmail1">UserID</label>&nbsp;
         <br />
         <asp:TextBox ID="txtUserid" runat="server" CssClass="form-control" Width="332px"></asp:TextBox>
     </div>
     <div class="form-group">
        <label for="exampleInputPassword1">Password</label>
         <br />
         <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
     </div>
     <div class="form-group">
        <label for="exampleInputEmail1">Name</label>
         <br />
         <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
     </div>
     <div class="form-group">
        <label for="exampleInputEmail1">Last name</label>
         <br />
         <asp:TextBox ID="txtLastname" runat="server" CssClass="form-control"></asp:TextBox>
     </div>   
     <div class="form-group">
        <label for="exampleInputEmail1">Address</label>
         <br />
         <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
     </div>
     <div class="form-group">
        <label for="exampleInputEmail1">Phone number</label>
         <br />
         <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
     </div>
        <div>
              <asp:DropDownList ID="DropDownList1" runat="server">
                       <asp:ListItem>ลูกค้า</asp:ListItem>
                        <asp:ListItem>แม่ค้า</asp:ListItem>
                     
         </asp:DropDownList>
            
        </div>
        <br />
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Submit"  />
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Return"  />
        <br />

    </form>
    

</asp:Content>

