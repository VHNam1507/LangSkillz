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

                tbl_SubscriptionsTableAdapter subcription = new tbl_SubscriptionsTableAdapter();
                
                if (subcription.CheckSub((int)(Session["student_ID"]), Convert.ToInt32(Session["course_ID"])) > 0)
                {
                    link_btn_unsubcribe.Visible = true;
                    ASPxCardView1.Visible = true;
                    link_btn_subcribe.Visible = false;
                }
            }
        }

        protected void Link_btn1_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            Session["lesson_ID"] = lnk.CommandArgument;
            Response.Redirect("~/Students/LessonDetail.aspx");
        }

        protected void link_btn_subcribe_Click(object sender, EventArgs e)
        {
            tbl_SubscriptionsTableAdapter subcription = new tbl_SubscriptionsTableAdapter();
            subcription.Insert((int)(Session["student_ID"]), Convert.ToInt32(Session["course_ID"]));

            Response.Redirect(Request.RawUrl);
        }

        protected void link_btn_unsubcribe_Click(object sender, EventArgs e)
        {
            tbl_SubscriptionsTableAdapter subcription = new tbl_SubscriptionsTableAdapter();
            subcription.Delete_by_StuCouID((int)(Session["student_ID"]), Convert.ToInt32(Session["course_ID"]));

            Response.Redirect(Request.RawUrl);
        }
    }
}