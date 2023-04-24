<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="LangSkillz.Account.Manage" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <asp:Label ID="lbl_ERROR" runat="server" Font-Bold="true" ForeColor-="Maroon"></asp:Label>

        <div>
            <asp:PlaceHolder runat="server" ID="successMessage" Visible="false" ViewStateMode="Disabled">
                <p class="text-success"><%: SuccessMessage %></p>
            </asp:PlaceHolder>
        </div>

        <div class="col-md-12">
            <div class="row">
                <h4>WELCOME BACK
                    <asp:Label ID="welcome" runat="server" Text="..."></asp:Label>!
                </h4>
                <hr />
                
                <br />
                <div class="row">
                  <div class="col-md-4 text-end" style="font-weight:bold">Your fullname:</div>
                  <div class="col-md-8"><asp:Label ID="lbl_fullname" runat="server" Text="Lmao" /></div>
                </div>

                <br /><br />
                <div class="row">
                  <div class="col-md-4 text-end" style="font-weight:bold">Your email address:</div>
                  <div class="col-md-8"><asp:Label ID="lbl_email" runat="server" Text="Lmao" /></div>
                </div>
                <br /><br />
                <div class="row">
                  <div class="col-md-4 text-end" style="font-weight:bold">Your role in LangSkillz:</div>
                  <div class="col-md-8"><asp:Label ID="lbl_role" runat="server" Text="Lmao" /></div>
                </div>
                <br /><br />
               

                <dl class="dl-horizontal">
                    <dt> Change your Password:</dt>
                    <dd>
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Change]" Visible="true" ID="ChangePassword" runat="server" />
                        <asp:HyperLink NavigateUrl="/Account/ManagePassword" Text="[Create]" Visible="false" ID="CreatePassword" runat="server" />
                    </dd>
                </dl>
            </div>
        </div>
    </main>
</asp:Content>
