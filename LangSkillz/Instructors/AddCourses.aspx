<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCourses.aspx.cs" Inherits="LangSkillz.Instructors.AddCourses" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxSpellChecker" Assembly="DevExpress.Web.ASPxSpellChecker.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /> 
    <h3>Courses</h3>
    <hr />
    <asp:Label ID="lbl_ERROR" runat="server" Font-Bold="true" ForeColor-="Maroon"></asp:Label>
    <asp:MultiView ID="Multiview1" runat="server" ActiveViewIndex="0">
        
        <%--VIEW 1 -> A BUTTON "ADD NEW COURSE" + SHOW A LIST OF COURSES BY ASPxGridView that have Course Title and a button called "VIEW LESSON"--%>
        <asp:View ID="View1" runat="server">
            <h5>List of Courses</h5><br />
            
            <div style="float:right">
                <asp:Button ID="btn_AddCourse" OnClick="btn_AddCourse_Click" 
                    CssClass="btn btn-info" runat="server" Text="Add new Course" />
            </div><br /><br />
            
            <dx:ASPxGridView ID="ASPxGridView1" OnRowCommand="ASPxGridView1_RowCommand" Width="100%" runat="server">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="course_title" Caption="Courses"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="List of Lessons">
                        <DataItemTemplate>
                            <asp:Button ID="btn_ViewLessons" CommandName="lessons" CommandArgument='<%#Eval("course_ID") %>' runat="server" Text="Details"/>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
        </asp:View>

        <%--VIEW 2 -> ADD COURSE VIEW, ADD COURSE'S TITLE AND COURSE'S CONTENT--%>       
        <asp:View ID="View2" runat="server">
            <h5>Add new Course</h5><br />
            
            <div class ="row">
                <div class="col-md-2" style="padding:5px"> Course's title </div>
                <div class="col-md-10" style="padding:5px">
                    <asp:TextBox ID="CourseTitle_Textbox" CssClass="form-control" runat="server"></asp:TextBox>
                    <br />
                </div>

                <div class="col-md-2" style="padding:5px"> Course's content </div>
                <div class="col-md-10">
                    <dx:ASPxHtmlEditor ID="htmlCourseContent" runat="server"></dx:ASPxHtmlEditor>
                </div>

                <div class="col-md-2" style="padding:5px"></div>
                <div class="col-md-10"><br />
                    <asp:Button ID="btn_SaveCourse" OnClick="btn_SaveCourse_Click" runat="server" CssClass="btn btn-lg btn-info" Text="Save Course and Countinue" />
                </div>
            </div>
        </asp:View>


         <%--VIEW 3 -> A BUTTON "ADD NEW LESSON" + SHOW A LIST OF LESSON BY ASPxGridView that have Lesson Title and a button called "add Quiz"--%>       
        <asp:View ID="View3" runat="server">
            <h5>
                List of Lessons for the Course:
                <a style="color:crimson"><asp:Label ID="lbl_coursesName" runat="server" Text="..."></asp:Label></a>
            </h5><br />
            
            <div style="float:right">
                <asp:Button ID="btn_AddLesson" OnClick="btn_AddLesson_Click"
                    CssClass="btn btn-info" runat="server" Text="Add new Lesson" />
            </div><br /><br />
            
            <dx:ASPxGridView ID="ASPxGridView2" OnRowCommand="ASPxGridView2_RowCommand" Width="100%" runat="server">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="lesson_title" Caption="Lessons"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn>
                        <DataItemTemplate>
                            <asp:Button ID="btn_AddQuestion" CommandName="questions" CommandArgument='<%#Eval("lesson_ID") %>' runat="server" Text="Add Quiz"/>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                </Columns>
            </dx:ASPxGridView>
        </asp:View>


        <%--VIEW 4 -> ADD LESSON VIEW, ADD LESSON'S TITLE AND LESSON'S CONTENT--%>  
        <asp:View ID="View4" runat="server">
            <h5> Add Lessons</h5><br />
            
            <div class ="row">
                <div class="col-md-2" style="padding:5px"> Lesson's title </div>
                <div class="col-md-10" style="padding:5px">
                    <asp:TextBox ID="LessonTitle_Textbox" CssClass="form-control" runat="server"></asp:TextBox>
                    <br />
                </div>

                <div class="col-md-2" style="padding:5px"> Lesson's content </div>
                <div class="col-md-10">
                    <dx:ASPxHtmlEditor ID="htmlLessonContent" runat="server"></dx:ASPxHtmlEditor>
                </div>

                <div class="col-md-2" style="padding:5px"></div>
                <div class="col-md-10"><br />
                    <asp:Button ID="btn_SaveLesson" OnClick="btn_SaveLesson_Click" runat="server" CssClass="btn btn-lg btn-info" Text="Save and Countinue" />
                </div>
            </div>
        </asp:View>

         <%--VIEW 5 -> ADD QUESTION VIEW -> QUESTION LIST AND UI ADD QUIZ"--%>  

        <asp:View ID="View5" runat="server">
            <h5>Add Quiz Questions to
                <a style="color:darkcyan"><asp:Label ID="lbl_questionA" runat="server" Text="..."></asp:Label></a>.

            </h5><br />
            
            <dx:ASPxGridView ID="ASPxGridView3" DataSourceID="ObjectDataSource2" Width="100%" runat="server" AutoGenerateColumns="False" KeyFieldName="question_ID">

                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False">
                    </FilterControl>
                </SettingsPopup>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="question_ID" ReadOnly="True" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="lesson_ID" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="question" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                </Columns>

                <Templates>
                    <DetailRow>
                        <div style="padding: 3px 3px 2px 3px">
                            <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%" EnableCallBacks="true">
                                <TabPages>
                                    <dx:TabPage Text="Answers" Visible="true">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server">
                                                <dx:ASPxGridView ID="AnswersGrid" runat="server" DataSourceID="ObjectDataSource3"
                                                KeyFieldName="answer_ID" Width="100%" OnBeforePerformDataSelect="AnswersGrid_BeforePerformDataSelect">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true"></dx:GridViewCommandColumn>
                                                        <dx:GridViewDataColumn FieldName="correct_ans" />
                                                        <dx:GridViewDataColumn FieldName="opt_a" />
                                                        <dx:GridViewDataColumn FieldName="opt_b" />
                                                        <dx:GridViewDataColumn FieldName="opt_c" />
                                                        <dx:GridViewDataColumn FieldName="opt_d" />
                                                    </Columns>

                                                </dx:ASPxGridView>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                            </dx:ASPxPageControl>
                        </div>
                    </DetailRow>
                </Templates>
                <SettingsDetail ShowDetailRow="true" AllowOnlyOneMasterRowExpanded="true" />
                <Settings ShowFooter="true" />
                <SettingsPager EnableAdaptivity="true" />
                <Styles Header-Wrap="True">

                    <Header Wrap="True">
                    </Header>
                </Styles>

            </dx:ASPxGridView>
            <br />
        </asp:View>

    </asp:MultiView>

    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Get_by_LessonID" TypeName="LangSkillz.App_Start.LangSkillz_DataSetTableAdapters.tbl_QuestionsTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_question_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="lesson_ID" Type="Int32" />
            <asp:Parameter Name="question" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="lessonID" SessionField="lesson_ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="lesson_ID" Type="Int32" />
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="Original_question_ID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Get_by_QuestionID" TypeName="LangSkillz.App_Start.LangSkillz_DataSetTableAdapters.tbl_QuizAnsTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_quizAns_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="question_ID" Type="Int32" />
            <asp:Parameter Name="correct_ans" Type="String" />
            <asp:Parameter Name="opt_a" Type="String" />
            <asp:Parameter Name="opt_b" Type="String" />
            <asp:Parameter Name="opt_c" Type="String" />
            <asp:Parameter Name="opt_d" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="questionID" SessionField="question_ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="question_ID" Type="Int32" />
            <asp:Parameter Name="correct_ans" Type="String" />
            <asp:Parameter Name="opt_a" Type="String" />
            <asp:Parameter Name="opt_b" Type="String" />
            <asp:Parameter Name="opt_c" Type="String" />
            <asp:Parameter Name="opt_d" Type="String" />
            <asp:Parameter Name="Original_quizAns_ID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
