using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using DevExpress.XtraRichEdit.Fields;
using LangSkillz;
using LangSkillz.App_Start.LangSkillz_DataSetTableAdapters;

namespace LangSkillz.Instructors
{
    public partial class AddCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tbl_CoursesTableAdapter the_course = new tbl_CoursesTableAdapter();
                ASPxGridView1.DataSource = the_course.Get_by_InstructorID(1);
                ASPxGridView1.DataBind();

            }
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
                the_course.Insert(1,CourseTitle_Textbox.Text,htmlCourseContent.Html);
            }
            catch (Exception ex)
            { 
                lbl_ERROR.Text = ex.Message;
            }
        }

        protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "lessons")
            {
                Session["course_ID"] = e.CommandArgs.CommandArgument;
                lbl_coursesName.Text = ASPxGridView1.GetRowValues(e.VisibleIndex, "course_title").ToString();
                Multiview1.SetActiveView(View3);

                tbl_LessonsTableAdapter the_lesson = new tbl_LessonsTableAdapter();
                ASPxGridView2.DataSource = the_lesson.Get_by_CoursesID(1);
                ASPxGridView2.DataBind();
            }
        }

        protected void ASPxGridView2_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "questions")
            {
                Session["lesson_ID"] = e.CommandArgs.CommandArgument;
                lbl_questionA.Text = ASPxGridView2.GetRowValues(e.VisibleIndex, "lesson_title").ToString();
                Multiview1.SetActiveView(View5);

            }
        }

        protected void btn_AddLesson_Click(object sender, EventArgs e)
        {
            Multiview1.SetActiveView(View4);
        }

        protected void btn_SaveLesson_Click(object sender, EventArgs e)
        {
            try
            {
                tbl_LessonsTableAdapter the_lesson = new tbl_LessonsTableAdapter();
                the_lesson.Insert(1, LessonTitle_Textbox.Text, htmlLessonContent.Html);
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

        protected void AnswersGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["question_id"] = (sender as ASPxGridView).GetMasterRowKeyValue();
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