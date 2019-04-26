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
        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter Password">
     </div>
     <div class="form-group">
        <label for="exampleInputEmail1">Confirm Password</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Confirm Password">
     </div>
     <div class="form-group">
        <label for="exampleInputEmail1">Name</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">
     </div>
     <div class="form-group">
        <label for="exampleInputEmail1">Last name</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Lastname">
     </div>   
     <div class="form-group">
        <label for="exampleInputEmail1">Address</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Address">
     </div>
     <div class="form-group">
        <label for="exampleInputEmail1">Phone number</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone number">
     </div>
        <div>
              <asp:DropDownList ID="DropDownList1" runat="server">
                       <asp:ListItem>ลูกค้า</asp:ListItem>
                        <asp:ListItem>แม่ค้า</asp:ListItem>
                     
         </asp:DropDownList>
        </div>
        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click"  />
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary"  />
        <br />

    </form>
    

</asp:Content>

