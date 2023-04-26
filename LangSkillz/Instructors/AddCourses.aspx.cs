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
                ASPxGridView1.DataSource = the_course.Get_by_InstructorID((int)Session["instructor_ID"]);
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
                the_course.Insert((int)Session["instructor_ID"], CourseTitle_Textbox.Text,htmlCourseContent.Html);
            }
            catch (Exception ex)
            { 
                lbl_ERROR.Text = ex.Message;
            }
            finally
            {
                CourseTitle_Textbox.Text = null; htmlCourseContent.Html = null;
                tbl_CoursesTableAdapter the_course = new tbl_CoursesTableAdapter();
                ASPxGridView1.DataSource = the_course.Get_by_InstructorID((int)Session["instructor_ID"]);
                ASPxGridView1.DataBind();
                Multiview1.SetActiveView(View1);
            }

        }

        protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "ViewCourse")
            {
                Session["course_ID"] = e.CommandArgs.CommandArgument;
                lbl_coursesName.Text = ASPxGridView1.GetRowValues(e.VisibleIndex, "course_title").ToString();

                tbl_CoursesTableAdapter thecourse = new tbl_CoursesTableAdapter();
                Session["thecourse_ID"] = thecourse.Get_CourseID(lbl_coursesName.Text);
                
                Multiview1.SetActiveView(View3);

                tbl_LessonsTableAdapter the_lesson = new tbl_LessonsTableAdapter();
                ASPxGridView2.DataSource = the_lesson.Get_by_CoursesID((int)Session["thecourse_ID"]);
                ASPxGridView2.DataBind();
            }

            if (e.CommandArgs.CommandName == "EditCourse")
            {

            }

            if (e.CommandArgs.CommandName == "DeleteCourse")
            {
                tbl_CoursesTableAdapter the_course = new tbl_CoursesTableAdapter();
                try
                {
                    
                    Session["thecourse_ID"] = the_course.Get_CourseID(ASPxGridView1.GetRowValues(e.VisibleIndex, "course_title").ToString());
                    the_course.Delete((int)Session["thecourse_ID"]);
                }
                catch (Exception ex)
                {
                    lbl_ERROR.Text = ex.Message;
                }
                finally
                {
                    ASPxGridView1.DataSource = the_course.Get_by_InstructorID((int)Session["instructor_ID"]);
                    ASPxGridView1.DataBind();
                }
            }
        }

        protected void ASPxGridView2_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "ViewQuestion")
            {
                Session["lesson_ID"] = e.CommandArgs.CommandArgument;
                lbl_questionA.Text = ASPxGridView2.GetRowValues(e.VisibleIndex, "lesson_title").ToString();


                Multiview1.SetActiveView(View5);

            }

            if (e.CommandArgs.CommandName == "EditCourse")
            {

            }

            if (e.CommandArgs.CommandName == "DeleteCourse")
            {

            }
        }

        protected void btn_AddLesson_Click(object sender, EventArgs e)
        {
            Multiview1.SetActiveView(View4);
        }

        protected void btn_SaveLesson_Click(object sender, EventArgs e)
        {
            tbl_LessonsTableAdapter the_lesson = new tbl_LessonsTableAdapter();
            try
            {
                
                the_lesson.Insert((int)Session["thecourse_ID"], LessonTitle_Textbox.Text, htmlLessonContent.Html);
            }
            catch (Exception ex)
            {
                lbl_ERROR.Text = ex.Message;
            }
            finally
            {
                ASPxGridView2.DataSource = the_lesson.Get_by_CoursesID((int)Session["thecourse_ID"]);
                ASPxGridView2.DataBind();
                Multiview1.SetActiveView(View3);
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