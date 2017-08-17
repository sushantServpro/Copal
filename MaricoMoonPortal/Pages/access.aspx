<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="access.aspx.cs" Inherits="MySpace.Pages.access" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row section-1">
            <div class="page-header">
                <h4>Access</h4>
            </div>
        </div>
        <div class="section-2">
            <div class="row access">
                <div class="container-fluid">
                    <div class="col-md-3">
                        <h4>Access List</h4>
                        <ul class="nav nav-tabs tabs-left access_list">
                            <li id="liAccessDrive" runat="server" class="active">
                                <a id="ancliAccessDrive" href="#drive" class="drive" runat="server" onserverclick="ancliAccessDrive_ServerClick">Drive
                                </a>
                            </li>
                            <li id="liAccessSystem" runat="server">
                                <a id="ancliAccessSystem" href="#system" class="system" runat="server" onserverclick="ancliAccessSystem_ServerClick">System
                                </a>
                            </li>
                            <li id="liAccessPolicies" runat="server" >
                                <a id="ancliPolicies" href="#policies" class="policies" runat="server" onserverclick="ancliPolicies_ServerClick">Policies
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div id="policies" class="col-md-9">
                        <ul id="ulAccessPolicies" class="nav navbar-nav accessPolicies">
                            <asp:Repeater ID="RepeaterAccessPolicies" runat="server">
                                <ItemTemplate>
                                    <li>
                                        <a id="ancClickedPolicy" href='<%# Eval("PolicyPath")%>' runat="server" class="row" target="_blank">
                                            <div class="col-md-12 not_img">
                                                <img src="../assets/access/AccessPolicy_PDF_1.png" style="width: 30px; height: 30px;" alt="" />
                                                <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("PolicyId")%>'></asp:Label>
                                                <asp:Label ID="lblPolicyName" runat="server" Text='<%# Eval("PolicyName")%>'></asp:Label>
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
</asp:Content>
