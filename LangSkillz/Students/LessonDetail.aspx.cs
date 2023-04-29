using DevExpress.ClipboardSource.SpreadsheetML;
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

        //protected void btn_submit_Click(object sender, EventArgs e)
        //{

        //    string selectedAnswers = "";
        //    CheckBox chkA = (CheckBox)AnswersGrid.FindRowCellTemplateControl(0, AnswersGrid.Columns["opt_A"] as GridViewDataColumn, "checkA");
        //    CheckBox chkB = (CheckBox)AnswersGrid.FindRowCellTemplateControl(0, AnswersGrid.Columns["opt_B"] as GridViewDataColumn, "checkB");
        //    CheckBox chkC = (CheckBox)AnswersGrid.FindRowCellTemplateControl(0, AnswersGrid.Columns["opt_C"] as GridViewDataColumn, "checkC");
        //    CheckBox chkD = (CheckBox)AnswersGrid.FindRowCellTemplateControl(0, AnswersGrid.Columns["opt_D"] as GridViewDataColumn, "checkD");

        //    if (chkA.Checked)
        //    {
        //        selectedAnswers += "A";
        //    }
        //    if (chkB.Checked)
        //    {
        //        selectedAnswers += "B";
        //    }
        //    if (chkC.Checked)
        //    {
        //        selectedAnswers += "C";
        //    }
        //    if (chkD.Checked)
        //    {
        //        selectedAnswers += "D";
        //    }

        //    // Lưu giá trị selectedAnswers vào database hoặc sử dụng nó theo nhu cầu của bạn
        //}

        protected void btn_submit_Click(object sender, EventArgs e)
        {
        }

        protected void AnswersGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                GridView AnswersGrid = (GridView)e.Row.FindControl("AnswersGrid");

                if (AnswersGrid != null)
                {
                    foreach (GridViewRow row in AnswersGrid.Rows)
                    {
                        CheckBox checkBox = (CheckBox)row.FindControl("CheckboxColumn");

                        if (checkBox != null && checkBox.Checked)
                        {
                            // Do something with the checked checkbox
                        }
                    }
                }
            }
        }





        protected void CalGrade()
        {
        }

        protected void ASPxGridView2_DetailRowExpandedChanged1(object sender, ASPxGridViewDetailRowEventArgs e)
        {

        }

        //protected void ASPxGridView1_RowDataBound(object sender, ASPxGridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow && e.Row is ASPxGridViewDetailRow)
        //    {
        //        // Lấy GridView con
        //        ASPxGridView answersGrid = (e.Row as ASPxGridViewDetailRow).FindControl("AnswersGrid") as ASPxGridView;

        //        // Lấy CheckBox trong GridView con
        //        CheckBox checkA = answersGrid.FindRowCellTemplateControl(0, null, "checkA") as CheckBox;
        //        CheckBox checkB = answersGrid.FindRowCellTemplateControl(0, null, "checkB") as CheckBox;
        //        CheckBox checkC = answersGrid.FindRowCellTemplateControl(0, null, "checkC") as CheckBox;
        //        CheckBox checkD = answersGrid.FindRowCellTemplateControl(0, null, "checkD") as CheckBox;

        //        // Tiếp tục thao tác với các CheckBox ở đây
        //    }
        //}


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }
    }
}