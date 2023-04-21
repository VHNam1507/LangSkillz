using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using LangSkillz.Models;
using System.Web.Security;
using DevExpress.XtraRichEdit.Fields;

namespace LangSkillz.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogIn(object sender, EventArgs e)
        {
            if (Membership.ValidateUser(Email.Text, Password.Text))
                FormsAuthentication.SetAuthCookie(Email.Text, true);
            Response.Redirect("~/Default.aspx");

        }
    }
}