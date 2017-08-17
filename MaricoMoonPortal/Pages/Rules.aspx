<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="Rules.aspx.cs" Inherits="MySpace.Pages.Rules" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }
    </style>
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 300px;
            height: 140px;
        }
    </style>
    <script type="text/javascript">
        function ShowModalPopup() {
            $find("mpe").show();
            return false;
        }
        function HideModalPopup() {
            $find("mpe").hide();
            return false;
        }
    </script>
    <style type="text/css">
        .paginationClass span {
            font-weight: bold;
        }
    </style>
    <style type="text/css">
        body {
            font-family: Arial;
            font-size: 10pt;
        }

        .GridPager a, .GridPager span {
            display: block;
            height: 30px;
            width: 30px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }

        .GridPager span {
            background-color: #A1DCF2;
            color: #000;
            border: 1px solid #3AC0F2;
        }
    </style>
    <style type="text/css">
        .rounded_corners {
            border: 1px solid #A1DCF2;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            overflow: hidden;
        }

            .rounded_corners td, .rounded_corners th {
                border: 1px solid #A1DCF2;
                font-family: Arial;
                font-size: 10pt;
                text-align: center;
            }

            .rounded_corners table table td {
                border-style: none;
            }

        .pagination-ys {
            /*display: inline-block;*/
            padding-left: 0;
            margin: 20px 0;
            border-radius: 4px;
        }

            .pagination-ys table > tbody > tr > td {
                display: inline;
            }

                .pagination-ys table > tbody > tr > td > a,
                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    color: #dd4814;
                    background-color: #ffffff;
                    border: 1px solid #dddddd;
                    margin-left: -1px;
                }

                .pagination-ys table > tbody > tr > td > span {
                    position: relative;
                    float: left;
                    padding: 8px 12px;
                    line-height: 1.42857143;
                    text-decoration: none;
                    margin-left: -1px;
                    z-index: 2;
                    color: #aea79f;
                    background-color: #f5f5f5;
                    border-color: #dddddd;
                    cursor: default;
                }

                .pagination-ys table > tbody > tr > td:first-child > a,
                .pagination-ys table > tbody > tr > td:first-child > span {
                    margin-left: 0;
                    border-bottom-left-radius: 4px;
                    border-top-left-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td:last-child > a,
                .pagination-ys table > tbody > tr > td:last-child > span {
                    border-bottom-right-radius: 4px;
                    border-top-right-radius: 4px;
                }

                .pagination-ys table > tbody > tr > td > a:hover,
                .pagination-ys table > tbody > tr > td > span:hover,
                .pagination-ys table > tbody > tr > td > a:focus,
                .pagination-ys table > tbody > tr > td > span:focus {
                    color: #97310e;
                    background-color: #eeeeee;
                    border-color: #dddddd;
                }
    </style>
    <script type="text/javascript">

        //function ShowNewsLetter() {

        //    $('li.col-md-1').on('click', function (e) {
        //        e.preventDefault();
        //        $('.col-md-1').removeClass('active');
        //        $(this).addClass('active');

        //        //var clickedURL = $('a', this).attr('href');
        //        //var id = $("'" + clickedURL + "'").attr('id');
        //        //alert(id);
        //        //alert(clickedURL);
        //        //alert($(clickedURL).attr('class'));

        //        //var c = $(clickedURL).attr('class');
        //        //alert(c);

        //        //$('tab-pane').removeClass('active');
        //        //$(c).addClass('active');
        //    });

        //}

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
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
                        <h4>Rules</h4>
                        <ul class="nav nav_tabs tabs-left">
                            <li>
                                <a id="ancliCompRuleTab" href="#CompanyRulesTab" style="padding: 5px 10px;" runat="server" onserverclick="ancliCompRuleTab_ServerClick">
                                    <%--<div data-target="#CompanyRulesTab">--%>
                                    <div class="row">
                                        <div class="container-fluid act_content tips_content">
                                            <div class="col-md-12">
                                                <h5 class="activity_headding">Company Rules</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <%--</div>--%>
                                </a>
                            </li>
                            <li>
                                <a id="ancliRSSRuleTab" href="#RSSRulesTab" style="padding: 5px 10px;" runat="server" onserverclick="ancliRSSRuleTab_ServerClick">
                                    <%--<div data-target="#RSSRulesTab">--%>
                                    <div class="row">
                                        <div class="container-fluid act_content tips_content">
                                            <div class="col-md-12">
                                                <h5 class="activity_headding">RSS Rules</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <%--</div>--%>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <%--<div class="col-md-9">
                        <div class="tab-content" style="overflow-y: scroll; height: 300px;">
                            <div class="tab-pane active" id="CompanyRulesTab">
                                <div class="tab-pane active" id="CompanyRules">
                                    <ul style="padding: 0;">
                                        <asp:Repeater ID="RepeaterCompRules" runat="server">
                                            <ItemTemplate>
                                                <li style="list-style: none;">
                                                    <a id="ancliCompanyRules" runat="server" href='<%#Eval("CompSurveyId") %>' >
                                                        <div class="col-md-12">
                                                            <h5><%#Eval("Heading") %></h5>
                                                            <span><%#Eval("CreatedDatetime") %></span>
                                                        </div>


                                                    </a>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                                <div class="tab-pane" id="GoogleSurvey">
                                    <ul style="padding: 0;">
                                        <asp:Repeater ID="RepeaterGoogleSurvery" runat="server">
                                            <ItemTemplate>
                                                <li style="list-style: none;">
                                                    <a id="ancliGoogleSurvey" href='<%#Eval("Link") %>' target="_blank">
                                                        <div class="col-md-12">
                                                            <h5><%#Eval("Heading") %></h5>
                                                        </div>
                                                    </a>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-pane active" id="RssRules">

                            </div>
                        </div>
                    </div>--%>
                    <div class="col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane" id="RSSRulesTab" runat="server">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4>RSS Rules List</h4>
                                        <ul id="ul_Rules" runat="server" class="sidebar-menu">
                                            <asp:Repeater ID="RulesRepeater" runat="server" OnItemDataBound="RulesRepeater_ItemDataBound">
                                                <ItemTemplate>

                                                    <li id="liann" runat="server" class="nav nav-tabs tabs-left">
                                                        <a id="ancRulesList" href='<%# Eval("Id")%>' runat="server" onserverclick="ancRulesList_ServerClick" class="row" style="padding: 0; margin: 0;">
                                                            <div class="col-md-12" style="padding: 0;">
                                                                <h5 style="overflow: hidden; text-overflow: ellipsis;">
                                                                    <asp:Label ID="lblid" runat="server" Visible="true" Text='<%# Eval("Id")%>'></asp:Label>
                                                                    <span id="lblheading" runat="server" style="padding: 0;"><%# Eval("Heading")%></span>
                                                                </h5>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </ul>
                                    </div>
                                    <div class="col-md-9">
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
                                                                            <li style="list-style-type: square;"><%# Eval("ChannelHeading")%></li>

                                                                        </a>

                                                                    </h6>
                                                                </div>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="news_content" style="overflow: auto; height: 500px;">
                                            <ul id="ul2" runat="server" class="sidebar-menu rules_content">
                                                <asp:Repeater ID="RulesItemRepeater" runat="server">
                                                    <ItemTemplate>

                                                        <li id="liann" runat="server" class="nav nav-tabs tabs-left">
                                                            <div class="col-md-12">
                                                                <h6>
                                                                    <%--<a id="ancChannelItem" runat="server" href='<%#Eval("link") %>' onserverclick="ancChannelItem_ServerClick" data-target="#rules_info_popup"><%# Eval("title")%></a>--%>
                                                                    <%--<asp:LinkButton ID="a1" runat="server" CommandArgument='<%#Eval("link") %>' OnClick="a1_Click"><%# Eval("title")%></asp:LinkButton>--%>
                                                                    <li style="list-style-type: disc;"><a id="a1" runat="server" href='<%#Eval("link") %>' target="_blank" style="font-size: medium;"><%# Eval("title")%></a></li>
                                                                </h6>
                                                            </div>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>

                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane" id="CompanyRulesTab" runat="server">
                                <div class="row" style="margin-left:0">
                                    <div class="tab-pane active" id="divCompRules" style="background: #fff;height: 500px; overflow-y:scroll;">
                                        <ul style="padding: 0;">
                                            <asp:Repeater ID="RepeaterCompanyRules" runat="server">
                                                <ItemTemplate>
                                                    <li style="list-style: none;">
                                                        <a id="ancliCompanyRules" runat="server" href='<%#Eval("CompRuleId") %>' onserverclick="ancliCompanyRules_ServerClick">
                                                            <div class="col-md-12">
                                                                <h5><%#Eval("Heading") %></h5>
                                                                <span><%#Eval("CreatedDatetime") %></span>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ul>
                                    </div>
                                </div>

                                <asp:LinkButton ID="lnkdummy" runat="server"></asp:LinkButton>
                                <ajax:ModalPopupExtender ID="MPECompanyRules" BehaviorID="" runat="server" PopupControlID="pnlCompanyRulesPopup" TargetControlID="lnkdummy" BackgroundCssClass="modalBackground" CancelControlID="lnkbtnclose">
                                </ajax:ModalPopupExtender>
                                <div class="modal-content">
                                    <asp:Panel ID="pnlCompanyRulesPopup" runat="server" CssClass="modalPopup" Style="display: none; margin-left: 2%; min-height: 95%; width: 500px;">
                                        <div class="modal-header">
                                            <asp:LinkButton ID="lnkbtnclose" data-dismiss="modal" Style="margin-left: 95%;" runat="server"><i class="fa fa-remove"></i></asp:LinkButton>
                                            <h3 class="box-title">Company Rules Details</h3>
                                        </div>

                                        <div class="modal-body">
                                            <!-- Horizontal Form -->
                                            <!-- /.box-header -->
                                            <!-- form start -->
                                            <div class="form-horizontal">
                                                <div class="box-body">
                                                    <div class="form-group">
                                                        <h4 style="padding: 10px 0;">
                                                            <asp:Label Text="" ID="lblMPEHeading" runat="server" />
                                                            <%--<asp:Label Text="" ID="lblMPECreatedDatetime" runat="server" Style="margin-top: 5px; display: block; font-size: 14px;" />--%>
                                                        </h4>

                                                    </div>

                                                    <div class="form-group">
                                                        <pre id="pMPEDesc" runat="server" style="background: none; border: none; border-radius: 0"></pre>
                                                    </div>
                                                </div>
                                                <!-- /.box-body -->
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

</asp:Content>
