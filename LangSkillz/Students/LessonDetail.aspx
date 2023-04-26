<%@ Page Title="Lesson Detail" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LessonDetail.aspx.cs" Inherits="LangSkillz.Students.LessonDetail" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxSpellChecker" Assembly="DevExpress.Web.ASPxSpellChecker.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br /><br /><br />
    <h3>Course Preview</h3>
    <hr /> <br />

    <dx:ASPxGridView ID="ASPxGridView1" Settings-ShowColumnHeaders="false" Width="100%" runat="server">
        <Templates>
            <DataRow>
                <div style="padding:15px">
                    <h2 style="color:crimson; font-weight:bold"> <%#Eval("lesson_title") %> </h2>
                    <br /><hr /><br />
                    <div>
                        <%#Eval("lesson_content") %>
                    </div>
                </div>
            </DataRow>
        </Templates>
    </dx:ASPxGridView><br /><hr />
    <div>
        <h3>Attempt Question</h3> <br />
        <dx:ASPxGridView style="margin-bottom: 10px; font-size: 16px;" ID="ASPxGridView2" Settings-ShowColumnHeaders="false" DataSourceID="ObjectDataSource2" Width="100%" runat="server" AutoGenerateColumns="False" KeyFieldName="question_ID">
        
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False">
                </FilterControl>
            </SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="question_ID" ReadOnly="True" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="lesson_ID" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="question" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Templates>
                <DetailRow>
                    <div style="padding: 5px 6px 6px 6px">
                        <dx:ASPxPageControl runat="server" ID="pageControl" Width="100%" EnableCallBacks="true">
                            <TabPages>
                            
                                <dx:TabPage Text="Answers" Visible="true">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <dx:ASPxGridView ID="AnswersGrid" Settings-ShowColumnHeaders="false" runat="server" DataSourceID="ObjectDataSource3"
                                            KeyFieldName="quizAns_ID" Width="100%" OnBeforePerformDataSelect="AnswersGrid_BeforePerformDataSelect">
                                            
                                                <Templates>
                                                    <DataRow>
                                                        <table style="width:100%; padding:10px">
                                                            <tr>
                                                                <td>
                                                                    <asp:CheckBox ID="checkA" runat="server" style="margin-bottom: 10px; font-size: 14px;" Text='<%# "  " + Eval("opt_A") %>'/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:CheckBox ID="checkB" runat="server" style="margin-bottom: 10px; font-size: 14px;" Text='<%# "  " + Eval("opt_B") %>'/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:CheckBox ID="checkC" runat="server" style="margin-bottom: 10px; font-size: 14px;" Text='<%# "  " + Eval("opt_C") %>'/>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:CheckBox ID="checkD" runat="server" style="margin-bottom: 10px; font-size: 14px;" Text='<%# "  " + Eval("opt_D") %>'/>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </DataRow>
                                                </Templates>
                                        
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
                <Header Wrap="True"></Header>
            </Styles>
        </dx:ASPxGridView>
        <dx:ASPxButton style="color:darkgreen; font-size: 16px" BackColor="#009900" ID="btn_submit" runat="server" Text="Submit"></dx:ASPxButton>
    </div>
    
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Get_by_LessonID" TypeName="LangSkillz.App_Start.LangSkillz_DataSetTableAdapters.tbl_QuestionsTableAdapter" >
        <SelectParameters>
            <asp:SessionParameter Name="lessonID" SessionField="lesson_ID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>

    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Get_by_QuestionID" TypeName="LangSkillz.App_Start.LangSkillz_DataSetTableAdapters.tbl_QuizAnsTableAdapter" >
        <SelectParameters>
            <asp:SessionParameter Name="questionID" SessionField="question_ID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>