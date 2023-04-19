<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCourses.aspx.cs" Inherits="LangSkillz.Instructors.AddCourses" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register TagPrefix="dx" Namespace="DevExpress.Web.ASPxSpellChecker" Assembly="DevExpress.Web.ASPxSpellChecker.v22.2, Version=22.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Courses</h3>
    <hr />
    <asp:MultiView ID="Multiview1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <h5>List of Courses</h5>
            <br />
            <div style="float:right">
                <asp:Button ID="add_Course_button" CssClass="btn btn-info" runat="server" Text="Add new Course" />
            </div>
            <br /><br />
            <dx:ASPxGridView ID="ASPxGridView1" Width="100%" runat="server"></dx:ASPxGridView>
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
                    <dx:ASPxHtmlEditor runat="server"></dx:ASPxHtmlEditor>
                </div>

                <div class="col-md-2" style="padding:5px"></div>
                <div class="col-md-10">
                    <br />
                    <asp:Button ID="addCourse_save_btn" runat="server" CssClass="btn btn-lg btn-info" Text="Save and Countinue" />
                </div>
            </div>
        </asp:View>

        <asp:View ID="View3" runat="server">
            <h5>Add Quiz Questions</h5>
            <br />
            <dx:ASPxGridView ID="ASPxGridView2" Width="100%" runat="server"></dx:ASPxGridView>
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-lg btn-info" Text="Save and Countinue" />
        </asp:View>

        <asp:View ID="View4" runat="server">
            <h5>Add Quiz Answers</h5>
            <br />
            <dx:ASPxGridView ID="ASPxGridView3" Width="100%" runat="server"></dx:ASPxGridView>
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-lg btn-info" Text="Save and Countinue" />
        </asp:View>


    </asp:MultiView>

</asp:Content>
