<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="Rules.aspx.cs" Inherits="MySpace.Pages.Rules" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row section-1">
            <div class="page-header">
                <h4>Rules</h4>
            </div>
        </div>
        <div class="row section-2">
            <div class="container-fluid">
                <div class="row rules_sec">
                    <div class="col-md-3">
                        <h4>Rules List</h4>
                        <ul id="ul_Rules" runat="server" class="sidebar-menu">
                            <asp:Repeater ID="RulesRepeater" runat="server" OnItemDataBound="RulesRepeater_ItemDataBound">
                                <ItemTemplate>

                                    <li id="liann" runat="server" class="nav nav-tabs tabs-left">
                                        <a id="ancRulesList" href='<%# Eval("Id")%>' runat="server" onserverclick="ancRulesList_ServerClick" class="row">
                                            <div class="col-md-10">
                                                <h5>
                                                    <asp:Label ID="lblid" runat="server" Visible="true" Text='<%# Eval("Id")%>'></asp:Label>
                                                    <asp:Label ID="lblheading" runat="server" Text='<%# Eval("Heading")%>'></asp:Label>

                                                </h5>
                                            </div>
                                        </a>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>
                    <div class="col-md-9 ">
                        <div class="tab-content">
                            <div class="tab-pane active" id="ancid" runat="server">
                                <ul id="ul1" runat="server" class="sidebar-menu rules_info">
                                    <asp:Repeater ID="RulesChannelRepeater" runat="server" OnItemDataBound="RulesChannelRepeater_ItemDataBound">
                                        <ItemTemplate>

                                            <li id="liann" runat="server" class="nav nav-tabs tabs-left">
                                                <div class="col-md-10">
                                                    <h6>
                                                        <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("Id")%>'></asp:Label>
                                                        <a id="lblheading" style="font-size: medium;" href='<%#Eval("RSSLink") %>' runat="server" onserverclick="lblheading_Click">
                                                            <li style="list-style-type:square;"><%# Eval("ChannelHeading")%></li>

                                                        </a>

                                                    </h6>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                        <div class="news_content" style="overflow: auto; width: 650px; height: 500px;">
                            <ul id="ul2" runat="server" class="sidebar-menu rules_content">
                                <asp:Repeater ID="RulesItemRepeater" runat="server">
                                    <ItemTemplate>

                                        <li id="liann" runat="server" class="nav nav-tabs tabs-left">
                                            <div class="col-md-12">
                                                <h6>
                                                    <%--<a id="ancChannelItem" runat="server" href='<%#Eval("link") %>' onserverclick="ancChannelItem_ServerClick" data-target="#rules_info_popup"><%# Eval("title")%></a>--%>
                                                    <%--<asp:LinkButton ID="a1" runat="server" CommandArgument='<%#Eval("link") %>' OnClick="a1_Click"><%# Eval("title")%></asp:LinkButton>--%>
                                                    <li style="list-style-type:disc;"><a id="a1" runat="server" href='<%#Eval("link") %>' target="_blank" style="font-size: medium;"><%# Eval("title")%></a></li>
                                                </h6>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>

                        <%-- PopUp Start --%>
                        <%--<div class="modal fade" id="rules_info_popup">--%>
                        <%--<div class="pop-up">
                                <div class="modal-content">
                                    <asp:Panel ID="pnlItemDetailsPopup" runat="server" style="display:none">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h3 class="box-title">New User</h3>
                                        </div>

                                        <div class="modal-body" style="padding: 15px;">
                                            <!-- Horizontal Form -->
                                            <!-- /.box-header -->
                                            <!-- form start -->
                                            <div class="form-horizontal">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <span id="spnItemDetails" runat="server"></span>
                                                        <div class="col-sm-8">
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- /.box-body -->
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>--%>
                        <%--</div>--%>
                        <%-- PopUp End --%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
