<%@ Page Title="Courses Preview" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseDetail.aspx.cs" Inherits="LangSkillz.Students.CourseDetail" %>

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
                    <h2 style="color:crimson; font-weight:bold"> <%#Eval("course_title") %> </h2>
                    <br /><hr /><br />
                    <div>
                        <%#Eval("course_content") %>
                    </div>
                </div>
            </DataRow>
        </Templates>
    </dx:ASPxGridView><br />
    
    <h3>Attempt Lessons</h3> <br />
    <asp:LinkButton ID="link_btn_subcribe" CommandArgument='<%#Eval("course_ID")%>' OnClick="link_btn_subcribe_Click" runat="server" Visible="true" style= "display: inline-block;
                                                                                                                                                            padding: 10px; 
                                                                                                                                                            border: 2px solid #ccc;
                                                                                                                                                            border-radius: 5px; 
                                                                                                                                                            background-color:crimson; 
                                                                                                                                                            color:white;
                                                                                                                                                            font-size:20px;
                                                                                                                                                            font-weight:bold;
                                                                                                                                                            text-decoration: none;" >
        Subscribe to view the lessons of this course! 

    </asp:LinkButton>
    <hr />
    <asp:LinkButton ID="link_btn_unsubcribe" CommandArgument='<%#Eval("course_ID")%>' OnClick="link_btn_unsubcribe_Click" runat="server" Visible="false" style= "display: inline-block;
                                                                                                                                                            padding: 10px; 
                                                                                                                                                            border: 2px solid #ccc;
                                                                                                                                                            border-radius: 5px; 
                                                                                                                                                            background-color:midnightblue; 
                                                                                                                                                            color:white;
                                                                                                                                                            font-size:20px;
                                                                                                                                                            font-weight:bold;
                                                                                                                                                            text-decoration: none;" > 
        Unsubscribe this course! 
    </asp:LinkButton>

    <dx:ASPxCardView ID="ASPxCardView1" width="100%" runat="server" Visible="false">
        <Columns>
            <dx:CardViewTextColumn FieldName="lesson_title"></dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="course_name"></dx:CardViewTextColumn>
        </Columns>
        <Templates>
            <Card>
                <div style="padding:10px;">
                    <asp:LinkButton ID="Link_btn1" CommandArgument='<%#Eval("lesson_ID")%>' runat="server" OnClick="Link_btn1_Click">
                        <b style="font-size:large; color:darkgoldenrod;"><%#Eval("lesson_title")%></b>
                    </asp:LinkButton>
                    <br /><br /><hr /><br />
                    <p>
                        <i style="font-weight:400; font-size:16px;">Click to view</i><br />
                    </p>                   
                </div>
            </Card>
        </Templates>
    </dx:ASPxCardView>
</asp:Content>
