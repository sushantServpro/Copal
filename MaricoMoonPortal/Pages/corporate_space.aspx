<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="corporate_space.aspx.cs" Inherits="MySpace.Pages.corporate_space" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div class="container-fluid">
        <div class="row section-1">
            <div class="page-header">
                <h4>Corporate Space</h4>
            </div>
        </div>
        <div class="section-2">
            <div id="corp_tab" class="crop_tab">
                <ul class="nav nav-tabs">
                    <li id="liEvent" class="col-md-1" runat="server">
                        <a id="ancliEvent" href="#divevent" title="Coporate Events" runat="server" onserverclick="ancliEvent_ServerClick">
                            <span class="tab_img event_img"></span>
                            <span>Events</span>
                        </a>
                    </li>
                    <li id="liWOF" class="col-md-1" runat="server">
                        <a id="ancliWOF" href="#wof" title="Wall of Fame" runat="server" onserverclick="ancliWOF_ServerClick">
                            <span class="tab_img wof_img"></span>
                            <span>Wall of Fame</span>
                        </a>
                    </li>
                    <li id="liNewLetter" class="col-md-1" runat="server">
                        <a id="ancliNewsLetter" href="#newsltr" title="Newsletter" runat="server" onserverclick="ancliNewsLetter_ServerClick">
                            <span class="tab_img newsltr_img"></span>
                            <span>Newsletter</span>
                        </a>
                    </li>
                    <li id="liVacancy" class="col-md-1" runat="server">
                        <a id="ancliVacancy" href="#vacancy" title="Vacancy" runat="server" onserverclick="ancliVacancy_ServerClick">
                            <span class="tab_img vacancy_img"></span>
                            <span>Vacancy</span>
                        </a>
                    </li>
                    <li id="liGrpAct" class="col-md-1" runat="server">
                        <a id="ancliGrpAct" href="#gract" title="Group Activity" runat="server" onserverclick="ancliGrpAct_ServerClick">
                            <span class="tab_img gract_img"></span>
                            <span>Group Activity</span>
                        </a>
                    </li>
                    <li id="liSurvey" class="col-md-1" runat="server">
                        <a id="ancliSurvey" href="#survey" title="Survey" runat="server" onserverclick="ancliSurvey_ServerClick">
                            <span class="tab_img survey_img"></span>
                            <span>Survey</span>
                        </a>
                    </li>
                    <li id="liFeedBack" class="col-md-1" runat="server">
                        <a id="ancliFeedBack" href="#feedback" title="Feedback" runat="server" onserverclick="ancliFeedBack_ServerClick">
                            <span class="tab_img feedback_img"></span>
                            <span>Feedback</span>
                        </a>
                    </li>
                    <li id="liTips" class="col-md-1" runat="server">
                        <a id="ancliTips" href="#tips" title="Tips" runat="server" onserverclick="ancliTips_ServerClick">
                            <span class="tab_img tips_img"></span>
                            <span>Tips</span>
                        </a>
                    </li>
                    <li id="liHelpDesk" class="col-md-1" runat="server">
                        <a id="ancliHelpDesk" href="#helpdesk" title="Helpdesk" runat="server" onserverclick="ancliHelpDesk_ServerClick">
                            <span class="tab_img helpdesk_img"></span>
                            <span>Helpdesk</span>
                        </a>
                    </li>
                    <li id="liTraining" class="col-md-1" runat="server">
                        <a id="ancliTraining" href="#training" title="Training" runat="server" onserverclick="ancliTraining_ServerClick">
                            <span class="tab_img training_img"></span>
                            <span>Training</span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane event_tab cmn_tab " id="divevent" runat="server">
                        <div class="row" id="hideEventDesc">
                            <div class="col-md-4" style="overflow-y: scroll; height: 300px;">
                                <h4>Events</h4>
                                <ul class="nav nav-tabs tabs-left">
                                    <%-- Event Repeater Start --%>
                                    <asp:Repeater ID="RepeaterEvents" runat="server">
                                        <ItemTemplate>
                                            <li id="liann" runat="server" class="nav nav-tabs tabs-left">
                                                <a href='<%#Eval("Id") %>' id="ancliEvent" runat="server" onserverclick="ancliEvent_ServerClick1">
                                                    <div class="col-md-2 not_img">
                                                        <img src='<%#Eval("ImagePath") %>' style="width: 40px; height: 50px;" />
                                                    </div>
                                                    <div class="col-md-10">
                                                        <h6 style="text-align: left;">
                                                            <asp:Label Text='<%#Eval("HeaderName") %>' runat="server"></asp:Label><br />
                                                            <asp:Label Text='<%#Eval("EventDate") %>' runat="server"></asp:Label>

                                                        </h6>
                                                    </div>
                                                </a>
                                            </li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <%-- Event Repeater End --%>
                                </ul>
                            </div>
                            <div class="col-md-8">
                                <div class="tab-content" style="overflow-y: scroll; height: 300px;">
                                    <div class="tab-pane active" id="Div1">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <img id="imgSelectedEvent" style="width: 60px; height: 70px;" runat="server" src="" alt="" />
                                            </div>
                                            <div class="col-md-10">
                                                <h4>
                                                    <asp:Label ID="lblHeading" runat="server" Text=""></asp:Label></h4>
                                                <span id="spnEventDate" runat="server" class="anc_date"></span>
                                            </div>
                                        </div>
                                        <div class="news_content">
                                            <asp:Label ID="lbldescp" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane cmn_tab wof_tab" id="wof" runat="server">
                        <div class="row">
                            <%--<div class="col-md-5">
                                <h4>Previously Achieved</h4>
                                <ul class="nav nav-tabs tabs-left">--%>
                            <%-- <asp:Repeater ID="repeater1" runat="server" OnItemDataBound="repeater1_ItemDataBound">
                                        <ItemTemplate>--%>
                            <%--<li>

                                                <div class="row">
                                                    <div data-target="#wof2" data-toggle="tab">

                                                        <div class="col-md-2">
                                                            <img src="../assets/crop_space/wall_of_fame/trophy_history.png" />
                                                        </div>
                                                        <div class="col-md-10">
                                                            <h5>Young talent, acheiver of 
                                                                <asp:Label ID="lblyear" runat="server"></asp:Label>
                                                            </h5>
                                                            <p>
                                                                <asp:Label ID="pdescp" runat="server"></asp:Label>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>

                                            </li>--%>
                            <%--     </ItemTemplate>
                                    </asp:Repeater>--%>
                            <%--</ul>

                            </div>--%>
                            <div class="col-md-7">
                                <div class="ach_mnth_heading">
                                    <h4>
                                        <img src="../assets/crop_space/wall_of_fame/star.png" />
                                        Achiever of the Month
                                        <img src="../assets/crop_space/wall_of_fame/star.png" />
                                    </h4>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="wof2">
                                        <div class="prof_info">
                                            <div class="row">
                                                <div class="col-md-3 prof_img">
                                                    <%--<img src="../assets/dashboard/profile.png" class="img-circle" alt="User Image">--%>
                                                    <img id="imgWallOfFameAchiever" runat="server" src='<%#Eval("ImagePath") %>' class="img-circle" alt="User Image">
                                                </div>
                                                <div class="col-md-9 prof_desc">
                                                    <div class="prof_name">
                                                        <%--<span>--%>
                                                        <%--<label>Neha Parikh</label></span>--%>
                                                        <asp:Label ID="lblWallOfFameName" runat="server"></asp:Label>
                                                        <%--</span>--%>
                                                    </div>
                                                    <div class="emp_detail row">
                                                        <ul class="nav navbar-nav row">
                                                            <li class="col-md-6">
                                                                <%--<span>--%>
                                                                <img src="../assets/crop_space/wall_of_fame/designation_blue.png" />
                                                                <%--<label>Vice President</label>--%>
                                                                <asp:Label ID="lblDesignation" runat="server"></asp:Label>
                                                                <%--</span>--%>
                                                            </li>
                                                            <li class="col-md-6">
                                                                <%--<span>--%>
                                                                <img src="../assets/crop_space/wall_of_fame/location_blue.png" />
                                                                <%--<label>Mumbai, India</label>--%>
                                                                <asp:Label ID="lblAddress" runat="server"></asp:Label>
                                                                <%--</span>--%>
                                                            </li>
                                                            <li class="col-md-6">
                                                                <%--<span>--%>
                                                                <img src="../assets/crop_space/wall_of_fame/department_blue.png" />
                                                                <%--<label>Compliance</label>--%>
                                                                <asp:Label ID="lblDepartment" runat="server"></asp:Label>
                                                                <%--</span>--%>
                                                            </li>
                                                            <li class="col-md-6">
                                                                <span>
                                                                    <img src="../assets/crop_space/wall_of_fame/private_blue.png" />
                                                                    <label>Private</label>
                                                                </span>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row awd_name">
                                                <div class="col-md-2 text-center">
                                                    <img src="../assets/crop_space/wall_of_fame/trophy_achieved.png" />
                                                </div>
                                                <div class="col-md-8 text-center">
                                                    <%--<h4>Young Talent, Achiever of--%>
                                                    <h4>
                                                        <asp:Label ID="lblWallofFameHeader" runat="server"></asp:Label>
                                                        <asp:Label ID="lblyearnmonth" runat="server"></asp:Label></h4>
                                                </div>
                                                <div class="col-md-2 text-center">
                                                    <img src="../assets/crop_space/wall_of_fame/trophy_achieved.png" />
                                                </div>
                                            </div>
                                            <div class="awd_desc">
                                                <h5>Description</h5>
                                                <%--<p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                </p>--%>
                                                <p id="pWallofFameDescription" runat="server"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--<div class="tab-pane cmn_tab newsltr vacancy" id="newsltr">
                        <div class="row">
                            <div class="col-md-4">
                                <h4>Newsletters</h4>
                                <ul class="nav nav-tabs tabs-left">
                                    <li class="active">
                                        <div data-target="#news1" data-toggle="tab">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <img src="../assets/crop_space/news_letters/newsletter_icon.png" />
                                                </div>
                                                <div class="col-md-10">
                                                    <h5>My village</h5>
                                                    <span>By cultural committe</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div data-target="#news2" data-toggle="tab">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <img src="../assets/crop_space/news_letters/newsletter_icon.png" />
                                                </div>
                                                <div class="col-md-10">
                                                    <h5>My village</h5>
                                                    <span>By cultural committe</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-8 tab_desc">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="news1">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h4>My Village<span class="full-date">SEP 5, 2016</span></h4>
                                            </div>
                                        </div>
                                        <div class="news_content">
                                            asjfkbnvkjfbv
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <div class="tab-pane cmn_tab newsltr vacancy" id="newsltr" runat="server">
                        <div class="row">
                            <div class="col-md-4" style="overflow-y: scroll; height: 450px;">
                                <h4>Newsletters</h4>

                                <ul class="nav nav-tabs tabs-left">
                                    <asp:Repeater ID="RepeaterNewsLetter" runat="server">
                                        <ItemTemplate>
                                            <a id="ancNewsLetter" href='<%#Eval("Id")%>' runat="server" onserverclick="ancNewsLetter_ServerClick">
                                                <li class="active">
                                                    <%--div data-target="#news1">--%>
                                                    <div class="row">
                                                        <div class="col-md-3">
                                                            <img src="../assets/crop_space/news_letters/newsletter_icon.png" style="width: 30px; height: 30px;" />
                                                        </div>
                                                        <div class="col-md-9">
                                                            <p>
                                                                <%--<asp:Label ID="lbldescription" runat="server" Text='<%# Eval("Description")%>'></asp:Label>--%>
                                                                <asp:Label ID="lblFrom" runat="server" Text='<%# Eval("From")%>'></asp:Label>
                                                            </p>
                                                            <h6>
                                                                <asp:Label ID="lblNewsLetterHeader" runat="server"><%#Eval("NewsHeading") %></asp:Label>
                                                            </h6>
                                                            <asp:Label ID="lblCreatedDateTime" runat="server" Text='<%#Eval("CreatedDatetime") %>'>'></asp:Label>
                                                        </div>
                                                    </div>
                                                    <%--</div>--%>
                                                </li>
                                            </a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>

                            </div>
                            <div class="col-md-8 tab_desc" style="overflow-y: scroll; height: 450px;">
                                <div class="tab-content">
                                    <%--<div class="tab-pane active" id="news1">--%>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>
                                            </p>
                                            <h4>
                                                <asp:Label ID="lblSelEventFrom" runat="server" Text=""></asp:Label><br />
                                                <asp:Label ID="lblNewsHeader" runat="server"></asp:Label>
                                                <span class="full-date" id="spnCreatedDateTime" runat="server"></span></h4>
                                        </div>
                                    </div>
                                    <div class="news_content">
                                        <span id="spnNewLetterDesc" runat="server"></span>
                                    </div>
                                    <%--</div>--%>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--<div class="tab-pane cmn_tab vacancy" id="vacancy">
                        <div class="row">
                            <div class="col-md-4">
                                <h4>Vacancies</h4>
                                <ul class="nav nav-tabs tabs-left">
                                    <li class="active">
                                        <div data-target="#vac1" data-toggle="tab">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h5>UI/UX Designer</h5>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-8"><span class="location">Gnamsoli, Mumbai</span></div>
                                                    <div class="col-md-4 text-right"><span class="exp">Exp : 3-4 yrs</span></div>
                                                </div>
                                                <div class="col-md-12">
                                                    <span class="dept">Dept :</span><span class="dept_name">User Interface</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div data-target="#vac2" data-toggle="tab">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <h5>UI/UX Web Developer</h5>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="col-md-8"><span class="location">Rabale, Mumbai</span></div>
                                                    <div class="col-md-4 text-right"><span class="exp">Exp : 1-2 yrs</span></div>
                                                </div>
                                                <div class="col-md-12">
                                                    <span class="dept">Dept :</span><span class="dept_name">User Interface</span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-8 tab_desc">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="vac1">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h4>UI/UX Designer<span class="full-date">SEP 5, 2016</span></h4>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Experiance</h5>
                                                    <span>3-4 yrs</span>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Location</h5>
                                                    <span>Ghansoli, Mumbai</span>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Department</h5>
                                                    <span>User Interface</span>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Job Description</h5>
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Contact Details</h5>
                                                    <span class="cont_name">Mr. Ankush Khapdia</span>
                                                    <span class="cont_no">9865320147</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="vac2">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h4>UI/UX Web Devloper<span class="full-date">SEP 5, 2016</span></h4>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Experiance</h5>
                                                    <span>1-2 yrs</span>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Location</h5>
                                                    <span>Rabale, Mumbai</span>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Department</h5>
                                                    <span>User Interface</span>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Job Description</h5>
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Contact Details</h5>
                                                    <span class="cont_name">Mr. Ankush Khapdia</span>
                                                    <span class="cont_no">9865320147</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <div class="tab-pane cmn_tab vacancy" id="vacancy" runat="server">
                        <div class="row">
                            <div class="col-md-4" style="overflow-y: scroll; height: 450px;">
                                <h4>Vacancies</h4>
                                <ul class="nav nav-tabs tabs-left">
                                    <asp:Repeater ID="RepeaterVacancy" runat="server">
                                        <ItemTemplate>
                                            <a id="ancVancancy" href='<%#Eval("Id") %>' runat="server" onserverclick="ancVancancy_ServerClick">
                                                <li class="active">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <h5>
                                                                <label><%#Eval("JobHeading") %></label>
                                                            </h5>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="col-md-8"><span class="location"><%#Eval("Location") %></span></div>
                                                            <div class="col-md-4 text-right"><span class="exp"><%#Eval("Experience") %></span></div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <span class="dept">Dept :</span><span class="dept_name"><%#Eval("Department") %></span>
                                                        </div>
                                                    </div>
                                                </li>
                                            </a>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                            <div class="col-md-8 tab_desc" id="divVacancyDetails" runat="server" style="overflow-y: scroll; height: 450px;">
                                <div class="tab-content">
                                    <div class="tab-pane active">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h4>
                                                    <asp:Label ID="lblJobHeading" runat="server"></asp:Label>
                                                    <span id="spnVancancyCreatedDateTime" runat="server" class="full-date"></span>
                                                </h4>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Experiance</h5>
                                                    <span id="spnVancExperience" runat="server"></span>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Location</h5>
                                                    <span id="spnVancLocation" runat="server"></span>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Department</h5>
                                                    <span id="spnVancDept" runat="server"></span>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Job Description</h5>
                                                    <p id="pVancDecsription" runat="server">
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div>
                                                    <h5>Contact Details</h5>
                                                    <span id="spnVancContactName" runat="server" class="cont_name"></span>
                                                    <span id="spnVancContactNo" runat="server" class="cont_no"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--<div class="tab-pane" id="gract">
                        <div class="online_games">
                            <h4>Online Games</h4>
                            <div class="game_slider">
                                <div id="gameCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
                                    <div class="carousel-inner">
                                        <div class="item active">
                                            <div class="row">
                                                <div class="col-md-2 text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/sudoku.png" /></span>
                                                        <span>Sudoku</span>
                                                    </a>
                                                </div>
                                                <div class="col-md-2  text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/crossword.png" /></span>
                                                        <span>Crossword</span>
                                                    </a>
                                                </div>
                                                <div class="col-md-2  text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/words.png" /></span>
                                                        <span>Word</span>
                                                    </a>
                                                </div>
                                                <div class="col-md-2  text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/match_tiles.png" /></span>
                                                        <span>Match Tiles</span>
                                                    </a>
                                                </div>
                                                <div class="col-md-2  text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/sudoku.png" /></span>
                                                        <span>Sudoku</span>
                                                    </a>
                                                </div>
                                                <div class="col-md-2  text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/crossword.png" /></span>
                                                        <span>Crossword</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div class="row">
                                                <div class="col-md-2 text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/sudoku.png" /></span>
                                                        <span>Sudoku</span>
                                                    </a>
                                                </div>
                                                <div class="col-md-2  text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/crossword.png" /></span>
                                                        <span>Crossword</span>
                                                    </a>
                                                </div>
                                                <div class="col-md-2  text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/words.png" /></span>
                                                        <span>Word</span>
                                                    </a>
                                                </div>
                                                <div class="col-md-2  text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/match_tiles.png" /></span>
                                                        <span>Match Tiles</span>
                                                    </a>
                                                </div>
                                                <div class="col-md-2  text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/sudoku.png" /></span>
                                                        <span>Sudoku</span>
                                                    </a>
                                                </div>
                                                <div class="col-md-2  text-center">
                                                    <a href="#">
                                                        <span>
                                                            <img src="../assets/crop_space/grp_act/crossword.png" /></span>
                                                        <span>Crossword</span>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="left control" href="#gameCarousel" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right control" href="#gameCarousel" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="upcomming_activities">
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>Upcoming Activities</h4>
                                    <ul class="nav nav_tabs tabs-left">
                                        <li>
                                            <div data-target="#act1" data-toggle="tab">
                                                <div class="row">
                                                    <div class="container-fluid act_content">
                                                        <div class="col-md-2">
                                                            <div class="activity_img">
                                                                <img src="../assets/crop_space/grp_act/meeting.png" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <h5 class="activity_headding">Office outdoor meeting</h5>
                                                            <span class="activity_venue">MBP, Mahape</span>
                                                        </div>
                                                        <div class="col-md-2 text-center">
                                                            <h3 class="date">31</h3>
                                                            <span class="month">July</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="active">
                                            <div data-target="#act2" data-toggle="tab">
                                                <div class="row">
                                                    <div class="container-fluid act_content">
                                                        <div class="col-md-2">
                                                            <div class="activity_img">
                                                                <img src="../assets/crop_space/grp_act/getknow.png" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <h5 class="activity_headding">Get to know activity</h5>
                                                            <span class="activity_venue">MBP, Mahape</span>
                                                        </div>
                                                        <div class="col-md-2 text-center">
                                                            <h3 class="date">31</h3>
                                                            <span class="month">July</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div data-target="#act3" data-toggle="tab">
                                                <div class="row">
                                                    <div class="container-fluid act_content">
                                                        <div class="col-md-2">
                                                            <div class="activity_img">
                                                                <img src="../assets/crop_space/grp_act/picnic.png" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <h5 class="activity_headding">Office picnic party</h5>
                                                            <span class="activity_venue">MBP, Mahape</span>
                                                        </div>
                                                        <div class="col-md-2 text-center">
                                                            <h3 class="date">31</h3>
                                                            <span class="month">July</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-7">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="act2">
                                            <div class="row">
                                                <div class="col-md-9 act_posts">
                                                    <div class="act_post_img">
                                                        <img src="../assets/crop_space/grp_act/activity_banner.png" />
                                                    </div>
                                                    <div class="row act_post_heading">
                                                        <div class="col-md-10">
                                                            <h5 class="event_headding">Annual Business Event 2017</h5>
                                                            <span class="event_venue">MBP, Mahape</span>
                                                        </div>
                                                        <div class="col-md-2 text-center">
                                                            <h3 class="date">31</h3>
                                                            <span class="month">July</span>
                                                        </div>
                                                    </div>
                                                    <div class="act_post_desc event_description">
                                                        <h5>Description</h5>
                                                        <p>
                                                            <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</span><span>...<a href="#" title="Read More" class="more">more</a></span>
                                                        </p>
                                                    </div>
                                                    <div class="act_post_time">
                                                        <h5>Timings</h5>
                                                        <div class="post_time">
                                                            <span class="full_date">31<sup>st</sup>July 2017</span>
                                                            <span class="time-span">11:00 AM - 2:00 PM</span>
                                                        </div>
                                                        <div class="post_time">
                                                            <span class="full_date">31<sup>st</sup>July 2017</span>
                                                            <span class="time-span">11:00 AM - 2:00 PM</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="act3">
                                            <div class="row">
                                                <div class="col-md-9 act_posts">
                                                    <div class="act_post_img">
                                                        <img src="../assets/crop_space/grp_act/activity_banner.png" />
                                                    </div>
                                                    <div class="row act_post_heading">
                                                        <div class="col-md-10">
                                                            <h5 class="event_headding">Office picnic party</h5>
                                                            <span class="event_venue">MBP, Mahape</span>
                                                        </div>
                                                        <div class="col-md-2 text-center">
                                                            <h3 class="date">12</h3>
                                                            <span class="month">July</span>
                                                        </div>
                                                    </div>
                                                    <div class="act_post_desc event_description">
                                                        <h5>Description</h5>
                                                        <p>
                                                            <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo</span><span>...<a href="#" title="Read More" class="more">more</a></span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <div class="tab-pane cmn_tab vacancy grpActivity" id="gract" runat="server">
                        <%--<div class="row">--%>
                        <div class="col-md-4">
                            <h4>Group Activities</h4>

                            <ul runat="server" class="sidebar-menu">
                                <asp:Repeater ID="RepeaterGrpActTab" runat="server">
                                    <ItemTemplate>
                                        <li id="liGrpActTab" runat="server" class="nav nav-tabs tabs-left">
                                            <a id="ancGroupActTab" href='<%#Eval("GroupActivityId") %>' runat="server" onserverclick="ancGroupActTab_ServerClick">

                                                <%--<div data-target="#news1">--%>
                                                <div class="row">
                                                    <div class="col-md-10">
                                                        <h5>
                                                            <asp:Label ID="lblid" runat="server" Visible="true" Text='<%# Eval("GroupActivityId")%>'></asp:Label>
                                                            <asp:Label ID="lblGrpActTabName" runat="server" Text='<%# Eval("TabName")%>'></asp:Label>
                                                        </h5>
                                                    </div>
                                                </div>
                                                <%--</div>--%>
                                                
                                            </a>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <li>
                                    <a id="ancPuzzleGame" runat="server" onserverclick="ancPuzzleGame_ServerClick">Puzzle</a>
                                </li>
                            </ul>
                        </div>
                        <%--<div class="tab-pane" id="act3">
                                <div class="row">--%>
                        <div class="col-md-8 act_posts">
                            <div class="tab-content">
                                <div class="tab-pane active" id="ancid" runat="server">
                                    <ul id="ul1" runat="server" style="height: 400px; background: #fff; overflow-y: scroll;">

                                        <asp:Repeater ID="RepeaterGrpActSubTab" runat="server">
                                            <ItemTemplate>
                                                <%--<li id="liGrpActSubTab" runat="server" class="nav nav-tabs tabs-left">--%>

                                                <div class="col-md-2  text-center" style="padding: 15px;">
                                                    <a href='<%#Eval("SubTabURL") %>' target="_blank">
                                                        <span>
                                                            <img src='<%#Eval("ImagePath") %>' style="width: 50px; height: 50px;">
                                                        </span>
                                                        <div><%#Eval("SubTabName") %></div>
                                                    </a>
                                                </div>

                                                <%--</li>--%>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                    </ul>
                                </div>
                            </div>
                        </div>

                        <%--</div>--%>
                    </div>

                    <%--<div class="tab-pane cmn_tab survey" id="survey" runat="server">
                        <h4>Surveys</h4>
                        <div class="row">
                            <div class="col-md-5 survey_no">
                                <a href="#">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <img src="../assets/crop_space/surveys/thumb1.png" />
                                        </div>
                                        <div class="col-md-8">
                                            <h5>Survey No. 1</h5>
                                            <p>Survey to check compony cuilture</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-5 col-md-offset-1 survey_no">
                                <a href="#">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <img src="../assets/crop_space/surveys/thumb2.png" />
                                        </div>
                                        <div class="col-md-8">
                                            <h5>Survey No. 2</h5>
                                            <p>Survey to check compony cuilture</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>--%>
                    <div class="tab-pane cmn_tab survey" id="survey" runat="server">

                        <div class="upcomming_activities tips">
                            <div class="row">
                                <%--<div class="col-md-5 survey_no">
                                <a href="#">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h5>Company Survey</h5>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-5 col-md-offset-1 survey_no">
                                <a href="#">

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h5>Google Survey</h5>
                                        </div>
                                    </div>
                                </a>
                            </div>--%>
                                <div class="col-md-3">
                                    <h4>Surveys</h4>
                                    <ul class="nav nav_tabs tabs-left">
                                        <li class="active">
                                            <a href="#" style="padding: 5px 10px;">
                                                <div data-target="#CompanySurvey" data-toggle="tab">
                                                    <div class="row">
                                                        <div class="container-fluid act_content tips_content">
                                                            <div class="col-md-12">
                                                                <h5 class="activity_headding">Company Survey</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div data-target="#GoogleSurvey" data-toggle="tab">
                                                    <div class="row">
                                                        <div class="container-fluid act_content tips_content">
                                                            <div class="col-md-12">
                                                                <h5 class="activity_headding">Google Survey</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-9">
                                    <div class="tab-content" style="overflow-y: scroll; height: 300px;">
                                        <div class="tab-pane active" id="CompanySurvey">
                                            <ul style="padding: 0;">
                                                <asp:Repeater ID="RepeaterCompSurvey" runat="server">
                                                    <ItemTemplate>
                                                        <li style="list-style: none;">
                                                            <a id="ancliCompanySurvey" runat="server" href='<%#Eval("CompSurveyId") %>' onserverclick="ancliCompanyTips_ServerClick">


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
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane cmn_tab feedback" id="feedback" runat="server">
                        <div class="row">
                            <div class="col-md-4">
                                <h4>Feedbacks</h4>
                                <div class="write_to">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <img src="../assets/crop_space/feedback/public_dropdown.png" />
                                            <span>Public Feddbacks</span>
                                            <i class="fa fa-caret-down" aria-hidden="true"></i>
                                        </div>
                                        <div class="col-md-3">
                                            <a href="#write" data-toggle="tab" class="btn btn-info"><i class="fa fa-pencil" aria-hidden="true"></i>
                                                Write</a>
                                        </div>
                                    </div>
                                </div>
                                <ul class="nav nav-tabs tabs-left">
                                    <li class="active">
                                        <div data-target="#fdk1" data-toggle="tab">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <img src="../assets/crop_space/feedback/public_list.png" />
                                                </div>
                                                <div class="col-md-10">
                                                    <h5>This is photoshop version of lorem</h5>
                                                    <p>To: <span class="to">Sachin Chaudhari</span></p>
                                                    <a href="#">
                                                        <img src="../assets/crop_space/feedback/replied_icon.png" /><span class="reply">Nitin Naik</span> : <span>This is the photoshop version of lorem</span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div data-target="#fdk2" data-toggle="tab">
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <img src="../assets/crop_space/feedback/public_list.png" />
                                                </div>
                                                <div class="col-md-10">
                                                    <h5>This is photoshop version of lorem</h5>
                                                    <p>To: <span class="to">Sachin Chaudhari</span></p>
                                                    <a href="#">
                                                        <img src="../assets/crop_space/feedback/replied_icon.png" /><span class="reply">Nitin Naik</span> : <span>This is the photoshop version of lorem</span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>

                            </div>
                            <div class="col-md-8">
                                <div class="feedback_list">
                                    <div class="tab-content">
                                        <div class="tab-pane" id="write">
                                            <div class="write_to_heading">
                                                <h4>Write Feedback</h4>
                                            </div>
                                            <div class="wr_desc">
                                                <div class="row">
                                                    <div class="col-md-1 to">To :</div>
                                                    <div class="col-md-9">
                                                        <input type="text" class="
                                                            m-control" />
                                                    </div>
                                                    <div class="col-md-2">
                                                        <img src="../assets/profile/send_button.png" />
                                                    </div>
                                                </div>
                                                <div class="wr_fd_desc">
                                                    <h6>Write Feedback</h6>
                                                    <textarea class="form-control"></textarea>
                                                </div>
                                                <div class="pri_set">
                                                    <h6>Privacy Settings</h6>

                                                    <div class="keep_anoy">
                                                        <h6>Keep me anonymous</h6>
                                                        <input type="checkbox" data-toggle="toggle">
                                                    </div>

                                                    <div class="keep_private">
                                                        <h6>Keep my feedbacks private</h6>
                                                        <input type="checkbox" checked data-toggle="toggle">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane active" id="fdk1">
                                            <div class="fdk_heading">
                                                <h5>This is the version of lorem Ipsim. dvb kjnV KJdb</h5>
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <p>To: <span class="to">Sachin Chaudhari</span></p>
                                                    </div>
                                                    <div class="col-md-3 text-right"><span class="full_date">31 July 2017</span></div>
                                                </div>
                                            </div>
                                            <div class="all_replies">
                                                <h5>All Replies</h5>

                                                <div class="replies">
                                                    <div class="user_reply">
                                                        <div class="row">
                                                            <div class="col-md-9">
                                                                <span>Sachin </span>
                                                                <img src="../assets/crop_space/feedback/public_chat.png" />
                                                            </div>
                                                            <div class="col-md-3 text-right"><span class="full_date">31 July 2017</span></div>
                                                        </div>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="write_reply">
                                                <div class="row">
                                                    <div class="col-md-11">
                                                        <input type="text" class="form-control" placeholder="Write reply" />
                                                    </div>
                                                    <div class="col-md-1 text-center">
                                                        <img src="../assets/profile/send_button.png" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane" id="fdk2">
                                            <div class="fdk_heading">
                                                <h5>This is the version of lorem Ipsim. dvb kjnV KJdb</h5>
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <p>To: <span class="to">Sachin Chaudhari</span></p>
                                                    </div>
                                                    <div class="col-md-3 text-right"><span class="full_date">31 July 2017</span></div>
                                                </div>
                                            </div>
                                            <div class="all_replies">
                                                <h5>All Replies</h5>

                                                <div class="replies">
                                                    <div class="user_reply">
                                                        <div class="row">
                                                            <div class="col-md-9">
                                                                <span>Sachin </span>
                                                                <img src="../assets/crop_space/feedback/public_chat.png" />
                                                            </div>
                                                            <div class="col-md-3 text-right"><span class="full_date">12 July 2017</span></div>
                                                        </div>
                                                        <p>
                                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                            tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="write_reply">
                                                <div class="row">
                                                    <div class="col-md-11">
                                                        <input type="text" class="form-control" placeholder="Write reply" />
                                                    </div>
                                                    <div class="col-md-1 text-center">
                                                        <img src="../assets/profile/send_button.png" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--<div class="tab-pane cmn_tab" id="tips" runat="server">
                        <div class="upcomming_activities tips">
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>Tips</h4>
                                    <div class="write_to tips_down">
                                        <div class="row">
                                            <div class="col-md-9">
                                                <img src="../assets/crop_space/tips/tips_updates_icon.png" />
                                                <span>Tips Updates</span>
                                                <i class="fa fa-caret-down" aria-hidden="true"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <ul class="nav nav_tabs tabs-left">
                                        <li class="active">
                                            <div data-target="#tips1" data-toggle="tab">
                                                <div class="row">
                                                    <div class="container-fluid act_content tips_content">
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
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div data-target="#tips2" data-toggle="tab">
                                                <div class="row">
                                                    <div class="container-fluid act_content tips_content">
                                                        <div class="col-md-3">
                                                            <div class="activity_img">
                                                                <img src="../assets/crop_space/tips/tips_thumb2.png" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-9">
                                                            <h5 class="activity_headding">Office picnic party</h5>
                                                            <p>This is photoshop version of lorem ipsumgfnsfg</p>
                                                            <span class="activity_venue">16 Jan</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div data-target="#tips3" data-toggle="tab">
                                                <div class="row">
                                                    <div class="container-fluid act_content tips_content">
                                                        <div class="col-md-3">
                                                            <div class="activity_img">
                                                                <img src="../assets/crop_space/tips/tips_thumb3.png" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-9">
                                                            <h5 class="activity_headding">Office picnic party</h5>
                                                            <p>This is photoshop version of lorem ipsumfgn</p>
                                                            <span class="activity_venue">16 Jan</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-7">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tips1">
                                            <div class="row">
                                                <div class="col-md-9 act_posts">
                                                    <div class="act_post_img">
                                                        <img src="../assets/crop_space/tips/top_banner.png" />
                                                    </div>
                                                    <div class="row act_post_heading tips_post_heading">
                                                        <div class="col-md-9">
                                                            <h5 class="event_headding">Annual Business Event 2017</h5>
                                                            <span class="tips_date">16 Jan 2017</span>
                                                        </div>
                                                        <div class="col-md-3 text-center">
                                                            <button class="btn btn-info">
                                                                <img src="../assets/crop_space/tips/bookmark_icon.png" />Bookmark</button>
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
                                                        <div class="col-md-9">
                                                            <h5 class="event_headding">Office picnic party</h5>
                                                            <span class="tips_date">16 Jan 2017</span>
                                                        </div>
                                                        <div class="col-md-3 text-center">
                                                            <button class="btn btn-info">
                                                                <img src="../assets/crop_space/tips/bookmark_icon.png" />Bookmark</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <div class="tab-pane cmn_tab" id="tips" runat="server">
                        <div class="upcomming_activities tips">
                            <div class="row">
                                <div class="col-md-3">
                                    <h4>Tips</h4>
                                    <ul class="nav nav_tabs tabs-left">
                                        <li class="active">
                                            <a href="#" style="padding: 5px 10px;">
                                                <div data-target="#tips1" data-toggle="tab">
                                                    <div class="row">
                                                        <div class="container-fluid act_content tips_content">
                                                            <div class="col-md-12">
                                                                <h5 class="activity_headding">Company Tips</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <div data-target="#tips2" data-toggle="tab">
                                                    <div class="row">
                                                        <div class="container-fluid act_content tips_content">
                                                            <div class="col-md-12">
                                                                <h5 class="activity_headding">Google Tips</h5>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-9">
                                    <div class="tab-content" style="overflow-y: scroll; height: 300px;">
                                        <div class="tab-pane active" id="tips1">
                                            <ul style="padding: 0;">
                                                <asp:Repeater ID="RepeaterCompanyTips" runat="server">
                                                    <ItemTemplate>
                                                        <li style="list-style: none;">
                                                            <a id="ancliCompanyTips" runat="server" href='<%#Eval("Id") %>' onserverclick="ancliCompanyTips_ServerClick">


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
                                        <div class="tab-pane" id="tips2">
                                            <%--<div class="row">
                                                <div class="col-md-9 act_posts">
                                                    <div class="act_post_img">
                                                        <img src="../assets/crop_space/grp_act/activity_banner.png" />
                                                    </div>
                                                    <div class="row act_post_heading tips_post_heading">
                                                        <div class="col-md-9">
                                                            <h5 class="event_headding">Office picnic party</h5>
                                                            <span class="tips_date">16 Jan 2017</span>
                                                        </div>
                                                        <div class="col-md-3 text-center">
                                                            <button class="btn btn-info">
                                                                <img src="../assets/crop_space/tips/bookmark_icon.png" />Bookmark</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>--%>
                                            <ul style="padding: 0;">
                                                <asp:Repeater ID="RepeaterGoogleTips" runat="server">
                                                    <ItemTemplate>
                                                        <li style="list-style: none;">
                                                            <a id="ancliGoogleTips" href='<%#Eval("Link") %>' target="_blank">
                                                                <div class="col-md-12">
                                                                    <h5><%#Eval("Heading") %></h5>
                                                                    <%--<span class="tips_date"><%#Eval("CreatedDatetime") %></span>--%>
                                                                </div>
                                                            </a>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                    </div>

                                    <asp:LinkButton ID="lnkdummy" runat="server"></asp:LinkButton>
                                    <asp:ModalPopupExtender ID="MPECompanyTips" BehaviorID="" runat="server" PopupControlID="pnlCompanyTipsPopup" TargetControlID="lnkdummy" BackgroundCssClass="modalBackground" CancelControlID="lnkbtnclose">
                                    </asp:ModalPopupExtender>
                                    <div class="modal-content">
                                        <asp:Panel ID="pnlCompanyTipsPopup" runat="server" CssClass="modalPopup" Style="display: none; margin-left: 2%; min-height: 95%; width: 500px;">
                                            <div class="modal-header">
                                                <asp:LinkButton ID="lnkbtnclose" data-dismiss="modal" Style="margin-left: 95%;" runat="server"><i class="fa fa-remove"></i></asp:LinkButton>
                                                <h3 class="box-title">Tip Details</h3>
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
                                                                <asp:Label Text="" ID="lblMPECreatedDatetime" runat="server" Style="margin-top: 5px; display: block; font-size: 14px;" />
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

                                <%--<div class="col-md-7">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tips1">
                                            <div class="row">
                                                <div class="col-md-9 act_posts">
                                                    <div class="act_post_img">
                                                        <img src="../assets/crop_space/tips/top_banner.png" />
                                                    </div>
                                                    <div class="row act_post_heading tips_post_heading">
                                                        <div class="col-md-9">
                                                            <h5 class="event_headding">Annual Business Event 2017</h5>
                                                            <span class="tips_date">16 Jan 2017</span>
                                                        </div>
                                                        <div class="col-md-3 text-center">
                                                            <button class="btn btn-info">
                                                                <img src="../assets/crop_space/tips/bookmark_icon.png" />Bookmark</button>
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
                                                        <div class="col-md-9">
                                                            <h5 class="event_headding">Office picnic party</h5>
                                                            <span class="tips_date">16 Jan 2017</span>
                                                        </div>
                                                        <div class="col-md-3 text-center">
                                                            <button class="btn btn-info">
                                                                <img src="../assets/crop_space/tips/bookmark_icon.png" />Bookmark</button>
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

                    <div class="tab-pane cmn_tab" id="helpdesk" runat="server">
                        <div class="helpdesk">
                            <h4>Important Numbers</h4>
                            <div class="row">
                                <div class="container-fluid">
                                    <div class="col-md-4 help_no">
                                        <h5>Police</h5>
                                        <span>100</span>
                                    </div>
                                    <div class="col-md-4 help_no">
                                        <h5>Ambulance</h5>
                                        <span>102</span>
                                    </div>
                                    <div class="col-md-4 help_no">
                                        <h5>Woman's Helpline</h5>
                                        <span>181</span>
                                    </div>
                                    <div class="col-md-4 help_no">
                                        <h5>Fire</h5>
                                        <span>101</span>
                                    </div>
                                    <div class="col-md-4 help_no">
                                        <h5>Disaster Management</h5>
                                        <span>108</span>
                                    </div>
                                    <div class="col-md-4 help_no">
                                        <h5>AIDS Helpline</h5>
                                        <span>108</span>
                                    </div>
                                    <div class="col-md-4 help_no">
                                        <h5>Child Abuse Hotline</h5>
                                        <span>1098</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane cmn_tab training survey" id="training" runat="server">
                        <h4>Training
                        </h4>
                        <div class="row">
                            <div class="col-md-5 survey_no">
                                <a href="#">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <img src="../assets/crop_space/training/training_thumb1.png" />
                                        </div>
                                        <div class="col-md-8">
                                            <h5>Company Software Training</h5>
                                            <p>Training to learn company software</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-5 col-md-offset-1 survey_no">
                                <a href="#">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <img src="../assets/crop_space/training/training_thumb2.png" />
                                        </div>
                                        <div class="col-md-8">
                                            <h5>SAP Training</h5>
                                            <p>Training to learn company SAP software</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
