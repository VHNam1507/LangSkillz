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

    <h3>Attempt Question</h3> <br />
    <dx:ASPxCardView ID="ASPxCardView1" width="100%" runat="server" ItemSpacing="10" Theme="Aqua" AutoGenerateColumns="False" 
        EditFormLayoutProperties-ColumnCount="1" CardLayoutProperties-ColumnCount="1" SettingsPager-SettingsTableLayout-ColumnCount="1" >
        <Columns>
            <dx:CardViewTextColumn FieldName="question"></dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="opt_A"></dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="opt_B"></dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="opt_C"></dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="opt_D"></dx:CardViewTextColumn>
        </Columns>
        <Templates>
            <Card>
                <div style="padding:10px;">
                    <b style="font-size:large; color:darkcyan;"><%#Eval("question")%></b>
                    <br /><br /><hr />
                    <p>
                        <dx:ASPxCheckBox ID="checkbox_optA" runat="server" Text='<%# "A. " + Eval("opt_A").ToString() %>'></dx:ASPxCheckBox>
                        <dx:ASPxCheckBox ID="checkbox_optB" runat="server" Text='<%# "B. " + Eval("opt_B").ToString() %>'></dx:ASPxCheckBox>
                        <dx:ASPxCheckBox ID="checkbox_optC" runat="server" Text='<%# "C. " + Eval("opt_C").ToString() %>'></dx:ASPxCheckBox>
                        <dx:ASPxCheckBox ID="checkbox_optD" runat="server" Text='<%# "D. " + Eval("opt_C").ToString() %>'></dx:ASPxCheckBox>
                    </p>                   
                </div>
                <dx:ASPxButton ID="btn_AnswersSubmit" runat="server" Theme="iOS" Width="100%" Text="Submit" CommandArgument='<%# Container.VisibleIndex + "," + Eval("question_ID") + "," + Eval("quizAns_ID") + "," + Eval("correct_ans")%>' OnClick="btn_AnswersSubmit_Click"></dx:ASPxButton>
            </Card>
        </Templates>

        <Styles>
            <Card Width="100%">
                <Border BorderColor="#00CC99" BorderStyle="Dashed" />
            </Card>
        </Styles>
    </dx:ASPxCardView>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>


</asp:Content>