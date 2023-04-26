using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using LangSkillz.Models;
using System.Web.Security;
using DevExpress.XtraRichEdit.Fields;
using LangSkillz;
using LangSkillz.App_Start.LangSkillz_DataSetTableAdapters;
using static DevExpress.Utils.MVVM.Internal.ILReader;

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
            {
                if (Roles.IsUserInRole(Email.Text, "Instructors"))
                {
                    tbl_InstructorsTableAdapter instructor = new tbl_InstructorsTableAdapter();
                    Session["instructor_ID"] = instructor.Get_InstructorID(Email.Text);

                    FormsAuthentication.SetAuthCookie(Email.Text, true);
                    Response.Redirect("~/Default.aspx");
                }
                else if (Roles.IsUserInRole(Email.Text, "Students"))
                {
                    tbl_StudentsTableAdapter student = new tbl_StudentsTableAdapter();
                    Session["student_ID"] = student.Get_StudentID(Email.Text);

                    FormsAuthentication.SetAuthCookie(Email.Text, true);
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    // Hiển thị thông báo lỗi nếu người dùng nhập sai thông tin
                    FailureText.Text = "Invalid username or password.";
                    ErrorMessage.Visible = true;
                }
            }
            else
            {
                // Hiển thị thông báo lỗi nếu người dùng nhập sai thông tin
                FailureText.Text = "Invalid username or password.";
                ErrorMessage.Visible = true;
            }
        }


    }
}