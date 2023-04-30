using DevExpress.ClipboardSource.SpreadsheetML;
using DevExpress.SpreadsheetSource.Xls;
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

                vw_MQsTableAdapter mcq = new vw_MQsTableAdapter();
                ASPxCardView1.DataSource = mcq.Get_by_LessonID(Convert.ToInt32(Session["lesson_ID"]));
                ASPxCardView1.DataBind(); 
            }
        }

        protected void AnswersGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["question_ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void btn_AnswersSubmit_Click(object sender, EventArgs e)
        {
            ASPxButton Submit = (ASPxButton)sender;
            string cmdArg = Submit.CommandArgument.ToString();

            string visible_Index = cmdArg.Split(',')[0];
            string questionID = cmdArg.Split(',')[1];
            string quizAnsID = cmdArg.Split(',')[2];
            string correctAns = cmdArg.Split(',')[3];

            ASPxButton btn = (ASPxButton)sender;
            int visibleIndex = Convert.ToInt32(visible_Index);

            ASPxCheckBox checkbox_optA = (ASPxCheckBox)ASPxCardView1.FindCardTemplateControl(visibleIndex, "checkbox_optA");
            ASPxCheckBox checkbox_optB = (ASPxCheckBox)ASPxCardView1.FindCardTemplateControl(visibleIndex, "checkbox_optB");
            ASPxCheckBox checkbox_optC = (ASPxCheckBox)ASPxCardView1.FindCardTemplateControl(visibleIndex, "checkbox_optC");
            ASPxCheckBox checkbox_optD = (ASPxCheckBox)ASPxCardView1.FindCardTemplateControl(visibleIndex, "checkbox_optD");

            bool optA_checked = checkbox_optA.Checked;
            bool optB_checked = checkbox_optB.Checked;
            bool optC_checked = checkbox_optC.Checked;
            bool optD_checked = checkbox_optD.Checked;

            int cardID = Convert.ToInt32(ASPxCardView1.GetCardValues(visibleIndex, "CardID"));

            string a = "";
            if (optA_checked == true)
            {
                a = a + "A";
            }
            if (optB_checked == true)
            {
                a = a + "B";
            }
            if (optC_checked == true)
            {
                a = a + "C";
            }
            if (optD_checked == true)
            {
                a = a + "D";
            }

            Label1.Text = a;
            Label2.Text = questionID;
            Label3.Text = quizAnsID;
            Label4.Text = correctAns;
            if (CompareMCAs(a, correctAns)==true)
            {
                Label5.Text = "Dap an dung";
            }
            else 
            {
                Label5.Text = "Dap an sai";

            }

            //tbl_StudentsAnsTableAdapter studentsAns = new tbl_StudentsAnsTableAdapter();
            //studentsAns.Insert(Convert.ToInt32(Session["student_ID"]), Convert.ToInt32(questionID), Convert.ToInt32(quizAnsID), a);

        }

        public bool CompareMCAs(string str1, string str2)
        {
            str1 = str1.ToLower();
            str2 = str2.ToLower();

            if (str1.Length != str2.Length)
                return false;

            if (str1.Intersect(str2).Count() == str1.Length)
                return true;

            return false;
        }

    }
}
