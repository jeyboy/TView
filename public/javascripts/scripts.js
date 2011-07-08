
pos=true;
function create_jcar(div,count,li){
                         
  div.html('<ul id="topgal'+count+'" class="jcarousel-skin-tango">'+li+'</ul>');
  $('#topgal'+count).jcarousel({
    itemLoadCallback:pos=true
    });
     
}

function select(){
  sel=$('select.dropdown option:selected').val();
  if (sel=="FAQ")
  {
    pos=false;
    hide_menu($("#bts1in"),"0");
    create_jcar($("#bts1in"),0,'<li class="item"><a href="#"><img src="images/user/thumbs/thumb001.gif" width="166" height="161" alt="" /></a></li>');
  }
  else
  {
    pos=false;
    $.post ("usershow/tagname", {
      'tag':sel
    },function(links){
      var link=''
      for(var i=0;i<links.length;i++)
      {
        //console.log(links[i]['group']['img_url'])
        link+='<li class="item"><a href="#"><img id="'+links[i]['group']['id']+'" src="'+links[i]['group']['img_url']+'" width="166" height="161" alt="" /></a></li>'
      }
      hide_menu($("#bts1in"),"0");
      create_jcar($("#bts1in"),0,link);
    });
  }
}
$(document).ready(function() {
  jQuery('#topgal').jcarousel();

});

$(document).ready(function(){
  $('select.dropdown').sSelect();
});

// add z-index
$(document).ready(function(){
  var counter = 200;
  $('.newListSelected').each(function(i) {
    $(this).attr('style', 'z-index: ' + counter);
    counter -= 1;
  });
});

/******************************************/
function hide_menu(show,ps){
  $("#bts1in").css({
    display: 'none'
  });
  $("#bts2in").css({
    display: 'none'
  });
  $("#bts3in").css({
    display: 'none'
  });
  show.css({
    display: 'block'
  });
  $(".bts a").removeClass("btsact");
  $(this).addClass("btsact");
  $(".bts").css("background-position","0 "+ps+"");


}


$(document).ready(function(){
  $(".bts a:first-child").addClass("btsact");
  $('#bts1').click(function(){
    hide_menu($("#bts1in"),0);
  });
  $('#bts2').click(function(){
    hide_menu($("#bts2in"),"-52px");
  });
});

/******************************************/
$(document).ready(function(){

  $("#top-tabs").hide();
  $("#panel").hover(
    function () {
      if (pos==true)
        $("#top-tabs").css({
          display: 'block'
        });
    },
    function () {
      if (pos==true)
        $("#top-tabs").css({
          display: 'none'
        });
    }
    );
});
/******************************************/
$(document).ready(function(){
  $(".item").live("click",function(){
    pos=false;
    $.post ("usershow/changetemplate", {
      'id':$(this).find("img").eq(0).attr("id")
      },function(links){
      var link=''      
      for(var i=0;i<links.length;i++)             
        link+='<li class="change"><a href="#"><img id="'+links[i]['template_group']['id']+'" src="'+links[i]['template_group']['img_template']+'" width="166" height="161" alt="" /></a></li>'
      hide_menu($("#bts2in"),"-52px");
      create_jcar($("#bts2in"),2,link)
    });
  });

  $(".change").live("click",function(){
    pos=false;
    $.post ("usershow/tview", {
      'id':$(this).find("img").eq(0).attr("id")
      },function(links){
      if(links!=""){
        var link=''      
      for(var i=0;i<links.length;i++)             
        link+='<li class="csschange"><a href="#"><img id="'+links[i]['other_html']['id']+'" src="'+links[i]['other_html']['prev_img']+'" width="166" height="161" alt="" /></a></li>'
        hide_menu($("#bts3in"),"-104px");
        create_jcar($("#bts3in"),3,link)
      }
      else
      {
        pos=true
        }
    });
    $.post ("usershow/otherhtml", {
      'template':$(this).find("img").eq(0).attr("id")
      },function(vpath){$("#view").attr("src",vpath);});
  });

  $(".download-but").live("click",function(){
       window.location='usershow/downloadtemplate?myhtml='+$("#view").attr("src");
    
  });

  $(".csschange").live("click",function(){
     pos=false;
    $.post ("usershow/otherhtml", {
      'other':$(this).find("img").eq(0).attr("id")
      },function(vpath){
        $("#view").attr("src",vpath);
        
      });
  });
});