using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LangSkillz;
using LangSkillz.App_Start.LangSkillz_DataSetTableAdapters;

namespace LangSkillz.Instructors
{
    public partial class AddCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_AddCourse_Click(object sender, EventArgs e)
        {
            Multiview1.SetActiveView(View2);

        }

        protected void btn_SaveCourse_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_CoursesTableAdapter the_course = new tbl_CoursesTableAdapter();
                the_course.Insert((int) (Session["instructor_ID"]),CourseTitle_Textbox.Text,htmlContent.Html);
            }
            catch (Exception ex)
            { 
                lbl_ERROR.Text = ex.Message;
            }
        }

        protected void btn_SaveQuiz_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_SaveAns_Click(object sender, EventArgs e)
        {
            try
            {

            }
            catch (Exception ex)
            {

            }
        }
    }
}