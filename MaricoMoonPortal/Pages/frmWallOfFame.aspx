﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="frmWallOfFame.aspx.cs" Inherits="MySpace.Pages.frmWallOfFame" %>

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

    <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="true" />
    <section class="content">
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
                            <h3 class="box-title">Events</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->

                        <div class="box-body">
                            <div class="form-group">
                                <%--    <div class="col-sm-6">
                                       <label >Select Profile</label>
                                    <asp:DropDownList ID="ddlprofile" class="form-control" runat="server">
                                    </asp:DropDownList>
                                    <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                                </div>--%>

                                <div class="col-sm-6">

                                    <div class="input-group">
                                        <asp:TextBox name="table_search" ID="txtsearch" runat="server" class="form-control pull-right" placeholder="Search Heading Name"></asp:TextBox>
                                        <span class="input-group-btn">
                                            <%--  <asp:LinkButton ID="lbtnsearch" runat="server" class="btn btn-flat" ><i class="fa fa-search"></i></asp:LinkButton>--%>
                                            <asp:Button ID="btnsearch" Text="Search" runat="server" class="btn btn-flat" OnClick="btnsearch_Click" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="box-body">
                            <div class="form-group">


                                <div class="col-sm-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="input-group-btn">
                                                <asp:Button ID="btnaddwalloffame" runat="server" Text="Add New Wall Of Fame
                                                     Event"
                                                    class="btn btn-primary" OnClick="btnaddwalloffame_Click1" />
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
            <div class="box">
                <div class="slimScrollDiv" style="position: relative; overflow: scroll; width: auto; height: 250px;">

                    <asp:Panel ID="pnlgrid" runat="server" Visible="false">
                        <div class="box-header with-border">
                            <h3 class="box-title">Wall Of Fame</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                            </div>

                        </div>

                        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                        <!-- /.box-header -->
                        <div class="box-body">


                            <asp:GridView ID="gvWallOfFame" runat="server" AutoGenerateColumns="False" class="table table-bordered"
                                OnRowDataBound="gvWallOfFame_RowDataBound" OnRowUpdating="gvWallOfFame_RowUpdating" OnRowCommand="gvWallOfFame_RowCommand"
                                OnRowEditing="gvWallOfFame_RowEditing" OnRowCancelingEdit="gvWallOfFame_RowCancelingEdit" OnPageIndexChanging="gvWallOfFame_PageIndexChanging"
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

                                    <asp:TemplateField HeaderText="Employee Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblempcode" runat="server" Text='<%# Eval("EmpCode")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlempcode" runat="server" class="form-control"></asp:DropDownList>
                                            <asp:Label ID="lblempcd" runat="server" Text='<%# Eval("EmpCode")%>' Visible="false"></asp:Label>
                                            <%--<asp:TextBox ID="txtempcode" runat="server" Text='<%# Eval("EmployeeCode")%>'></asp:TextBox>--%>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Header Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHeaderName" runat="server" Text='<%# Eval("Heading")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txteditName" runat="server" Text='<%# Eval("Heading")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Header Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHeaderDescription" runat="server" Text='<%# Eval("Description")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txteditDescription" runat="server" Text='<%# Eval("Description")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Achiever Month">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAchieverMonth" runat="server" Text='<%# Eval("AchieverMonth")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%--<asp:TextBox ID="txtAchieverMonth" runat="server" Text='<%# Eval("AchieverMonth")%>'></asp:TextBox>--%>
                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <asp:TextBox class="form-control pull-right" ID="txtEditAchieverMonth" runat="server" value='<%# Eval("AchieverMonth")%>'></asp:TextBox>
                                            </div>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnedit" runat="server" CommandName="Edit" OnClick="lbtnedit_Click">
                <i class="fa fa-edit"></i> Edit
                                            </asp:LinkButton>
                                        </ItemTemplate>

                                        <EditItemTemplate>

                                            <asp:LinkButton ID="btn_Update" runat="server" Width="35%" Text="Update" class="btn btn-primary btn-xs" CommandName="Update"></asp:LinkButton>
                                            <asp:LinkButton ID="btn_Cancel" runat="server" Width="35%" Text="Cancel" class="btn btn-primary btn-xs" CommandName="Cancel"></asp:LinkButton>

                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                </Columns>

                            </asp:GridView>






                        </div>
                        <!-- /.box-body -->

                    </asp:Panel>

                </div>
                <!-- Modal -->
                <ajax:ModalPopupExtender ID="ModalPopupExtender2" BehaviorID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID="lnkbtnclose">
                </ajax:ModalPopupExtender>
                <div class="modal-content">
                    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none; margin-left: 2%; min-height: 65%; width: 580px; position: fixed; z-index: 10001; left: 382px; top: 5.5px;">
                        <%--<asp:UpdatePanel ID="up1" runat="server">
                            <ContentTemplate>--%>
                        <div class="modal-header">
                            <asp:LinkButton ID="lnkbtnclose" data-dismiss="modal" Style="margin-left: 95%;" runat="server"><i class="fa fa-remove"></i></asp:LinkButton>

                            <h3 class="box-title">New Wall Of Fame Details</h3>
                        </div>
                        <div class="modal-body">
                            <!-- Horizontal Form -->
                            <!-- /.box-header -->
                            <!-- form start -->
                            <div class="form-horizontal">
                                <div class="box-body">
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label id="lblempcode" runat="server" class="col-sm-3 control-label">Employee Code</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="ddlempcode" runat="server" class="form-control" OnSelectedIndexChanged="ddlempcode_SelectedIndexChanged"></asp:DropDownList>
                                                <asp:RequiredFieldValidator InitialValue="0" ID="EmpCodeRequiredValidation" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="ddlempcode" Display="Dynamic" SetFocusOnError="True" ValidationGroup="WallOfFameValidationGrp"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label id="lblname" runat="server" class="col-sm-3 control-label">Header Name</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="txtHeaderName" runat="server" placeholder="Header Name">
                                                <asp:RequiredFieldValidator ID="HeaderRequiredFieldValidation" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtHeaderName" Display="Dynamic" SetFocusOnError="True" ValidationGroup="WallOfFameValidationGrp"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label id="lbldesp" runat="server" class="col-sm-3 control-label">Header Description</label>

                                            <div class="col-sm-8">
                                                <input type="text" id="txtHeaderDescription" runat="server" class="form-control" placeholder="Header Description" />
                                                <asp:RequiredFieldValidator ID="DescriptionRequiredFieldValidation" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtHeaderDescription" Display="Dynamic" SetFocusOnError="True" ValidationGroup="WallOfFameValidationGrp"></asp:RequiredFieldValidator>
                                                <%--<asp:TextBox ID="txtempcode" runat="server" class="form-control" placeholder="Employee Code.."></asp:TextBox>--%>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="lblAchieverMonth" class="col-sm-3 control-label">Achiever Month</label>
                                            <div class="input-group date col-sm-8">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <input type="text" class="form-control pull-right" id="dtpAchieverMonth" runat="server" />
                                                <asp:RequiredFieldValidator ID="DOJRequiredValidation" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="dtpAchieverMonth" Display="Dynamic" SetFocusOnError="True" ValidationGroup="WallOfFameValidationGrp"></asp:RequiredFieldValidator>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                            </div>

                            <div class="modal-footer">

                                <asp:Button ID="btnsubmit" runat="server" Text="Save Changes" type="submit" OnClick="btnsubmit_Click" class="btn btn-primary" ValidationGroup="WallOfFameValidationGrp" />
                            </div>
                        </div>
                        <%--</ContentTemplate>
                        </asp:UpdatePanel>--%>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
