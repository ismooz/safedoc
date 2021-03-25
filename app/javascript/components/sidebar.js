// const sidebar = () => {
//  $(document).ready(function () {

//     $('#sidebarCollapse').on('click', function () {
//         $('#sidebar').toggleClass('active');
//     });
//   });
// }

// export { sidebar };


  const sidebar = function() {

    $('.js-fullheight').css('height', $(window).height());
    $(window).resize(function(){
      $('.js-fullheight').css('height', $(window).height());
    });

    $('#sidebarCollapse').on('click', function () {
      $('#sidebar').toggleClass('active');
    });

  };

  export { sidebar };
