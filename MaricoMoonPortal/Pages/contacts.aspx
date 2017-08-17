<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="contacts.aspx.cs" Inherits="MySpace.Pages.contacts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row section-1">
            <div class="page-header">
                <h4>Contacts</h4>
            </div>
        </div>
        <div class="contactList section-2">
            <div class="cont-a">
                <h4>A</h4>
                <div class="row">
                    <div class="col-md-4">
                        <div class="text-center">
                            <div class="cont_sec1"></div>
                            <div class="cont_sec2">
                                <div class="contact_per_img">
                                    <div class="row">
                                        <div class="col-md-2 col-md-offset-1"><img src="../assets/contacts/message.png" /></div>
                                        <div class="col-md-5"><img src="../assets/contacts/contact_thumb_1.png" /></div>
                                        <div class="col-md-2"><img src="../assets/contacts/video_call.png" /></div>
                                    </div>
                                </div>
                                <div class="cont_name text-center">
                                        <h5>Ajay Thakur</h5>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <span><img src="../assets/contacts/designation_grey.png" /></span>
                                            <span>Project Manager</span>
                                        </div>
                                        <div class="col-md-6">
                                            <span><img src="../assets/contacts/department_grey.png" /></span>
                                            <span>IT Department</span>
                                        </div>
                                    </div>
                                    <div class="row location">
                                        <div class="col-md-8 col-md-offset-2 text-center loc">
                                            <span>Andheri branch, India</span>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        
                    </div>
                    <div class="col-md-4">
                       
                    </div>
                </div>
            </div>
            <div class="cont-a">
                <h4>B</h4>
                <div class="row">
                    <div class="col-md-4">
                       
                    </div>
                    <div class="col-md-4">
                        
                    </div>
                    <div class="col-md-4">
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
