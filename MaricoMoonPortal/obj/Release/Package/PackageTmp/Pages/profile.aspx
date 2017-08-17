<%@ Page Title="" Language="C#" MasterPageFile="~/MySpace.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="MySpace.Pages.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
         <div class="row section-1">
            <div class="page-header">
                <h4>Profile</h4>
            </div>
        </div>
        <div class="row section-2">
            <div class="container-fluid">
                <div class="col-md-5">
                    <div class="my_page upt_box">
                        <div class="my_heading">
                            <h5><strong>My Page</strong></h5>
                        </div>
                         <ul class="sidebar-menu">
                            <li>
                                <h5>
                                    <strong>+ Today's Mood</strong>
                                    <a href="#" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                </h5>
                                <p><img src="../assets/profile/smiley.png"/><span class="mood">Feeling Happy</span></p>
                            </li>
                            <li>
                                <h5>
                                    <strong>+ Recent Activity</strong>
                                    <a href="#" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                </h5>
                                <p>Went for picnic this weekend in matheran</p>
                            </li>
                            <li>
                                <h5>
                                    <strong>+ Appreciation</strong>
                                    <a href="#" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                </h5>
                                <p>Had a best moment with my collegues</p>
                            </li>
                            <li>
                                <h5><strong>+ My Space</strong></h5>
                                <textarea class="form-control" placeholder="Write something"></textarea>
                            </li>
                        </ul>
                    </div>
                    <div class="my_info upt_box">
                        <div class="my_heading">
                            <h5><strong>My Info</strong></h5>
                        </div>
                        <ul class="sidebar-menu">
                            <li>
                                <h5>
                                    <strong>Details</strong>
                                </h5>
                                <div class="row">
                                    <div class="col-md-6"><span>Date of Birth </span></div>
                                    <div class="col-md-6"><label>abc</label></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><span>Date of joining </span></div>
                                    <div class="col-md-6"><label>abc</label></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><span>Qualification </span></div>
                                    <div class="col-md-6"><label>abc</label></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><span>Experiance </span></div>
                                    <div class="col-md-6"><label>abc</label></div>
                                </div>
                            </li>
                            <li>
                                <h5>
                                    <strong>Contact Number</strong>
                                </h5>
                                <div class="row">
                                    <div class="col-md-6"><span>Mobile </span></div>
                                    <div class="col-md-6"><label>1234567890</label></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6"><span>Landline </span></div>
                                    <div class="col-md-6"><label>0987654321</label></div>
                                </div>
                            </li>
                            <li>
                                <h5>
                                    <strong>Breif</strong>
                                    <a href="#" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                </h5>
                                <p>Had a best moment with my collegues</p>
                            </li>
                            <li>
                                <h5>
                                    <strong>Hobbies</strong>
                                    <a href="#" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                </h5>
                                <p>Cricket football and listening music</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="profile emp_prof_side">
                        <div class="prof_info">
                        <div class="row">
                            <div class="col-md-3 prof_img">
                                <img src="../assets/dashboard/profile.png" class="img-circle" alt="User Image">
                            </div>
                            <div class="col-md-9 prof_desc">
                                <div class="prof_name">
                                    <span><label>Neha Parikh</label></span>
                                    <img src="../assets/dashboard/star_icon.png" /> 
                                </div>
                                <div class="emp_detail row">
                                    <ul class="nav navbar-nav row">
                                        <li class="col-md-6">
                                            <span>
                                                <img src="../assets/dashboard/designation_icon.png" />
                                                <label>Vice President</label>
                                            </span>
                                        </li>
                                        <li class="col-md-6">
                                            <span>
                                                <img src="../assets/dashboard/place_icon.png" />
                                                <label>Mumbai, India</label>
                                            </span>
                                        </li>
                                        <li class="col-md-6">
                                            <span>
                                                <img src="../assets/dashboard/department_icon.png" />
                                                <label>Compliance</label>
                                            </span>
                                        </li>
                                        <li class="col-md-6">
                                            <span>
                                                <img src="../assets/dashboard/private_icon.png" />
                                                <label>Private</label>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <a href="#" title="Edit"><img src="../assets/dashboard/edit_icon.png" /></a>
                    </div>
                    </div>
                    <div class="posts">
                        <div class="your_post">
                            <div class="row">
                                <div class="col-md-2 text-center">
                                    <img src="../assets/dashboard/profile.png" class="user-image" alt="User Image">
                                </div>
                                <div class="col-md-8">
                                    <textarea class="form-control" placeholder="Write Something..."></textarea>
                                </div>
                                <div class="col-md-1">
                                    <a href="#"><img src="../assets/profile/upload_photo.png" /></a>
                                </div>
                                <div class="col-md-1">
                                    <a href="#"><img src="../assets/profile/upload_video.png" /></a>
                                </div>
                            </div>
                         </div>
                    </div>
                    <div class="other_posts">
                        <div class="text_post">
                            <div class="other_posts_header">
                                <div class="container-fluid">
                                    <div class="col-md-1 other_post_img">
                                        <img src="../assets/profile/text_icon.png" />
                                    </div>
                                    <div class="col-md-11 ">
                                        <div class="row other_post_heading">
                                            <div class="col-md-2">
                                                <img src="../assets/profile/status_photo_friend.png" />
                                            </div>
                                            <div class="col-md-10 other_user_info">
                                                <h4><label class="other_user_name">Swetty Roy</label><span class="time">1 Min</span></h4>
                                                <a href="#txtDown" data-toggle="collapse"  class="down_arrow"><i class="fa fa-caret-down fa-2x" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                        <div class="row other_post_desc collapse in" id="txtDown">
                                            <div class="col-md-12">
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam porro, rem quos nisi similique sit nihil mollitia repellendus cupiditate? Magnam doloribus, maiores amet temporibus animi minus id placeat perferendis obcaecati.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row write_on_other_post">
                                            <div class="col-md-1">
                                                <img src="../assets/profile/comments.png" />
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" placeholder="Write comment..."/>
                                            </div>
                                            <div class="col-md-2">
                                                <a href="#" title="Send"><img src="../assets/profile/send_button.png" /></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pic_post">
                            <div class="other_posts_header">
                                <div class="container-fluid">
                                    <div class="col-md-1 other_post_img">
                                        <img src="../assets/profile/photo_icon.png" />
                                    </div>
                                    <div class="col-md-11 ">
                                        <div class="row other_post_heading">
                                            <div class="col-md-2">
                                                <img src="../assets/profile/status_photo_friend.png" />
                                            </div>
                                            <div class="col-md-10 other_user_info">
                                                <h4><label class="other_user_name">Swetty Roy</label><span class="time">1 Min</span></h4>
                                                <a href="#picDown" data-toggle="collapse"  class="down_arrow"><i class="fa fa-caret-down fa-2x" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                        <div class="row other_post_desc collapse in" id="picDown">
                                            <div class="col-md-12">
                                                <div class="row">
                                                    <div id="postCarousel" class="carousel slide" data-ride="carousel">
                                                        <div class="carousel-inner">
                                                            <div class="item active">
                                                                <div class="row container-fluid">
                                                                    <div class="col-md-4">
                                                                        <a href="#" class="thumbnail">
                                                                            <img src="../assets/profile/uploaded_1.png" />
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <a href="#" class="thumbnail">
                                                                            <img src="../assets/profile/uploaded_2.png" />
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <a href="#" class="thumbnail">
                                                                            <img src="../assets/profile/uploaded_3.png" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="item">
                                                                <div class="row container-fluid">
                                                                    <div class="col-md-4">
                                                                        <a href="#" class="thumbnail">
                                                                            <img src="../assets/profile/uploaded_2.png" />
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <a href="#" class="thumbnail">
                                                                            <img src="../assets/profile/uploaded_3.png" />
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <a href="#" class="thumbnail">
                                                                            <img src="../assets/profile/uploaded_1.png" />
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nam porro, rem quos nisi similique sit nihil mollitia repellendus cupiditate? Magnam doloribus, maiores amet temporibus animi minus id placeat perferendis obcaecati.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row write_on_other_post">
                                            <div class="col-md-1">
                                                <img src="../assets/profile/comments.png" />
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" placeholder="Write comment..."/>
                                            </div>
                                            <div class="col-md-2">
                                                <a href="#" title="Send"><img src="../assets/profile/send_button.png" /></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="video_post">
                            <div class="other_posts_header">
                                <div class="container-fluid">
                                    <div class="col-md-1 other_post_img">
                                        <img src="../assets/profile/video_icon.png" />
                                    </div>
                                    <div class="col-md-11 ">
                                        <div class="row other_post_heading">
                                            <div class="col-md-2">
                                                <img src="../assets/profile/status_photo_friend.png" />
                                            </div>
                                            <div class="col-md-10 other_user_info">
                                                <h4><label class="other_user_name">Swetty Roy</label><span class="time">1 Min</span></h4>
                                                <a href="#vidDown" data-toggle="collapse"  class="down_arrow"><i class="fa fa-caret-down fa-2x" aria-hidden="true"></i></a>
                                            </div>
                                        </div>
                                        <div class="row other_post_desc collapse in" id="vidDown">
                                            <div class="col-md-12">
                                                <video controls>
                                                    <source src="../assets/profile/mov_bbb.mp4" type="video/mp4"/>
                                                </video>
                                            </div>
                                        </div>
                                        <div class="row write_on_other_post">
                                            <div class="col-md-1">
                                                <img src="../assets/profile/comments.png" />
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" placeholder="Write comment..."/>
                                            </div>
                                            <div class="col-md-2">
                                                <a href="#" title="Send"><img src="../assets/profile/send_button.png" /></a>
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
    </div>
</asp:Content>
