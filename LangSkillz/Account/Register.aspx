<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="LangSkillz.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <h4>Create a new LangSkillz account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <asp:PlaceHolder runat="server" ID="PlaceHolder1" Visible="false">
            <p class="text-danger">
                <asp:Literal runat="server" ID="FailureText" />
            </p>
        </asp:PlaceHolder>
        <div class="row">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Select your role</asp:Label>
            <div class="col-md-10">
                <asp:RadioButton ID="rad_Instructor" runat="server" Text="I'm a Instructor" GroupName = "group"/> <br />
                <asp:RadioButton ID="rad_Student" runat="server" Text="I'm a Student" GroupName = "group"/>
            </div>
        </div>
        <br />

        <div class="row">
            <asp:Label runat="server" AssociatedControlID="FullName" CssClass="col-md-2 col-form-label">Your Full Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="FullName" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FullName"
                    CssClass="text-danger" ErrorMessage="The full-name field is required." />
            </div>
        </div>

        <div class="row">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 col-form-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Email" 
                    CssClass="text-danger" ErrorMessage="Invalid email address." 
                    ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$" />
            </div>
        </div>


        <div class="row">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 col-form-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="Password" 
                    CssClass="text-danger" ErrorMessage="Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one number, and one special character." 
                    ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^\da-zA-Z]).{8,}$" />
            </div>
        </div>


        <div class="row">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 col-form-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="offset-md-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-outline-dark" />
            </div>
        </div>
    </main>
</asp:Content>
