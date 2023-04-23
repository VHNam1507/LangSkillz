using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using LangSkillz.Models;
using System.Web.Security;
using Azure;
using LangSkillz;
using LangSkillz.App_Start.LangSkillz_DataSetTableAdapters;

namespace LangSkillz.Account
{
    public partial class Register : Page
    {
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            //var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            //var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            //var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            //IdentityResult result = manager.Create(user, Password.Text);
            //if (result.Succeeded)
            //{
            //    // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
            //    //string code = manager.GenerateEmailConfirmationToken(user.Id);
            //    //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
            //    //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

            //    signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
            //    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            //}
            //else 
            //{
            //    ErrorMessage.Text = result.Errors.FirstOrDefault();
            //}

            if (rad_Instructor.Checked == true)
            {
                tbl_InstructorsTableAdapter instructor = new tbl_InstructorsTableAdapter();
                Membership.CreateUser(Email.Text, Password.Text, Email.Text);
                Roles.AddUserToRole(Email.Text, "Instructors");
                instructor.Insert(FullName.Text, Email.Text);
                Response.Redirect("~/Default.aspx");
            }
            else if (rad_Student.Checked == true)
            {
                tbl_StudentsTableAdapter student = new tbl_StudentsTableAdapter();
                Membership.CreateUser(Email.Text, Password.Text, Email.Text);
                Roles.AddUserToRole(Email.Text, "Students");
                student.Insert(FullName.Text, Email.Text);
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                // Hiển thị thông báo lỗi nếu người dùng nhập sai thông tin
                FailureText.Text = "Please choose your ROLE (INSTRUCTOR or STUDENT).";
                ErrorMessage.Visible = true;
            }
        }
    }
}