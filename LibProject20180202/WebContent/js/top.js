$(function(){
 $(".topmenu li a").wrapInner('<span class="out"></span>');
 $(".topmenu li a").each(function(){
  $('<span class="over">' + $(this).text() + '</span>').appendTo(this);
 });
 $(".topmenu li a").hover(
  function(){
   $(".out",this).stop().animate({'top':'45px'},200);
   $(".over",this).stop().animate({'top':'0px'},200);
  },
  function(){
   $(".out",this).stop().animate({'top':'0px'},200);
   $(".over",this).stop().animate({'top':'-45px'},200);
  }
 );
});