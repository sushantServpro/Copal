<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="frmCorporateEvents.aspx.cs" Inherits="MySpace.Pages.frmCorporateEvents" %>

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
                            <h3 class="box-title">Corporate Events</h3>
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
                                        <input type="text" name="table_search" id="txtsearch" runat="server" class="form-control pull-right" placeholder="Search Heading Name">
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
                                                <asp:Button ID="btnNewCorporateEventMaster" runat="server" Text="Add New Corporate Event" class="btn btn-primary" OnClick="btnNewCorporateEventMaster_Click" />
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
                            <h3 class="box-title">Corporate Events Table</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                            </div>

                        </div>

                        <asp:LinkButton ID="lnkDummy" runat="server"></asp:LinkButton>
                        <!-- /.box-header -->
                        <div class="box-body">


                            <asp:GridView ID="gvCorporateEvent" runat="server" AutoGenerateColumns="False" class="table table-bordered" OnRowEditing="gvCorporateEvent_RowEditing" OnRowCancelingEdit="gvCorporateEvent_RowCancelingEdit" OnPageIndexChanging="gvCorporateEvent_PageIndexChanging" OnRowUpdating="gvCorporateEvent_RowUpdating"
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

                                    <asp:TemplateField HeaderText="Header Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHeaderName" runat="server" Text='<%# Eval("HeaderName")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtHeaderName" runat="server" Text='<%# Eval("HeaderName")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Header Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHeaderDescription" runat="server" Text='<%# Eval("HeaderDescription")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtHeaderDescription" runat="server" Text='<%# Eval("HeaderDescription")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Location">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLocation" runat="server" Text='<%# Eval("Location")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtLocation" runat="server" Text='<%# Eval("Location")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Timings">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTimings" runat="server" Text='<%# Eval("Timings")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtTimings" runat="server" Text='<%# Eval("Timings")%>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <%--<asp:TemplateField HeaderText="Image Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblImageName" runat="server" Text='<%# Eval("ImageName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>

                                    <asp:TemplateField HeaderText="Event Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEventDate" runat="server" Text='<%# Eval("EventDate")%>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%--<asp:TextBox ID="txtAchieverMonth" runat="server" Text='<%# Eval("AchieverMonth")%>'></asp:TextBox>--%>
                                            <div class="input-group date">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-calendar"></i>
                                                </div>
                                                <asp:TextBox class="form-control pull-right" ID="txtEditEventDate" runat="server" value='<%# Eval("EventDate")%>'></asp:TextBox>
                                            </div>
                                        </EditItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Image Path">
                                        <ItemTemplate>
                                            <%--<asp:Label ID="lblImagePath" runat="server" Text='<%# Eval("ImagePath")%>'></asp:Label>--%>
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("ImagePath")%>' Height="80px" Width="100px" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <%--<asp:TextBox ID="txtImagePath" runat="server" Text='<%# Eval("ImagePath")%>'></asp:TextBox>--%>
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

                    </asp:Panel>

                </div>
                <!-- Modal -->
                <ajax:ModalPopupExtender ID="ModalPopupExtender1" BehaviorID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkDummy" BackgroundCssClass="modalBackground" CancelControlID="lnkbtnclose">
                </ajax:ModalPopupExtender>
                <div class="modal-content">
                    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none; margin-left: 2%; min-height: 95%; width: 500px;">

                        <div class="modal-header">
                            <asp:LinkButton ID="lnkbtnclose" data-dismiss="modal" Style="margin-left: 95%;" runat="server"><i class="fa fa-remove"></i></asp:LinkButton>

                            <h3 class="box-title">New Events</h3>
                        </div>


                        <div class="modal-body" style="padding: 15px;">

                            <!-- Horizontal Form -->

                            <!-- /.box-header -->
                            <!-- form start -->
                            <div class="form-horizontal">
                                <div class="box-body">
                                    <div class="form-group">

                                        <div class="form-group">
                                            <label id="lbluname" runat="server" class="col-sm-2 control-label">Image Upload</label>

                                            <div class="col-sm-10">
                                                <asp:FileUpload ID="ImageUpload" runat="server" />
                                                <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
                                                <asp:RegularExpressionValidator
                                                    ID="RegularExpressionValidator1" runat="server"
                                                    ErrorMessage="Only jpg, jpeg or png images are allowed!" ForeColor="Red"
                                                    ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))
    +(.jpg|.jpeg|.png)$"
                                                    ControlToValidate="ImageUpload"></asp:RegularExpressionValidator>
                                                <br />
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label id="lblpassword" runat="server" class="col-sm-2 control-label">Header Name</label>

                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="txtHeaderName" runat="server" placeholder="Header Name">
                                                <asp:RequiredFieldValidator ID="HeaderNameRequiredValidation" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtHeaderName" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EventValidationGrp"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label id="lblHeaderDesc" runat="server" class="col-sm-2 control-label">Header Description</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="txtHeaderDescription" runat="server" placeholder="Header Description">
                                                <asp:RequiredFieldValidator ID="DescriptionRequiredValidation" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtHeaderDescription" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EventValidationGrp"></asp:RequiredFieldValidator>
                                            </div>
                                            <%--<div class="col-sm-10">
                                                <input type="text" id="txtHeaderDescription" runat="server" class="form-control" />
                                                <%--<asp:TextBox ID="txtempcode" runat="server" class="form-control" placeholder="Employee Code.."></asp:TextBox>
                                            </div>--%>
                                        </div>

                                        <div class="form-group">
                                            <label id="Label1" runat="server" class="col-sm-2 control-label">Location</label>
                                            <div class="col-sm-10">
                                                <input type="text" id="txtLocation" runat="server" class="form-control" />
                                                <asp:RequiredFieldValidator ID="LocationRequiredFieldValidation" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtLocation" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EventValidationGrp"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label id="lblsecquest" runat="server" class="col-sm-2 control-label">Timings</label>

                                            <div class="col-sm-10">
                                                <input type="text" id="txtTimings" runat="server" class="form-control" />
                                                <asp:RequiredFieldValidator ID="TimingRequiredFieldValidation" runat="server"
                                                    ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtTimings" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EventValidationGrp"></asp:RequiredFieldValidator>
                                                <%--<asp:TextBox ID="txtsecquest" runat="server" class="form-control" placeholder="Security Question.."></asp:TextBox>--%>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                    <label id="lblEventDate" runat="server" class="col-sm-2 control-label">Event Date</label>
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right" id="Eventdatepicker" runat="server">
                                        <asp:RequiredFieldValidator ID="EventDateRequiredValidation" runat="server"
                                            ErrorMessage="Required" ForeColor="Red" ControlToValidate="Eventdatepicker" Display="Dynamic" SetFocusOnError="True" ValidationGroup="EventValidationGrp"></asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                    </div>
                                </div>
                                <!-- /.box-body -->
                            </div>

                            <div class="modal-footer">

                                <asp:Button ID="btnsubmit" runat="server" OnClick="btnsubmit_Click" Text="Save Changes" type="submit" class="btn btn-primary" ValidationGroup="EventValidationGrp" />
                            </div>
                        </div>
                    </asp:Panel>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
