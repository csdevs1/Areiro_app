// Carousel Auto-Cycle


ready = (function() {    
    $("#main-nav-small").hide();  
    $("#menu-bars").click(function(){
        $("#main-nav-small").slideToggle('slow');
        $("#q-small").hide(); 
        $("#q-icon").show();  
    });
    
    $("#top-nav").hide();  
    $(".menu-button").click(function(){
        $("#top-nav").slideToggle('slow');
    });
    
    $("#q-small").hide();  
    $("#q-icon").click(function(){
        $("#q-small").show(1000);
        $("#q-icon").hide();  
    });
    
   /* $('.carousel').carousel({
        interval: 6000
    });*/
    
    var owl = $("#owl-demo");

      owl.owlCarousel({
        navigation : true,
        singleItem : true,
        transitionStyle : "backSlide"
      });

      //Select Transtion Type
      $("#transitionType").change(function(){
        var newValue = $(this).val();

        //TransitionTypes is owlCarousel inner method.
        owl.data("owlCarousel").transitionTypes(newValue);

        //After change type go to next slide
        owl.trigger("owl.next");
      });
});

$(document).mouseup(function (e)
{
    var container = $("#q-small");

    if (!container.is(e.target) // if the target of the click isn't the container...
        && container.has(e.target).length === 0) // ... nor a descendant of the container
    {
        container.hide();
        $("#q-icon").show();  
    }
});

window.onresize = function(event) {
    if( $(window).width() <= 977) {
          $("#top-nav").hide();
    }
};

/* *************** */ 

ready2 = (function() {
  
    //how much items per page to show  
    var show_per_page = 1;  
    //getting the amount of elements inside content div  
    var number_of_items = $('.pattern').children().size();  
    //calculate the number of pages we are going to have  
    var number_of_pages = Math.ceil(number_of_items/show_per_page);  
  
    //set the value of our hidden input fields  
    $('#current_page').val(0);  
    $('#show_per_page').val(show_per_page);  
  
    //now when we got all we need for the navigation let's make it '  
  
    /* 
    what are we going to have in the navigation? 
        - link to previous page 
        - links to specific pages 
        - link to next page 
    */  
    var navigation_html = '<a class="previous_link" href="javascript:previous();">Prev</a>';  
    var current_link = 0;  
    while(number_of_pages > current_link){  
        navigation_html += '<a class="page_link" href="javascript:go_to_page(' + current_link +')" longdesc="' + current_link +'">'+ (current_link + 1) +'</a>';  
        current_link++;  
    }  
    navigation_html += '<a class="next_link" href="javascript:next();">Next</a>';  
  
    $('#page_navigation').html(navigation_html);  
  
    //add active_page class to the first page link  
    $('#page_navigation .page_link:first').addClass('active_page');  
  
    //hide all the elements inside content div  
    $('.pattern').children().css('display', 'none');  
  
    //and show the first n (show_per_page) elements  
    $('.pattern').children().slice(0, show_per_page).css('display', 'block');  
  
});  
  
function previous(){
  
    new_page = parseInt($('#current_page').val()) - 1;  
    //if there is an item before the current active link run the function  
    if($('.active_page').prev('.page_link').length==true){  
        go_to_page(new_page);  
    }  
  
}  
  
function next(){
    new_page = parseInt($('#current_page').val()) + 1;  
    //if there is an item after the current active link run the function  
    if($('.active_page').next('.page_link').length==true){  
        go_to_page(new_page);  
    }  
  
}  
function go_to_page(page_num){
    //get the number of items shown per page  
    var show_per_page = parseInt($('#show_per_page').val());  
  
    //get the element number where to start the slice from  
    start_from = page_num * show_per_page;  
  
    //get the element number where to end the slice  
    end_on = start_from + show_per_page;  
  
    //hide all children elements of content div, get specific items and show them  
    $('.pattern').children().css('display', 'none').slice(start_from, end_on).css('display', 'block');  
  
    /*get the page link that has longdesc attribute of the current page and add active_page class to it 
    and remove that class from previously active page link*/  
    $('.page_link[longdesc=' + page_num +']').addClass('active_page').siblings('.active_page').removeClass('active_page');  
  
    //update the current page input field  
    $('#current_page').val(page_num);  
}

$(document).ready(ready);
$(document).on('page:load', ready);

$(window).load(ready2);
$(window).on('page:load', ready2);

$(document).scroll(scroll);