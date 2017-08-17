$("#pet-loginregister-modal").on("shown.bs.modal", function (e) {
  
    var loadsection = $(e.relatedTarget).attr("data-load-section");

    if (loadsection == "register") {
        ShowRegisterPanel();
    }
    else {
        ShowLoginPanel();
    }
});

function ShowLoginButton() {

    if (!$("#pet-login-button").hasClass("active")) {
        $("#pet-login-button").addClass("active");
    }

    if ($("#pet-register-button").hasClass("active")) {
        $("#pet-register-button").removeClass("active");
    }
    
}

function ShowRegisterButton() {
    
    if (!$("#pet-register-button").hasClass("active")) {
        $("#pet-register-button").addClass("active");
    }

    if ($("#pet-login-button").hasClass("active")) {
        $("#pet-login-button").removeClass("active");
    }
}

function ShowLoginPanel() {
   
    $("#pet-login-panel").show();

    $("#pet-register-panel").hide();

    $('.field-validation-error')
        .removeClass('field-validation-error')
        .addClass('field-validation-valid');

    $('.input-validation-error')
        .removeClass('input-validation-error')
        .addClass('valid');
    
    ShowLoginButton();
}
function ShowRegisterPanel() {
 
    $("#pet-login-panel").hide();
    $("#pet-register-panel").show();

    $('.field-validation-error')
        .removeClass('field-validation-error')
        .addClass('field-validation-valid');

    $('.input-validation-error')
        .removeClass('input-validation-error')
        .addClass('valid');

    ShowRegisterButton();
}