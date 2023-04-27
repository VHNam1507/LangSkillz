using DevExpress.Web;
using LangSkillz.App_Start.LangSkillz_DataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LangSkillz.Students
{
    public partial class MyCourses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tbl_SubscriptionsTableAdapter sub = new tbl_SubscriptionsTableAdapter();
                DataTable subscriptionsTable = sub.Get_CourseID_by_StudentID(Convert.ToInt32(Session["student_ID"]));

                List<int> courseIds = new List<int>();
                foreach (DataRow row in subscriptionsTable.Rows)
                {
                    int courseId = Convert.ToInt32(row["Course_ID"]);
                    courseIds.Add(courseId);
                }

                vw_CoursesTableAdapter icourses = new vw_CoursesTableAdapter();
                DataTable resultTable = new DataTable();
                foreach (int courseId in courseIds)
                {
                    DataTable table = icourses.Get_by_CourseID(courseId);
                    resultTable.Merge(table);
                }

                ASPxCardView1.DataSource = resultTable;
                ASPxCardView1.DataBind();
            }
        }

        protected void Link_btn1_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            Session["course_ID"] = lnk.CommandArgument;
            Response.Redirect("~/Students/CourseDetail.aspx");
        }
    }
}