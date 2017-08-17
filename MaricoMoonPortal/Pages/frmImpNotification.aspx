﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="frmImpNotification.aspx.cs" Inherits="MySpace.Pages.frmImpNotification" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    <div class="container-fluid">
        <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">--%>
        <%--    <div class="box-body">--%>
        <!-- START CUSTOM TABS -->
        <%--    <h2 class="page-header">User Master</h2>--%>

        <div class="row">



            <div class="col-md-12">
                <!-- Horizontal Form -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">Notification</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <%--     <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>--%>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->

                    <div class="box-body">

                        <div class="form-group">
                            <label id="lblimg" runat="server" class="col-sm-2">Image Upload</label>

                            <div class="col-sm-10">
                                <asp:FileUpload ID="ImageUpload" runat="server" />
                                <%-- <br /><br />--%>
                                <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Heading</label>
                            </div>
                            <div class="col-md-12">
                                <asp:TextBox ID="txtheading" runat="server" class="form-control" Width="100%" required="required"></asp:TextBox>
                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                                                      ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtheading"></asp:RequiredFieldValidator>
                                --%>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <label>Description</label>
                            </div>
                            <div class="col-md-12">
                                <asp:TextBox ID="txtdescp" runat="server" class="form-control" required="required" TextMode="MultiLine" Width="100%"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <label>From</label>
                            </div>
                            <div class="col-md-12">
                                <asp:TextBox ID="txtFrom" runat="server" class="form-control" required="required" Width="100%"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="box-body">
                        <div class="form-group">
                            <div class="col-sm-6">
                                <div class="box-body">
                                    <div class="form-group">
                                        <div class="input-group-btn">
                                            <asp:Button ID="btnaddnew" runat="server" Text="Add New Notification" class="btn btn-primary" OnClick="btnaddnew_Click" />
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>


                </div>
                <!-- nav-tabs-custom -->

                <!-- /.col -->

            </div>

        </div>
        <!-- /.row -->
        <!-- END CUSTOM TABS -->
        <%--    </div>--%>
        <div class="row">
            <div class="col-xs-12">
                <div class="slimScrollDiv" style="position: relative; overflow: scroll; width: auto; height: 250px;">

                    <asp:Panel ID="pnlgrid" runat="server" Visible="true">
                        <div class="box">
                            <div class="box-header">
                                <h3 class="box-title">Important Notification Details</h3>
                                <div class="box-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                                        <div class="input-group-btn">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search" onclick=""></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body table-responsive no-padding">
                                <asp:GridView ID="gvimpnotification" runat="server" AutoGenerateColumns="False" class="table table-bordered" OnRowDataBound="gvimpnotification_RowDataBound" OnRowUpdating="gvimpnotification_RowUpdating" OnRowCommand="gvimpnotification_RowCommand" OnRowEditing="gvimpnotification_RowEditing" OnRowCancelingEdit="gvimpnotification_RowCancelingEdit" OnPageIndexChanging="gvimpnotification_PageIndexChanging"
                                    EnableViewState="true" PageSize="4" ShowHeader="true" AllowPaging="true"
                                    EmptyDataText="<center> No Records Found</center>">


                                    <PagerStyle CssClass="pagination-ys" HorizontalAlign="Left" />
                                    <PagerSettings Mode="Numeric" PageButtonCount="5" FirstPageText="First"
                                        LastPageText="Last" />


                                    <HeaderStyle BackColor="#A4A2A2" ForeColor="White" CssClass="dataTableHeader" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr No">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Id" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblID" runat="server" Text='<%# Eval("Id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Heading">
                                            <ItemTemplate>
                                                <asp:Label ID="lblheading" runat="server" Text='<%# Eval("Heading")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtheading" runat="server" Text='<%# Eval("Heading")%>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Description">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldescp" runat="server" Text='<%# Eval("Description")%>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtdescp" runat="server" Text='<%# Eval("Description")%>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="From">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblFrom" runat="server" Text='<%# Eval("From")%>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtFrom" runat="server" Text='<%# Eval("From")%>'></asp:TextBox>
                                                </EditItemTemplate>
                                            </asp:TemplateField>


                                        <asp:TemplateField HeaderText="CreatedDateTime">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldatetime" runat="server" Text='<%# Eval("CreatedDate")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <div class="form-group">
                                                    <label>
                                                        <asp:CheckBox ID="chkflag" runat="server" OnCheckedChanged="chkflag_CheckedChanged" class="flat-red" AutoPostBack="true" />
                                                    </label>
                                                </div>
                                                <%-- <asp:Label ID="lblempcode" runat="server" Text='<%# Eval("Flag")%>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                         <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("ImagePath")%>' Height="80px" Width="100px" />
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:Image ID="img_user" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Height="80px" Width="100px" /><br />
                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                </EditItemTemplate>
                                            </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Edit">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtnedit" CommandName="Edit" runat="server" OnClick="lbtnedit_Click">
                                             <i class="fa fa-edit"></i> Edit
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                            <EditItemTemplate>

                                                <asp:LinkButton ID="btn_Update" runat="server" Text="Update" class="btn btn-primary btn-xs" CommandName="Update"></asp:LinkButton>
                                                <asp:LinkButton ID="btn_Cancel" runat="server" Text="Cancel" class="btn btn-primary btn-xs" CommandName="Cancel"></asp:LinkButton>

                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>

                                </asp:GridView>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </asp:Panel>
                </div>
                <!-- /.box -->
            </div>
        </div>
    </div>
</asp:Content>
