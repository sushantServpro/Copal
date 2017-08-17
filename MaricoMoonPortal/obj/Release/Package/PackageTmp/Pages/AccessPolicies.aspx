<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="AccessPolicies.aspx.cs" Inherits="MySpace.Pages.AccessPolicies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="content">
        <div class="container-fluid">

            <!-- START CUSTOM TABS -->
            <div class="row">
                <div class="col-md-12">
                    <!-- Horizontal Form -->
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Policies</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->


                        <div class="box-body">

                            <div class="form-group">
                                <label id="lblimg" runat="server" class="col-sm-2">Policy Upload</label>

                                <div class="col-sm-10">
                                    <asp:FileUpload ID="fpUploadPolicy" runat="server" />
                                    <%-- <br /><br />--%>
                                    <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " />
                                </div>
                            </div>
                        </div>

                        <div class="box-body">
                            <div class="form-group">
                                <div class="col-sm-6">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <div class="input-group-btn">
                                                <asp:Button ID="btnUploadPolicy" runat="server" Text="Upload" class="btn btn-primary" OnClick="btnUploadPolicy_Click" />
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
            <%--<div class="row">
                <div class="col-xs-12">
                    <div class="slimScrollDiv" style="position: relative; overflow: scroll; width: auto; height: 250px;">

                        <asp:Panel ID="pnlgrid" runat="server" Visible="true">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Policies Details</h3>
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
                                    <asp:GridView ID="gvAccessPolicyMaster" runat="server" AutoGenerateColumns="False" class="table table-bordered"
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
                                                    <asp:Label ID="lblID" runat="server" Text='<%# Eval("PolicyId")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Policy Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblheading" runat="server" Text='<%# Eval("PolicyName")%>'></asp:Label>
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

                                            <asp:TemplateField HeaderText="CreatedDate">
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
                                                    <%-- <asp:Label ID="lblempcode" runat="server" Text='<%# Eval("Flag")%>'></asp:Label>
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
            </div>--%>
        </div>
    </section>
</asp:Content>
