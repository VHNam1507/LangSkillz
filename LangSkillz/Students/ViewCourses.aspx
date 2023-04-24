<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewCourses.aspx.cs" Inherits="LangSkillz.Students.ViewCourses" %>

<!DOCTYPE html>

    <asp:Content ID="Contentl" ContentPlaceHolderIl

    <hr />

    </asp:Content>

    " Language="C#" MasterPageFile="~/Site.master” AutoEventWireup="true” CodeFile="ViewCourses.aspx.cs” Inheriiz

    <%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.3.@, Culture=neutral, PublicKeyToken=b88d1754d7@0e49a" Hapespace-}

    'MainContent” Runat="Server">

    <h3>List of Courses</h3>

    <dx:ASPxCardView ID="ASPxCardViewl" Width="10@%" runat="server">
    <Columns>
    <dx:CardViewTextColumn FieldName="course_title"></dx:CardViewTextColumn>
    <dx:CardviewTextColumn FieldName
    </Columns>
    <Templates>
    <Card>

    instructor_name"></dx:CardviewTextColumn>

    opx™>|

    <div style="padding
    LinkButtonl” Font-Bold="true” runat="server"> <¥#Eval("course_title") %> </asp:LinkBut'

    <asp:LinkButton ID=
    <br />
    <br />
    <ha>BY</h4>
    <br />
    <h3>
    <¥#Eval("instructor_name”) %>
    </h3>
    </div>

    </Card>
    </Templates>
    </dx:ASPxCardView>




<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>--%>
