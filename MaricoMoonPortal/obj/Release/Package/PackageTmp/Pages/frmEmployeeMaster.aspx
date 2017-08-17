<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="frmEmployeeMaster.aspx.cs" Inherits="MySpace.frmEmployeeMaster" %>

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

    <%--    <!-- daterange picker -->
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css"/>
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css" />
    <link rel="Stylesheet" href="../plugins/timepicker/bootstrap-timepicker.min.css" />--%>



    <!-- Page script -->

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
                            <h3 class="box-title">Employee Master</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                                <%--     <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>--%>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->

                        <div class="box-body">
                            <div class="form-group">

                                <div class="col-sm-6">

                                    <div class="input-group">
                                        <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">
                                        <span class="input-group-btn">
                                            <asp:LinkButton ID="lbtnsearch" runat="server" class="btn btn-flat" OnClick="lbtnsearch_Click"><i class="fa fa-search"></i></asp:LinkButton>

                                        </span>
                                    </div>
                                    <span style="color: lightgray">Enter EmployeeName for Search</span>
                                </div>

                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div class="input-group-btn">
                                            <asp:Button ID="btnaddnewemp" runat="server" Text="Add New Employee Details" class="btn btn-primary" OnClick="btnaddnewemp_Click" />
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

                <asp:Panel ID="pnlgrid" runat="server" Visible="false">
                    <div class="box-header with-border">
                        <h3 class="box-title">Employee Details Table</h3>
                    </div>

                    <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="slimScrollDiv" style="position: relative; overflow: scroll; width: auto; height: 250px;">
                            <asp:GridView ID="gvEmpDetails" runat="server" AutoGenerateColumns="False" class="table table-bordered"
                                OnRowDataBound="gvEmpDetails_RowDataBound" OnRowUpdating="gvEmpDetails_RowUpdating" OnRowCommand="gvEmpDetails_RowCommand"
                                OnRowEditing="gvEmpDetails_RowEditing" OnRowCancelingEdit="gvEmpDetails_RowCancelingEdit" OnPageIndexChanging="gvEmpDetails_PageIndexChanging"
                                EnableViewState="true" ShowHeader="true" PagerStyle-Width="20%"
                                PageSize="15" AllowPaging="true" EmptyDataText="<center> No Records Found</center>">
                                <PagerStyle CssClass="GridPageFooter" HorizontalAlign="Center" />
                                <PagerSettings Mode="NumericFirstLast" PageButtonCount="10" FirstPageText="First"
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
                                            <asp:Label ID="lblempcode" runat="server" Enabled="false" Text='<%# Eval("EmpCode")%>'></asp:Label>
                                        </ItemTemplate>
                                        <%--      <EditItemTemplate>
                                                 <asp:TextBox ID="txtbayname" runat="server" Text='<%# Eval("BayName")%>'></asp:TextBox>
                                            </EditItemTemplate>--%>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="FirstName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfname" runat="server" Text='<%# Eval("FirstName")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtfname" runat="server" Text='<%# Eval("FirstName")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="MiddleName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmname" runat="server" Text='<%# Eval("MiddleName")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtmname" runat="server" Text='<%# Eval("MiddleName")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="LastName">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllastname" runat="server" Text='<%# Eval("LastName")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtlastname" runat="server" Text='<%# Eval("LastName")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lbladdress" runat="server" Text='<%# Eval("Address")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtaddress" runat="server" Text='<%# Eval("Address")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Contact No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcontactno" runat="server" Text='<%# Eval("ContactNo")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtcontactno" runat="server" Text='<%# Eval("ContactNo")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="LandLine No">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllandlineno" runat="server" Text='<%# Eval("LandLineNo")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtlandlineno" runat="server" Text='<%# Eval("LandLineNo")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Whatsapp No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblwhatsappno" runat="server" Text='<%# Eval("WhatsAppNo")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtwhatsappno" runat="server" Text='<%# Eval("WhatsAppNo")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="EmailId">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemailid" runat="server" Text='<%# Eval("EmailId")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtemailid" runat="server" Text='<%# Eval("EmailId")%>'></asp:TextBox>
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

                                    <asp:TemplateField HeaderText="Country">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlcntry" runat="server" class="form-control" Style="width: auto;"></asp:DropDownList>
                                            <asp:Label ID="lblcntry" runat="server" Text='<%# Eval("Country")%>' Visible="false"></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="State">
                                        <ItemTemplate>
                                            <asp:Label ID="lblState" runat="server" Text='<%# Eval("State")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlst" runat="server" class="form-control" Style="width: auto;"></asp:DropDownList>
                                            <asp:Label ID="lblst" runat="server" Text='<%# Eval("State")%>' Visible="false"></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="City">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCity" runat="server" Text='<%# Eval("City")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddlcty" runat="server" class="form-control" Style="width: auto;"></asp:DropDownList>
                                            <asp:Label ID="lblcty" runat="server" Text='<%# Eval("City")%>' Visible="false"></asp:Label>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Gmail Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGmailId" runat="server" Text='<%# Eval("GmailId")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtgmailid" runat="server" Text='<%# Eval("GmailId")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Skype Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSkypeId" runat="server" Text='<%# Eval("SkypeId")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtSkypeId" runat="server" Text='<%# Eval("SkypeId")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CompanyEmail Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCompanyEmailId" runat="server" Text='<%# Eval("CompanyEmailId")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtCompanyEmailId" runat="server" Text='<%# Eval("CompanyEmailId")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Hobbies">
                                        <ItemTemplate>
                                            <asp:Label ID="lblhobbies" runat="server" Text='<%# Eval("Hobbies")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtHobbies" runat="server" Text='<%# Eval("Hobbies")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Qualification">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQualification" runat="server" Text='<%# Eval("Qualification")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtQualification" runat="server" Text='<%# Eval("Qualification")%>'></asp:TextBox>
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

                                    <asp:TemplateField HeaderText="Brief Info">
                                        <ItemTemplate>
                                            <asp:Label ID="lblBriefInfo" runat="server" Text='<%# Eval("BriefInfo")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtBriefInfo" runat="server" Text='<%# Eval("BriefInfo")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Achievements">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAchievements" runat="server" Text='<%# Eval("Achievements")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtAchievements" runat="server" Text='<%# Eval("Achievements")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Designation">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDesignation" runat="server" Text='<%# Eval("Designation")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtDesignation" runat="server" Text='<%# Eval("Designation")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImagePath") %>'
                                                Height="80px" Width="100px" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:Image ID="img_user" runat="server" ImageUrl='<%# Eval("ImagePath") %>'
                                                Height="80px" Width="100px" /><br />
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnedit" CommandName="Edit" runat="server">
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

                    </div>
                    <!-- /.box-body -->

                </asp:Panel>

                <!-- Modal -->
                <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                <ajax:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID="lnkbtnclose">
                </ajax:ModalPopupExtender>
                <%--       <div class="modal-content">--%>
                <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none; min-height: 100%; width: 90%; padding: 0;">
                    <div class="modal-header">
                        <asp:LinkButton ID="lnkbtnclose" data-dismiss="modal" Style="position: absolute; top: 10px; right: 20px;" runat="server"><i class="fa fa-close"></i></asp:LinkButton>
                        <h3 class="box-title">New Employee </h3>
                    </div>
                    <%-- <div class="box box-info">--%>
                    <div class="modal-body" >
                        <!-- Horizontal Form -->
                        <!-- form start -->
                        <div class="container-fluid">
                            <div class="row" style="overflow-y:scroll; height:600px;">

                                <div class="form-group">
                                    <label id="lblimg" runat="server" class="col-sm-2 control-label">Image Upload</label>

                                    <div class="col-sm-10">
                                        <asp:FileUpload ID="ImageUpload" runat="server"/>
                                        <%-- <br /><br />--%>
                                        <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
                                    </div>
                                </div>

                                <div class="form-group col-md-3">
                                    <label>First Name</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtfname" runat="server" class="form-control" placeholder="First Name.."></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="FirstNameRequiredValidation" runat="server"
 ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtfname" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EmployeeValidationGrp"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="form-group  col-md-3">
                                    <label>Middle Name</label>
                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtmname" runat="server" class="form-control" placeholder="Middle Name.."></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="MiddleNameRequiredValidation" runat="server"
                                            ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtmname" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EmployeeValidationGrp"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="form-group  col-md-3">
                                    <label>Last Name</label>
                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtlname" runat="server" class="form-control" placeholder="Last Name.."></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="LastNameRequiredValidation" runat="server"
                                            ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtlname" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EmployeeValidationGrp"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="form-group  col-md-3">
                                    <label>Address </label>

                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtaddress" runat="server" class="form-control" placeholder="Address.."></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group  col-md-3">
                                    <label>Contact No</label>

                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtcontactno" runat="server" class="form-control" placeholder="Contact No.."></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group  col-md-3">
                                    <label>LandLine No</label>

                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtlandline" runat="server" class="form-control" placeholder="LandLine No.."></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group  col-md-3">
                                    <label>WhatsApp No</label>

                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtWhatsAppno" runat="server" class="form-control" placeholder="WhatsApp No.."></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group  col-md-3">
                                    <label>Email-ID</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtemailid" runat="server" class="form-control" placeholder="Email-ID.."></asp:TextBox>


                                    </div>
                                </div>
                                <div class="form-group  col-md-3">
                                    <label>Department</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-bus"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtdept" runat="server" class="form-control" placeholder="Department.."></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="DeptRequiredValidation" runat="server"
                                            ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtdept" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EmployeeValidationGrp"></asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group col-md-3">
                                    <label>Country</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:DropDownList ID="ddlcountry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>

                                    </div>
                                </div>

                                <div class="form-group col-md-3">
                                    <label>State</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:DropDownList ID="ddlstate" runat="server" OnSelectedIndexChanged="ddlstate_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group col-md-3">
                                    <label>City</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:DropDownList ID="ddlcity" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="form-group col-md-3">
                                    <label>Gmail-ID</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtgmailid" runat="server" class="form-control"
                                            placeholder="Gmail-ID.."></asp:TextBox>


                                    </div>
                                </div>

                                <div class="form-group col-md-3">
                                    <label>Skype-ID</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtskypeid" runat="server" class="form-control" placeholder="Skype-ID.."></asp:TextBox>


                                    </div>
                                </div>

                                <div class="form-group col-md-3">
                                    <label>Company Email-ID</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtcmpemailid" runat="server" class="form-control" placeholder="Company Email-ID.."></asp:TextBox>


                                    </div>
                                </div>

                                <div class="form-group col-md-3">
                                    <label>Hobbies</label>

                                    <div class="input-group">

                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txthobbies" runat="server" class="form-control" placeholder="Hobbies-ID.."></asp:TextBox>
                                    </div>
                                </div>

                                <div class="form-group col-md-3">
                                    <label>Employee Code</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtempcode" runat="server" class="form-control" placeholder="Employee Code.."></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmpCodeRequiredValidation" runat="server"
                                            ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtempcode" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EmployeeValidationGrp"></asp:RequiredFieldValidator>
                                    </div>

                                </div>


                                <div class="form-group col-md-3">
                                    <label>DOB</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right" id="datepicker" runat="server">
                                        <asp:RequiredFieldValidator ID="DOBRequiredValidation" runat="server"
                                            ErrorMessage="Required" ForeColor="Red" ControlToValidate="datepicker" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EmployeeValidationGrp"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="form-group col-md-3">
                                    <label>DOJ</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right" id="datepicker1" runat="server">
                                        <asp:RequiredFieldValidator ID="DOJRequiredValidation" runat="server"
                                            ErrorMessage="Required" ForeColor="Red" ControlToValidate="datepicker1" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EmployeeValidationGrp"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="form-group col-md-3">
                                    <label>Qualification</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-book"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtqualification" runat="server" class="form-control" placeholder="Qualification.."></asp:TextBox>
                                    </div>
                                </div>


                                <div class="form-group col-md-3">
                                    <label>Experience</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-book"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtexperience" runat="server" class="form-control" placeholder="Experience.."></asp:TextBox>
                                    </div>

                                </div>

                                <div class="form-group col-md-3">
                                    <label>Brief Info</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-book"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtbriefInfo" runat="server" class="form-control" placeholder="Brief Info.."></asp:TextBox>
                                    </div>

                                </div>

                                <div class="form-group col-md-3">
                                    <label>Achievements</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-book"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtachievements" runat="server" class="form-control" placeholder="Achievements.."></asp:TextBox>
                                    </div>

                                </div>

                                <div class="form-group col-md-3">
                                    <label>Designation</label>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-book"></i></span>
                                        <%--<input type="password" class="form-control" id="inputPassword3" placeholder="Password">--%>
                                        <asp:TextBox ID="txtDesignation" runat="server" class="form-control" placeholder="Designation.."></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="DesigRequiredValidation" runat="server"
                                            ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtDesignation" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EmployeeValidationGrp"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <%-- </div>--%>


                                <div class="col-md-3 col-md-offset-3 text-center" style="padding-bottom: 2%;">
                                    <asp:Button ID="btnsubmit" runat="server" Text="Save Changes" OnClick="btnsubmit_Click" type="button" class="btn btn-primary" ValidationGroup="EmployeeValidationGrp"/>
                                </div>

                            </div>

                            <!-- /.box-body -->
                            <div class="modal-footer">
                            </div>
                        </div>
                        <%--       </div>--%>
                    </div>
                </asp:Panel>



                <%--  </div>--%>
            </div>
        </div>
    </section>


    <%--<script type="text/javascript">
        $(function () {

            //Datemask dd/mm/yyyy
            $("#datemask").inputmask("dd/mm/yyyy", { "placeholder": "dd/mm/yyyy" });
            //Date range picker
            $('#reservation').daterangepicker();
            //Date range picker with time picker
            $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' });
            //Date range as a button
            $('#daterange-btn').daterangepicker(
                {
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
                },
                function (start, end) {
                    $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
                }
            );

            //Date picker
            $('#datepicker').datepicker({
                autoclose: true
            });

            //Timepicker
            $(".timepicker").timepicker({
                showInputs: false
            });
        });
    </script>--%>
</asp:Content>
