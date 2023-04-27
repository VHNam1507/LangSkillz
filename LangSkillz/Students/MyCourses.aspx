<%@ Page Title="My enrolled courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyCourses.aspx.cs" Inherits="LangSkillz.Students.MyCourses" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxSpellChecker" Assembly="DevExpress.Web.ASPxSpellChecker.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br /><br /><br />
    <h3> My Enrolled Courses</h3>
    <hr /> <br />
    <dx:ASPxCardView ID="ASPxCardView1" width="100%" runat="server">
        <Columns>
            <dx:CardViewTextColumn FieldName="course_title"></dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="instructor_name"></dx:CardViewTextColumn>
        </Columns>
        <Templates>
            <Card>
                <div style="padding:10px;">
                    <asp:LinkButton ID="Link_btn1" OnClick="Link_btn1_Click" CommandArgument='<%#Eval("course_ID")%>' runat="server"> <b style="font-size:large; color:darkcyan;"><%#Eval("course_title")%></b> </asp:LinkButton>
                    <br /><br /><hr /><br />
                    <p>
                        <i style="font-weight:400"> Created by</i><br />
                        <b style="font-size:medium; color:forestgreen"> <%#Eval("instructor_name") %> </b>
                    </p>                   
                </div>
            </Card>
        </Templates>
    </dx:ASPxCardView>

</asp:Content>

