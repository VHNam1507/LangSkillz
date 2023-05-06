using DevExpress.ClipboardSource.SpreadsheetML;
using DevExpress.SpreadsheetSource.Xls;
using DevExpress.Web;
using LangSkillz.App_Start;
using LangSkillz.App_Start.LangSkillz_DataSetTableAdapters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
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

                LangSkillz_DataSet.vw_studentResultsDataTable tempTable = new LangSkillz_DataSet.vw_studentResultsDataTable();
                vw_studentResultsTableAdapter results = new vw_studentResultsTableAdapter();
                results.Fill(tempTable, Convert.ToInt32(Session["lesson_ID"]), Convert.ToInt32(Session["student_ID"]));

                DataRow[] sortedRows = tempTable.Select("", "VisibleIndex ASC");

                for (int i = 0; i < tempTable.Rows.Count; i++)
                {
                    int visibleIndex = Convert.ToInt32(tempTable.Rows[i]["VisibleIndex"]);

                    ASPxCheckBox checkbox_optA = (ASPxCheckBox)ASPxCardView1.FindCardTemplateControl(visibleIndex, "checkbox_optA");
                    ASPxCheckBox checkbox_optB = (ASPxCheckBox)ASPxCardView1.FindCardTemplateControl(visibleIndex, "checkbox_optB");
                    ASPxCheckBox checkbox_optC = (ASPxCheckBox)ASPxCardView1.FindCardTemplateControl(visibleIndex, "checkbox_optC");
                    ASPxCheckBox checkbox_optD = (ASPxCheckBox)ASPxCardView1.FindCardTemplateControl(visibleIndex, "checkbox_optD");


                    string studentAns = tempTable.Rows[i]["studentsAns"].ToString();
                    string correctAns = tempTable.Rows[i]["correct_ans"].ToString();
                    CheckAnswerOptions(studentAns, checkbox_optA, checkbox_optD, checkbox_optC, checkbox_optD);

                    if (studentAns != null)
                    {
                        ASPxButton Submit = (ASPxButton)ASPxCardView1.FindCardTemplateControl(visibleIndex, "btn_AnswersSubmit");
                        Submit.Text = "You have already answered this question";
                        Submit.Enabled = false;

                        checkbox_optA.Enabled = false;
                        checkbox_optB.Enabled = false;
                        checkbox_optC.Enabled = false;
                        checkbox_optD.Enabled = false;

                        System.Web.UI.WebControls.Image img_correct = (System.Web.UI.WebControls.Image)ASPxCardView1.FindCardTemplateControl(visibleIndex, "img_correct");
                        System.Web.UI.WebControls.Image img_wrong = (System.Web.UI.WebControls.Image)ASPxCardView1.FindCardTemplateControl(visibleIndex, "img_wrong");

                        if (CompareMCAs(studentAns, correctAns) == true)
                        {
                            img_correct.Visible = true;
                            img_wrong.Visible = false;
                        }
                        else
                        {
                            img_correct.Visible = false;
                            img_wrong.Visible = true;
                        }

                        CheckCorrectAnswerOptions(correctAns, checkbox_optA, checkbox_optD, checkbox_optC, checkbox_optD);
                    }
                }
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

            string studentAns = "";
            if (optA_checked == true)
            {
                studentAns = studentAns + "A";
            }
            if (optB_checked == true)
            {
                studentAns = studentAns + "B";
            }
            if (optC_checked == true)
            {
                studentAns = studentAns + "C";
            }
            if (optD_checked == true)
            {
                studentAns = studentAns + "D";
            }
            
            tbl_StudentsAnsTableAdapter studentsAns = new tbl_StudentsAnsTableAdapter();
            studentsAns.Insert(Convert.ToInt32(Session["student_ID"]), Convert.ToInt32(questionID), Convert.ToInt32(quizAnsID),visibleIndex,studentAns);

            Response.Redirect(Request.RawUrl);
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

        private void CheckAnswerOptions(string answer, ASPxCheckBox checkbox_optA, ASPxCheckBox checkbox_optB, ASPxCheckBox checkbox_optC, ASPxCheckBox checkbox_optD)
        {
            if (string.IsNullOrEmpty(answer)) return;

            answer = answer.ToLower();

            if (answer.Contains("a"))
            {
                checkbox_optA.Checked = true;
                checkbox_optA.ForeColor = Color.Red;
            }

            if (answer.Contains("b"))
            {
                checkbox_optB.Checked = true;
                checkbox_optB.ForeColor = Color.Red;
            }

            if (answer.Contains("c"))
            {
                checkbox_optC.Checked = true;
                checkbox_optC.ForeColor = Color.Red;
            }

            if (answer.Contains("d"))
            {
                checkbox_optD.Checked = true;
                checkbox_optD.ForeColor = Color.Red;
            }
        }

        private void CheckCorrectAnswerOptions(string correct_ans, ASPxCheckBox checkbox_optA, ASPxCheckBox checkbox_optB, ASPxCheckBox checkbox_optC, ASPxCheckBox checkbox_optD)
        {
            if (string.IsNullOrEmpty(correct_ans)) return;

            correct_ans = correct_ans.ToLower();

            if (correct_ans.Contains("a"))
                checkbox_optA.ForeColor = Color.Green;

            if (correct_ans.Contains("b"))
                checkbox_optB.ForeColor = Color.Green;

            if (correct_ans.Contains("c"))
                checkbox_optC.ForeColor = Color.Green;

            if (correct_ans.Contains("d"))
                checkbox_optD.ForeColor = Color.Green;
        }

    }
}
