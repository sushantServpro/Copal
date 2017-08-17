<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="announcements.aspx.cs" Inherits="MySpace.Pages.announcements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row section-1">
            <div class="page-header">
                <h4>Announcements</h4>
            </div>
        </div>
        <div class="row section-2">
            <div class="container-fluid">
                <div class="row announcements_sec">
                    <%--<div class="col-md-4">
                            <h4>Announcements List</h4>
                            <ul class="nav nav-tabs tabs-left">
                                <li class="active">
                                    <div data-target="#anc1" data-toggle="tab">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <img src="../assets/announcements/announcements_thumb1.png" />
                                            </div>
                                            <div class="col-md-6">
                                                <h5>New Caffeteria</h5>
                                                <p>This is photoshops version of lorem ipsum</p>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="date_month">
                                                    <span>12 Jan</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div data-target="#anc2" data-toggle="tab">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <img src="../assets/announcements/announcements_thumb2.png" />
                                            </div>
                                            <div class="col-md-6">
                                                <h5>New Caffeteria</h5>
                                                <p>This is photoshops version of lorem ipsum</p>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="date_month">
                                                    <span>12 Jan</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div data-target="#anc3" data-toggle="tab">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <img src="../assets/announcements/announcements_thumb3.png" />
                                            </div>
                                            <div class="col-md-6">
                                                <h5>New Caffeteria</h5>
                                                <p>This is photoshops version of lorem ipsum</p>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="date_month">
                                                    <span>12 Jan</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div data-target="#anc4" data-toggle="tab">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <img src="../assets/announcements/announcements_thumb4.png" />
                                            </div>
                                            <div class="col-md-6">
                                                <h5>New Caffeteria</h5>
                                                <p>This is photoshops version of lorem ipsum</p>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="date_month">
                                                    <span>12 Jan</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div data-target="#anc5" data-toggle="tab">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <img src="../assets/announcements/announcements_thumb5.png" />
                                            </div>
                                            <div class="col-md-6">
                                                <h5>New Caffeteria</h5>
                                                <p>This is photoshops version of lorem ipsum</p>
                                            </div>
                                            <div class="col-md-3">
                                                <div class="date_month">
                                                    <span>12 Jan</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>--%>
                    <div class="col-md-4">

                        <h4>Announcements List</h4>

                        <ul id="ul_announcements" runat="server" class="sidebar-menu">
                            <asp:Repeater ID="AnnouncementRepeater" runat="server">
                                <ItemTemplate>

                                    <li id="liann" runat="server" class="nav nav-tabs tabs-left">
                                        <a id="a" href='<%# Eval("Id")%>' runat="server" onserverclick="a_ServerClick" class="row">
                                            <div class="col-xs-2 not_img">
                                                <%--<img src="../assets/dashboard/impnotif_read.png" />--%>
                                                <img src="<%# Eval("ImagePath") %>" style="width: 60px; height: 70px;" alt="" />
                                            </div>
                                            <div class="col-xs-10">
                                                <p>
                                                    <%--<asp:Label ID="lbldescription" runat="server" Text='<%# Eval("Description")%>'></asp:Label>--%>
                                                    <asp:Label ID="lblFrom" runat="server" Text='<%# Eval("From")%>'></asp:Label>
                                                </p>
                                                <h6>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("Id")%>'></asp:Label>
                                                    <asp:Label ID="lblheading" runat="server" Text='<%# Eval("Heading")%>'></asp:Label>
                                                    <br />
                                                    <asp:Label ID="lblCreatedDateTime" runat="server" Text='<%#Eval("CreatedDatetime") %>'>'></asp:Label>
                                                </h6>

                                            </div>
                                            <%--<asp:HiddenField ID="HDId" runat="server" Value='<%# Eval("Id")%>' />--%>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                        <%--<div class="read_all text-right">
                        <asp:Button ID="btnreadallannouncements" runat="server" Text="Read All" class="btn btn-info" OnClick="btnreadallannouncements_Click"></asp:Button>
                    </div>--%>
                    </div>
                    <div class="col-md-8 ">
                        <div class="tab-content">
                            <div class="tab-pane active" id="ancid" runat="server">
                                <div class="row">
                                    <div class="col-xs-2">
                                        <img id="imgSelectedAnnouncementDetails" style="width: 60px; height: 70px;" runat="server" src="" alt="" />
                                        <%--<img src="../assets/announcements/announcements_thumb1.png" />--%>
                                    </div>
                                    <div class="col-xs-10">
                                        <p>
                                            <asp:Label ID="lblselectedFrom" runat="server" Text=""></asp:Label>
                                        </p>
                                        <h4>
                                            <%--<asp:Label ID="lblhd" runat="server" Text='<%# Eval("Heading")%>'></asp:Label></h4>--%>
                                            <asp:Label ID="lblhd" runat="server" Text=""></asp:Label></h4>
                                        <span id="spnCreatedDate" runat="server" class="anc_date"></span>
                                    </div>
                                </div>
                                <div class="news_content">
                                    <%--<asp:Label ID="lbldescp" runat="server" Text='<%# Eval("Description")%>'></asp:Label>--%>
                                    <asp:Label ID="lbldescp" runat="server" Text=""></asp:Label>
                                    <%--asjfkbnvkjfbv--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
