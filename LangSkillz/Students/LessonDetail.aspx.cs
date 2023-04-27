using DevExpress.Web;
using LangSkillz.App_Start.LangSkillz_DataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LangSkillz.Students
{
    public partial class LessonDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tbl_LessonsTableAdapter thelesson = new tbl_LessonsTableAdapter();
                ASPxGridView1.DataSource = thelesson.Get_by_LessonID(Convert.ToInt32(Session["lesson_ID"]));
                ASPxGridView1.DataBind();
            }
        }

        protected void AnswersGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["question_ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void CalGrade()
        {
            
        
        }
    }
}