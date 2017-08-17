<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="news_update.aspx.cs" Inherits="MySpace.Pages.news_update" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        function initialize() {

            //var appcallmarker = JSON.parse('<%--<%=getNews()%> --%>');
        }
    </script>
    <style type="text/css">
        div.scrollmenu {
            background-color: #53a8e6;
            overflow: auto;
            white-space: nowrap;
        }

            div.scrollmenu a {
                display: inline-block;
                color: white;
                text-align: center;
                padding: 14px;
                text-decoration: none;
            }

                div.scrollmenu a:hover {
                    background-color: #777;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">

        <div class="row section-1">
            <div class="page-header">
                <h4>News Updates</h4>
            </div>
        </div>
        <div class="row section-2">
            <div class="container-fluid">
                <div class="upcomming_activities tips news_update">
                    <div class="row">
                        <asp:TextBox ID="txt_search" runat="server" Width="500px" Height="30px"></asp:TextBox>
                        <asp:Button runat="server" Text="SEARCH" ID="btn_btn" Height="40px" OnClick="btn_btn_Click" CommandName="Search" />

                        <br />
                    </div>
                    <%-- My Changes Start --%>
                    <div class="scrollmenu">

                        <asp:Repeater ID="NewsCategoryRepeater" runat="server">
                            <ItemTemplate>
                                <a id="ancNewsCategory" style="font-weight:bold;" href='<%# Eval("category")%>' runat="server" onserverclick="ancNewsCategory_ServerClick"><%# Eval("category")%></a>
                                <%--<asp:LinkButton ID="anchorNewsCategory" runat="server" Text='<%# Eval("category")%>' OnClick="anchorNewsCategory_ServerClick"></asp:LinkButton>--%>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <%-- My Changes End --%>
                    <div>
                        <%--<div class="col-md-4">
                            <h4>News List</h4>
                            <div class="write_to tips_down">
                                <div class="row">--%>
                        <%--<div class="col-md-12">--%>
                        <%--<span>Global</span>
                                    <i class="fa fa-caret-down" aria-hidden="true"></i>
                                </div>
                            </div>
                        </div>--%>
                        <ul class="nav nav_tabs tabs-left">
                            <li class="active">
                                <div data-target="#tips1" style="overflow:auto; height:500px;">
                                    <div>
                                        <asp:DataList ID="DataList1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" GridLines="Both" CellSpacing="2" ForeColor="Black">
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle BackColor="White" />
                                            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                            <HeaderTemplate>
                                                <div>
                                                    Today News  
                                                </div>

                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <a id="ancClickedNewsRecord"  runat="server" href='<%#Eval("url") %>' target="_blank">
                                                    <div>
                                                        <asp:Label runat="server" ID="lblname" Text='<%#Eval("name") %>' Font-Bold="true" Style="color: red;"> </asp:Label>
                                                    </div>
                                                    <div>
                                                        <%--<a id="a1" runat="server" href='<%#Eval("url") %>' target="_blank">abc</a>--%>
                                                        <asp:Label runat="server" ID="lbl_content" Text='<%#Eval("description") %>' Font-Bold="true"> </asp:Label>
                                                    </div>
                                                    <%--<div>
                                                    <asp:Label runat="server" ID="Label1" Text='<%#Eval("category") %>' Font-Bold="true"> </asp:Label>
                                                </div>--%>
                                                </a>
                                            </ItemTemplate>
                                        </asp:DataList>

                                        <%--<div class="container-fluid act_content tips_content">
                                                <div class="col-md-3">
                                                    <div class="activity_img tips_img">
                                                        <img src="../assets/crop_space/tips/tips_thumb1.png" />
                                                    </div>
                                                </div>
                                                <div class="col-md-9">
                                                    <h5 class="activity_headding">Office picnic party</h5>
                                                    <p>This is photoshop version of lorem ipsumsnsfn</p>
                                                    <span class="activity_venue">16 Jan</span>
                                                </div>
                                            </div>--%>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <%--<div class="col-md-7">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tips1">
                                <div class="row">
                                    <div class="col-md-9 act_posts">
                                        <div class="act_post_img">
                                            <img src="../assets/crop_space/tips/top_banner.png" />
                                        </div>
                                        <div class="row act_post_heading tips_post_heading">
                                            <div class="col-md-12">
                                                <h5 class="event_headding">Annual Business Event 2017</h5>
                                                <span class="tips_date">16 Jan 2017</span>
                                            </div>
                                        </div>
                                        <div class="source">
                                            Source : <span class="src_name">Times of India</span>
                                        </div>
                                        <div class="tips_desc">
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                                                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                                                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                            </p>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                            consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                                                            cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                                                            proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tips2">
                                <div class="row">
                                    <div class="col-md-9 act_posts">
                                        <div class="act_post_img">
                                            <img src="../assets/crop_space/grp_act/activity_banner.png" />
                                        </div>
                                        <div class="row act_post_heading tips_post_heading">
                                            <div class="col-md-12">
                                                <h5 class="event_headding">Office picnic party</h5>
                                                <span class="tips_date">16 Jan 2017</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
