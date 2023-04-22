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
        <asp:View ID="View1" runat="server">
            <h5>List of Courses</h5>
            <br />
            <div style="float:right">
                <asp:Button ID="btn_AddCourse" OnClick="btn_AddCourse_Click" 
                    CssClass="btn btn-info" runat="server" Text="Add new Course" />
            </div>
            <br /><br />
            <dx:ASPxGridView ID="ASPxGridView1" OnRowCommand="ASPxGridView1_RowCommand" Width="100%" runat="server">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="course_title" Caption="Courses"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataColumn>
                        <DataItemTemplate>
                            <asp:Button ID="Button1" CommandName="question" CommandArgument='<%#Eval("course_ID") %>' runat="server" Text="Add Quiz question"/>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                    <dx:GridViewDataColumn>
                        <DataItemTemplate>
                            <asp:Button ID="Button1" CommandName="answer" CommandArgument='<%#Eval("course_ID") %>' runat="server" Text="Add Quiz answer"/>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>
                </Columns>
            </dx:ASPxGridView>
        </asp:View>

        <asp:View ID="View2" runat="server">
            <h5>Add new Course</h5>
            <br />
            <div class ="row">
                <div class="col-md-2" style="padding:5px">
                    Course's title
                </div>
                <div class="col-md-10" style="padding:5px">
                    <asp:TextBox ID="CourseTitle_Textbox" CssClass="form-control" runat="server"></asp:TextBox>
                    <br />
                </div>

                <div class="col-md-2" style="padding:5px">
                    Course's content
                </div>
                <div class="col-md-10">
                    <dx:ASPxHtmlEditor ID="htmlContent" runat="server"></dx:ASPxHtmlEditor>
                </div>

                <div class="col-md-2" style="padding:5px"></div>
                <div class="col-md-10">
                    <br />
                    <asp:Button ID="btn_SaveCourse" OnClick="btn_SaveCourse_Click" runat="server" CssClass="btn btn-lg btn-info" Text="Save and Countinue" />
                </div>
            </div>
        </asp:View>

        <asp:View ID="View3" runat="server">
            <h5>Add Quiz Questions to "
                <asp:Label ID="lbl_questionA" runat="server" Text="..."></asp:Label>
                ".
            </h5>
            <br />
            <dx:ASPxGridView ID="ASPxGridView2" DataSourceID="ObjectDataSource2" Width="100%" runat="server" AutoGenerateColumns="true" KeyFieldName="question_ID">
<%--                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False">
                    </FilterControl>
                </SettingsPopup>--%>
                <Columns>
                    <dx:GridViewCommandColumn ShowNewButtonInHeader="true" ShowEditButton="true"></dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="question_ID" Visible="false" ReadOnly="True" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="course_ID" Visible="false" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="question" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <br />
            <asp:Button ID="btn_SaveQuiz" OnClick="btn_SaveQuiz_Click" runat="server" CssClass="btn btn-lg btn-info" Text="Save and Countinue" />
        </asp:View>

        <asp:View ID="View4" runat="server">
            <h5>Add Quiz Answers to "
                <asp:Label ID="lbl_questionB" runat="server" Text="..."></asp:Label>
                ".
            </h5>
            <br />
            <dx:ASPxGridView ID="ASPxGridView3" Width="100%" runat="server"></dx:ASPxGridView>
            <br />
            <asp:Button ID="btn_SaveAns" OnClick="btn_SaveAns_Click" runat="server" CssClass="btn btn-lg btn-info" Text="Save and Countinue" />
        </asp:View>
    </asp:MultiView>

    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="Get_by_CoursesID" TypeName="LangSkillz.App_Start.LangSkillz_DataSetTableAdapters.tbl_QuestionsTableAdapter" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_question_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="course_id" SessionField="course_ID" Type="Int32" />
            <asp:Parameter Name="question" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="course_id" SessionField="course_ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="course_id" SessionField="course_ID" Type="Int32" />
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="Original_question_ID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>

</asp:Content>
