<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="inbox.aspx.cs" Inherits="MySpace.Pages.inbox" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row section-1">
            <div class="page-header">
                <h4>Inbox</h4>
            </div>
        </div>
        <div class="row inbox_controls">
            <div class="col-md-4">
                <div class="row">
                    <div class="col-md-2">
                        <input type="image" src="../assets/inbox/compose.png"/>
                    </div>
                    <div class="col-md-2">
                        <input type="image" src="../assets/inbox/calender.png"/>
                    </div>
                    <div class="col-md-2 col-md-offset-6">
                        <input type="image" src="../assets/inbox/refresh.png"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="row inbox">
            <div class="col-md-4">
                <div class="inbox_select">
                    <select class="form-control">
                        <option value="0">Recieved</option>
                        <option value="1">Draft</option>
                        <option value="2">Sent</option>
                        <option value="3">Pending</option>
                        <option value="4">Trash</option>
                        <option value="5">PSTs</option>
                    </select>
                    <i class="fa fa-caret-down inb_drop" aria-hidden="true"></i>
                </div>
                <div class="mail_search">
                    <div class="input-group add-on">
                        <input class="form-control" placeholder="Search" name="srch-term" id="srch-term" type="text">
                        <div class="input-group-btn">
                            <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                        </div>
                    </div>
                </div>
                <ul class="nav nav-tabs tabs-left inbox_list">
                    <li class="active">
                        <div data-target="#mail1" data-toggle="tab">
                            <div class="row">
                                <div class="col-md-9">
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
                        <div data-target="#mail2" data-toggle="tab">
                            <div class="row">
                                <div class="col-md-9">
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
            </div>
            <div class="col-md-8">
                <div class="tab-content">
                    <div class="tab-pane active" id="mail1">
                        <div class="container-fluid">
                            <div class="row mail_heading">
                                <div class="col-md-9">
                                    <h5>This is photoshop version</h5>
                                </div>
                                <div class="col-md-1">
                                    <input type="image" src="../assets/inbox/reply.png"/>
                                </div>
                                <div class="col-md-1">
                                    <input type="image" src="../assets/inbox/forward.png"/>
                                </div>
                                <div class="col-md-1">
                                    <input type="image" src="../assets/inbox/delete.png"/>
                                </div>
                            </div>
                            <div class="row mailer_name">
                                <div class="col-md-8">
                                    <strong>Ritesh Mehta</strong>
                                </div>
                                <div class="col-md-4">
                                    <span class="mail_date">5:40 PM, July 17, 2017</span>
                                </div>
                            </div>
                            <div class="mail_body">
                               
                            </div>
                            <div class="mail_attachment">
                                <h5>Attachments</h5>
                                <div class="att_list">
                                    <div class="row">
                                        <div class="col-md-7 col-md-offset-1"><span class="att_name">abc.pdf</span></div>
                                        <div class="col-md-3">
                                            <a href="#" class="download">Download <img src="../assets/inbox/download.png" /></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
