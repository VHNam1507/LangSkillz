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
       <dx:ASPxCardView ID="ASPxCardView1" width="100%" runat="server">
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
                    <br /><br /><hr /><br />
                    <p>
                        <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Text="A"></dx:ASPxCheckBox>
                        <dx:ASPxCheckBox ID="ASPxCheckBox2" runat="server" Text="B"></dx:ASPxCheckBox>
                        <dx:ASPxCheckBox ID="ASPxCheckBox3" runat="server" Text="C"></dx:ASPxCheckBox>
                        <dx:ASPxCheckBox ID="ASPxCheckBox4" runat="server" Text="D"></dx:ASPxCheckBox>
                        <b style="font-size:medium; color:forestgreen"> <%#Eval("instructor_name") %> </b>
                        <b style="font-size:medium; color:forestgreen"> <%#Eval("instructor_name") %> </b>
                        <b style="font-size:medium; color:forestgreen"> <%#Eval("instructor_name") %> </b>
                        <b style="font-size:medium; color:forestgreen"> <%#Eval("instructor_name") %> </b>
                    </p>                   
                </div>
            </Card>
        </Templates>
    </dx:ASPxCardView>

</asp:Content>