<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="frmVacancy.aspx.cs" Inherits="MySpace.Pages.frmVacany" %>

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
                            <h3 class="box-title">Vacancy </h3>
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
                                    <%--<span style="color: lightgray">Search</span>--%>
                                </div>
                            </div>
                        </div>

                        <div class="box-body">
                            <div class="form-group">


                                <div class="col-sm-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="input-group-btn">
                                                <asp:Button ID="btnaddnewuser" runat="server" Text="Add Vacancy Details" class="btn btn-primary" OnClick="btnaddnewuser_Click" />
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



                            <asp:GridView ID="gvVacany" runat="server" AutoGenerateColumns="False" class="table table-bordered"
                                OnRowDataBound="gvVacany_RowDataBound" OnRowUpdating="gvVacany_RowUpdating" OnRowCommand="gvVacany_RowCommand"
                                OnRowEditing="gvVacany_RowEditing" OnRowCancelingEdit="gvVacany_RowCancelingEdit" OnPageIndexChanging="gvVacany_PageIndexChanging"
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
                                            <asp:Label ID="lblheading" runat="server" Text='<%# Eval("JobHeading")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtheading" runat="server" Text='<%# Eval("JobHeading")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Experience">
                                        <ItemTemplate>
                                            <asp:Label ID="lblExperience" runat="server" Text='<%# Eval("Experience")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtExperience" runat="server" Text='<%# Eval("Experience")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Location">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllocation" runat="server" Enabled="false" Text='<%# Eval("Location")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtlocation" runat="server" Text='<%# Eval("Location")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Department">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDepartment" runat="server" Text='<%# Eval("Department")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDepartment" runat="server" Text='<%# Eval("Department")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Job Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lbljobdescp" runat="server" Text='<%# Eval("JobDescription")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtjobdescp" runat="server" Text='<%# Eval("JobDescription")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Contact Details">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcontactDetails" runat="server" Text='<%# Eval("ContactDetails")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtcontactdetails" runat="server" Text='<%# Eval("ContactDetails")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Link">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllink" runat="server" Text='<%# Eval("Link")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtlink" runat="server" Text='<%# Eval("Link")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Created Datetime">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreatedDatetime" runat="server" Text='<%# Eval("CreatedDatetime")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCreatedDatetime" runat="server" Text='<%# Eval("CreatedDatetime")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnedit" CommandName="Edit" runat="server" OnClick="lbtnedit_Click1">
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
                <div class="modal-content" >
                    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none; margin-left: 2%; min-height: 555px; width: 600px;">
                        <div class="modal-header">
                            <asp:LinkButton ID="lnkbtnclose" data-dismiss="modal" Style="margin-left: 95%;" runat="server"><i class="fa fa-remove"></i></asp:LinkButton>
                            <h3 class="box-title">New Vacancy Details</h3>
                        </div>

                        <div class="modal-body">
                            <!-- Horizontal Form -->
                            <!-- /.box-header -->
                            <!-- form start -->
                            <div class="form-horizontal" style="overflow-y:scroll; height:380px;">
                                <div class="box-body">
                                    <div class="form-group">
                                        <div class="form-group">
                                            <label id="lbluname" runat="server" class="col-sm-3 control-label">Heading</label>
                                            <div class="col-sm-8">
                                                <input type="text" id="txtjbheading" runat="server" class="form-control" />
                                                <asp:RequiredFieldValidator ID="HeadingRequiredFieldValidation" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtjbheading" Display="Dynamic" SetFocusOnError="True" ValidationGroup="VacancyValidationGrp"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="lblexp" runat="server" class="col-sm-3 control-label">Experience</label>
                                            <div class="col-sm-8">
                                                <input type="text" id="txtexp" runat="server" class="form-control" />
                                                <asp:RequiredFieldValidator ID="ExperienceRequiredFieldValidation" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtexp" Display="Dynamic" SetFocusOnError="True" ValidationGroup="VacancyValidationGrp"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="lblempcode" runat="server" class="col-sm-3 control-label">Location</label>
                                            <div class="col-sm-8">
                                                <input type="text" id="txtloc" runat="server" class="form-control" />
                                                <asp:RequiredFieldValidator ID="LocationRequiredFieldValidation" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtloc" Display="Dynamic" SetFocusOnError="True" ValidationGroup="VacancyValidationGrp"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="Label1" runat="server" class="col-sm-3 control-label">Department</label>
                                            <div class="col-sm-8">
                                                <input type="text" id="txtdept" runat="server" class="form-control" />
                                                <asp:RequiredFieldValidator ID="DepartmentRequiredFieldValidation" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtdept" Display="Dynamic" SetFocusOnError="True" ValidationGroup="VacancyValidationGrp"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="lblsecquest" runat="server" class="col-sm-3 control-label">Job Description</label>
                                            <div class="col-sm-8">
                                                <input type="text" id="txtjobdescp" runat="server" class="form-control" />
                                                <asp:RequiredFieldValidator ID="JonDescRequiredFieldValidation" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtjobdescp" Display="Dynamic" SetFocusOnError="True" ValidationGroup="VacancyValidationGrp"></asp:RequiredFieldValidator>
                                                <%--<asp:TextBox ID="txtsecquest" runat="server" class="form-control" placeholder="Security Question.."></asp:TextBox>--%>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="lblsecans" runat="server" class="col-sm-3 control-label">Contact Details</label>
                                            <div class="col-sm-8">
                                                <input type="text" id="txtcnt" runat="server" class="form-control" />
                                                <%--<asp:TextBox ID="txtsecans" runat="server" class="form-control"  placeholder="Security Answer.."></asp:TextBox>--%>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label id="lblseclink" runat="server" class="col-sm-3 control-label">Link</label>
                                            <div class="col-sm-8">
                                                <input type="text" id="txtlink" runat="server" class="form-control" />
                                                <%--<asp:TextBox ID="txtsecans" runat="server" class="form-control"  placeholder="Security Answer.."></asp:TextBox>--%>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <!-- /.box-body -->
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" Text="Save Changes" type="button" class="btn btn-primary" ValidationGroup="VacancyValidationGrp" />
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
