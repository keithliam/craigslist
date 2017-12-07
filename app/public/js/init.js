$(document).ready(function(){
    $('select').material_select();
    // // $('.button-collapse').sideNav();
    // $('.parallax').parallax();
    // // $('.modal').modal({
    // //     endingTop: '15%'
    // // });
    $(".button-collapse").sideNav();
    $('#loginModal').modal({
        endingTop: '20%'
    });
    //  $('#successModal').modal({
    //     dismissible: false,
    //     endingTop: '30%'
    // });
    // $('#messageModal').modal({
    //     endingTop: '15%'
    // });
    Materialize.updateTextFields();
});