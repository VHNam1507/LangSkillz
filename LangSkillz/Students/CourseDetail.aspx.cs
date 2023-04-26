using LangSkillz.App_Start.LangSkillz_DataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LangSkillz.Students
{
    public partial class CourseDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tbl_CoursesTableAdapter thecourse = new tbl_CoursesTableAdapter();
                ASPxGridView1.DataSource = thecourse.Get_by_CoursesID(Convert.ToInt32(Session["course_ID"]));
                ASPxGridView1.DataBind();

                tbl_LessonsTableAdapter thelesson = new tbl_LessonsTableAdapter();
                ASPxCardView1.DataSource = thelesson.Get_by_CoursesID(Convert.ToInt32(Session["course_ID"]));
                ASPxCardView1.DataBind();
            }
        }

        protected void Link_btn1_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            Session["lesson_ID"] = lnk.CommandArgument;
            Response.Redirect("~/Students/LessonDetail.aspx");
        }

    }
}