<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="frmUserMaster.aspx.cs" Inherits="MySpace.Pages.frmUserMaster" %>

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
                            <h3 class="box-title">User Master</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <%--     <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>--%>
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
                                        <input type="text" name="table_search" id="txtsearch" runat="server" class="form-control pull-right" placeholder="Search">
                                        <span class="input-group-btn">
                                            <%--<asp:LinkButton ID="lbtnsearch" runat="server" class="btn btn-flat" OnClick="lbtnsearch_Click"><i class="fa fa-search"></i></asp:LinkButton>--%>
                                            <asp:Button ID="btnsearch" Text="Search" runat="server" class="btn btn-flat" OnClick="btnsearch_Click" />
                                        </span>
                                    </div>
                                    <span style="color: lightgray">Enter UserName for Search</span>
                                </div>
                            </div>
                        </div>

                        <div class="box-body">
                            <div class="form-group">


                                <div class="col-sm-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="input-group-btn">
                                                <asp:Button ID="btnaddnewuser" runat="server" Text="Add New User" class="btn btn-primary" OnClick="btnaddnewuser_Click" />
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
                            <h3 class="box-title">User Details Table</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>

                        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <asp:GridView ID="gvUserMaster" runat="server" AutoGenerateColumns="False" class="table table-bordered"
                                OnRowDataBound="gvUserMaster_RowDataBound" OnRowUpdating="gvUserMaster_RowUpdating" OnRowCommand="gvUserMaster_RowCommand"
                                OnRowEditing="gvUserMaster_RowEditing" OnRowCancelingEdit="gvUserMaster_RowCancelingEdit" OnPageIndexChanging="gvUserMaster_PageIndexChanging"
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

                                    <asp:TemplateField HeaderText="UserName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%# Eval("Username")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtusername" runat="server" Text='<%# Eval("Username")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Password">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpassword" runat="server" Text='<%# Eval("Password")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtpassword" runat="server" Text='<%# Eval("Password")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Employee Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lblempcode" runat="server" Enabled="false" Text='<%# Eval("EmployeeCode")%>'></asp:Label>
                                        </ItemTemplate>
                                        <%--<EditItemTemplate>
                                             <asp:DropDownList ID="ddlempcode" runat="server" class="form-control" ></asp:DropDownList> 
                                            <asp:Label ID="lblempcd" runat="server" Text='<%# Eval("EmployeeCode")%>' Visible="false"></asp:Label>  
                                            <%--<asp:TextBox ID="txtempcode" runat="server" Text='<%# Eval("EmployeeCode")%>'></asp:TextBox>--%>
                                        <%--</EditItemTemplate>--%>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Security Question">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsecquest" runat="server" Text='<%# Eval("SecurityQuestion")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtsecqt" runat="server" Text='<%# Eval("SecurityQuestion")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Security Answer">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsecans" runat="server" Text='<%# Eval("SecurityAnswer")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtsecans" runat="server" Text='<%# Eval("SecurityAnswer")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Role">
                                        <ItemTemplate>
                                            <asp:Label ID="lblRole" runat="server" Text='<%# Eval("Role")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlrole" runat="server" class="form-control" Style="width: auto;"></asp:DropDownList>
                                            <%--<asp:TextBox ID="txtrole" runat="server" Text='<%# Eval("Role")%>'></asp:TextBox>--%>
                                            <asp:Label ID="lblRoleId" runat="server" Text='<%# Eval("Role")%>' Visible="false"></asp:Label>
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

                    </asp:Panel>

                </div>
                <!-- Modal -->
                <ajax:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID="lnkbtnclose">
                </ajax:ModalPopupExtender>
                <div class="modal-content">
                    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none; margin-left: 2%; min-height: 95%; width: 500px;">
                        <div class="modal-header">
                            <asp:LinkButton ID="lnkbtnclose" data-dismiss="modal" Style="margin-left: 95%;" runat="server"><i class="fa fa-remove"></i></asp:LinkButton>
                            <h3 class="box-title">New User</h3>
                        </div>

                        <div class="modal-body">
                            <!-- Horizontal Form -->
                            <!-- /.box-header -->
                            <!-- form start -->
                            <div class="form-horizontal">
                                <div class="box-body">
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label id="lbluname" runat="server" class="col-sm-2 control-label">Username</label>
                                            <div class="col-sm-8">
                                                <input type="text" id="txtuname" runat="server" class="form-control" />
                                                <asp:RequiredFieldValidator ID="FirstNameRequiredValidation" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtuname" Display="Dynamic" SetFocusOnError="True" ValidationGroup="UserValidationGrp"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="lblpassword" runat="server" class="col-sm-2 control-label">Password</label>
                                            <div class="col-sm-8">
                                                <input type="password" class="form-control" id="inputPassword3" runat="server" placeholder="Password">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="inputPassword3" Display="Dynamic" SetFocusOnError="True" ValidationGroup="UserValidationGrp"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="lblempcode" runat="server" class="col-sm-2 control-label">Employee Code</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="ddlempcode" runat="server" class="form-control"></asp:DropDownList>
                                                <%--<input type="text" id="txtemployeecode" runat="server" class="form-control" />--%>
                                                <%--<asp:TextBox ID="txtempcode" runat="server" class="form-control" placeholder="Employee Code.."></asp:TextBox>--%>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="Label1" runat="server" class="col-sm-2 control-label">Role</label>
                                            <div class="col-sm-8">
                                                <asp:DropDownList ID="drprole" runat="server" class="form-control"></asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="lblsecquest" runat="server" class="col-sm-2 control-label">Security Question</label>
                                            <div class="col-sm-8">
                                                <input type="text" id="txtsecurityque" runat="server" class="form-control" />
                                                <%--<asp:TextBox ID="txtsecquest" runat="server" class="form-control" placeholder="Security Question.."></asp:TextBox>--%>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="lblsecans" runat="server" class="col-sm-2 control-label">Security Answer</label>
                                            <div class="col-sm-8">
                                                <input type="text" id="txtsecurityans" runat="server" class="form-control" />
                                                <%--<asp:TextBox ID="txtsecans" runat="server" class="form-control"  placeholder="Security Answer.."></asp:TextBox>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnsubmit" runat="server" OnClick=" btnsubmit_Click" Text="Save Changes" type="button" class="btn btn-primary" ValidationGroup="UserValidationGrp" />
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
