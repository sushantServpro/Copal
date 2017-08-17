<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="MySpacePortal.Pages.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row section-1">
            <div class="page-header">
                <h4>Profile</h4>
            </div>
        </div>
        <div class="row section-2">
            <div class="container-fluid">
                <div class="col-md-7 profile emp_profile">
                    <div class="section_heading">
                        <h5>Profile</h5>
                        <a href="#">
                            <img src="../assets/dashboard/edit_icon.png" /></a>
                    </div>
                    <div class="prof_info">
                        <div class="row">
                            <div class="col-sm-3 prof_img">
                                <asp:Image ID="Image1" runat="server" Width="96px" Height="100px" class="img-circle" />
                                <%-- <img src='<%=HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + HttpRuntime.AppDomainAppVirtualPath%>//EmployeeImages/<%# (Eval("ImageName") != System.DBNull.Value ? "" + (Eval("ImageName")) : "NULL") %>'/>--%>
                                <%--<img src="../assets/dashboard/profile.png" class="img-circle" alt="User Image">--%>
                            </div>
                            <div class="col-sm-9 prof_desc">
                                <div class="prof_name">
                                    <span>
                                        <label id="lblusername" runat="server"></label>
                                    </span>
                                    <img src="../assets/dashboard/star_icon.png" />
                                </div>
                                <div class="emp_detail row">
                                    <ul class="nav navbar-nav row">
                                        <li class="col-xs-6">
                                            <span>
                                                <img src="../assets/dashboard/designation_icon.png" />
                                                <label id="lbldesignation" runat="server"></label>
                                            </span>
                                        </li>
                                        <li class="col-xs-6">
                                            <span>
                                                <img src="../assets/dashboard/place_icon.png" />
                                                <label id="lbllocation" runat="server"></label>
                                            </span>
                                        </li>
                                        <li class="col-xs-6">
                                            <span>
                                                <img src="../assets/dashboard/department_icon.png" />
                                                <label id="lbldept" runat="server"></label>
                                            </span>
                                        </li>
                                        <li class="col-xs-6">
                                            <span>
                                                <img src="../assets/dashboard/private_icon.png" />
                                                <label>Private</label>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<div class="col-md-5 profile emp_mailbox">
                    <div class="section_heading inbox_head">
                        <h5>Inbox</h5>
                        <button class="btn btn-info btn-outline btn_view">View All</button>
                    </div>
                    <div class="emp_inbox">
                        <ul class="sidebar-menu">
                            <li>
                                <h6>lorem <span>5:30PM</span></h6>
                                <p>dfabdfbdbadbnadfbndbn</p>
                            </li>
                            <li>
                                <h6>lorem <span>5:30PM</span></h6>
                                <p>dfabdfbdbadbnadfbndbn</p>
                            </li>
                        </ul>

                    </div>
                </div>--%>
            </div>
        </div>
        <div class="row section-3">
            <div class="container-fluid dashboard_info">
                <%--<div class="col-md-4 upt_box">
                    <div class="upt_heading">
                        <h5>Latest News</h5>
                    </div>
                    <ul class="sidebar-menu">
                        <li>
                            <asp:Repeater ID="rssRepeater" runat="server">
                                <ItemTemplate>
                                    <table style="border: solid 1px black; width: 500px; font-family: Arial">
                                        <tr>
                                            <td style="font-weight: bold">
                                                <asp:HyperLink ID="HyperLink1" runat="server"
                                                    NavigateUrl='<%#Eval("link")%>'
                                                    Text='<%#Eval("title")%>'></asp:HyperLink>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="background-color: #C2D69B">
                                                <asp:Label ID="Label1" runat="server"
                                                    Text='<%#Eval("description")%>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                            <a href="#" class="row">
                                <div class="col-md-2 not_img">
                                    <img src="../assets/dashboard/impnotif_read.png" />
                                </div>
                                <div class="col-md-10">
                                    <h6>lorem</h6>
                                    <p>dfabdfbdbadbnadfbndbn</p>
                                </div>
                            </a>
                        </li>


                    </ul>
                    <div class="read_all text-right">
                        <button class="btn btn-info">Read All</button>
                    </div>
                </div>--%>
                <div class="col-md-4 upt_box">
                    <div class="upt_heading">
                        <h5>Announcements</h5>
                    </div>
                    <ul id="ul_announcements" runat="server" class="sidebar-menu">
                        <asp:Repeater ID="AnnouncementRepeater" runat="server">
                            <ItemTemplate>
                                <li id="liann" runat="server" title="">
                                    <a href="#" class="row">
                                        <div class="col-xs-2 not_img" >
                                            <%--<img src="../assets/dashboard/impnotif_read.png" />--%>
                                            <img src="<%# Eval("ImagePath") %>" style="width: 60px; height: 70px;" alt="" />
                                        </div>
                                        <div class="col-xs-10">
                                            <h6>
                                                <asp:Label ID="lblheading" runat="server" Text='<%# Eval("Heading")%>'></asp:Label>
                                                <br/><asp:Label ID="lblCreatedDateTime" runat="server" Text='<%#Eval("CreatedDatetime") %>'>'></asp:Label>
                                            </h6>
                                            <p>
                                                <%--<asp:Label ID="lbldescription" runat="server" Text='<%# Eval("Description")%>'></asp:Label>--%>
                                                <asp:Label ID="lblFrom" runat="server" Text='<%# Eval("From")%>'></asp:Label>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>

                    </ul>
                    <div class="read_all text-right">
                        <asp:Button ID="btnreadallannouncements" runat="server" Text="Read All" class="btn btn-info" OnClick="btnreadallannouncements_Click"></asp:Button>
                    </div>
                </div>
                <div class="col-md-4 upt_box">
                    <div class="upt_heading">
                        <h5>Important Notifications</h5>
                    </div>
                    <ul class="sidebar-menu">
                        <asp:Repeater ID="IMPNotiRepeater" runat="server">
                            <ItemTemplate>
                                <li>
                                    <a href="#" class="row">
                                        <div class="col-xs-2 not_img">
                                            <%--<img src="../assets/dashboard/impnotif_read.png" />--%>
                                            <img src="<%# Eval("ImagePath") %>" alt="" />
                                        </div>
                                        <div class="col-xs-10">
                                            <h6>
                                                <asp:Label ID="lblheading" runat="server" Text='<%# Eval("Heading")%>'></asp:Label>
                                                <br />
                                                <asp:Label ID="lblCreatedDateTime" runat="server" Text='<%# Eval("CreatedDatetime")%>'></asp:Label>
                                            </h6>
                                            <p>
                                                <%--<asp:Label ID="lbldescription" runat="server" Text='<%# Eval("Description")%>'></asp:Label>--%>
                                                <asp:Label ID="lblFrom" runat="server" Text='<%# Eval("From")%>'></asp:Label>
                                            </p>
                                        </div>
                                    </a>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                    <div class="read_all text-right">
                        <asp:Button ID="btnreadimpnoti" runat="server" OnClick="btnreadimpnoti_Click" Text="Read All" class="btn btn-info"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
