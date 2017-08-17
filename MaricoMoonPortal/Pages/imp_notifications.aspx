<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="imp_notifications.aspx.cs" Inherits="MySpace.Pages.imp_notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row section-1">
            <div class="page-header">
                <h4>Important Notifications</h4>
            </div>
        </div>
        <div class="row section-2">
            <div class="container-fluid">
                <div class="row announcements_sec notification_sec">
                    <div class="col-md-4" style="overflow-y: scroll; height: 500px;">
                        <h4>Notification List</h4>
                        <ul id="ul_notification" runat="server" class="sidebar-menu">
                            <asp:Repeater ID="NotificationRepeater" runat="server" OnItemDataBound="NotificationRepeater_ItemDataBound">
                                <ItemTemplate>
                                    <asp:HiddenField ID="HDId" runat="server" Value='<%# Eval("Id")%>' />
                                    <li id="liann" runat="server" class="nav nav-tabs tabs-left">
                                        <a href='<%# Eval("Id")%>' id="a" runat="server" onserverclick="a_ServerClick" class="row">
                                            <div class="col-md-2 not_img">
                                                <%--<img src="../assets/dashboard/impnotif_read.png" />--%>
                                                <%--<img src="../assets/dashboard/impnotif_read.png" />--%>
                                                <img src="<%# Eval("ImagePath") %>" style="width: 60px; height: 70px;" alt="" />
                                            </div>
                                            <div class="col-md-10">
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

                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>
                    <div class="col-md-8 " style="overflow-y: scroll; height: 500px;">
                        <div class="tab-content">
                            <div class="tab-pane active" id="ancid" runat="server">
                                <div class="row">
                                    <div class="col-md-2">
                                        <%--<img src="../assets/dashboard/impnotif_read.png" />--%>
                                        <%--<img src="../assets/announcements/announcements_thumb1.png" />--%>
                                        <img id="imgSelectedImpNotification" style="width: 60px; height: 70px;" runat="server" src="" alt="" />
                                    </div>
                                    <div class="col-md-10">
                                        <p>
                                            <asp:Label ID="lblSelectedFrom" runat="server" Text=""></asp:Label>
                                        </p>
                                        <h4>
                                            <asp:Label ID="lblhd" runat="server" Text=""></asp:Label></h4>
                                        <span id="spnCreatedDate" runat="server" class="anc_date"></span>
                                    </div>
                                </div>
                                <div class="news_content">
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
