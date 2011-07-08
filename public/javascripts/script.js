
$(function() {
    
 var div = $('div.sc_menu'),ul = $('ul.sc_menu'),ulPadding = 15;
 var lastLi = ul.find('li:last-child');

 $(".sidebar h4:first").addClass("active"); // добавляем класс 'active” первому элементу <h4> внутри <div class=”sidebar”> //
 $(".sidebar div#foto:not(:first)").hide(); // прячем все не первые <ul> элементы внутри <div class=”sidebar”> //
 $(".sidebar h4").click(function(){
       $(this).next("div#foto").slideToggle("fast") // происходит клик по заголовку <h4>, для следующего в нём элемента <ul> будет применен эффект slideToggle который раскрывает елемент//
          .siblings("div#foto:visible").slideUp("fast"); // происходит скрытие соседних <ul>//
       $(this).toggleClass("active"); //изменяет класс заголовка на “active”//
       $(this).siblings("h4").removeClass("active"); // у соседних заголовках <h4> и убирает класс “active”//
       });
           // initialize scrollable with mousewheel support
$(".scrollable").scrollable({vertical: true, mousewheel: true});
           
$(".item").live("click",function(){
                    //alert($(this).find("img").eq(0).attr("src"));
                    $.post ("usershow/changetemplate", {'path':$(this).find("img").eq(0).attr("src")},function(link){
                      //alert(link);
                      $("ul.sc_menu").html(link);
                      lastLi = ul.find('li:last-child');
                     
                       });
                     $.post ("usershow/tview", {'path':$(this).find("img").eq(0).attr("src")},function(link){
                      $("#css").html(link[0])
                     });
           });
//$("#change").live("click",function(){
                    //alert($(this).children("img").eq(0).attr("src"));
//                    $.post ("usershow/tview", {'path':$(this).children("img").eq(0).attr("src")},function(link){
//                      $("#view").html(link[1])
                      //$("#view").html("<script type=\"text/javascript\" src=\"data/first/js/jquery.js\">")
//                      });
//           });
$(".csschange").live("click",function(){
              //$("#view").children("link").eq(0).attr("href",$(this).attr("src").split(".")[0]+".css");
              var vpath="/"+$(this).attr("src").split(".")[0]+".css";
              $("#view").contents().find("link").eq(0).attr("href",vpath);
             });

$(".download-but").live("click",function(){
             //alert();
             var path=window.frames["iframe"].location.pathname
             
             $.post ("usershow/createtemplate", {'myhtml':path,'mycss':$("#view").contents().find("link:first").attr("href")},function(link){
             window.location=link
             });
            });
           	//Get our elements for faster access and set overlay width
	//Get menu width
var divWidth = div.width();
	//Remove scrollbars
div.css({overflow: 'hidden'});
	//Find last image container
div.mouseover(function(e){
       });
	//When user move mouse over menu
div.mousemove(function(e){
		//As images are loaded ul width increases,
		//so we recalculate it each time
	var ulWidth = lastLi[0].offsetLeft + lastLi.outerWidth() + ulPadding;
	var left = (e.pageX - div.offset().left) * (ulWidth-divWidth) / divWidth;
	div.scrollLeft(left);
	});

});