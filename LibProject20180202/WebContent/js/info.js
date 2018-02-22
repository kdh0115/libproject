  $(function(){
   $('#infomenu>div').hover(
   function(){
    var $el = $(this);
    $el.find('.circle').stop().animate({
     'width'  :'199px',
     'height' :'199px',
     'opacity' :'0.8',
     'top'  :'-25px',
     'left'  :'-25px'
    },500,'easeOutBack',function(){
     $(this).parent().find('ul').fadeIn(400);
    });
    $el.find('h2').addClass('active');
   },
   function(){
    var $el = $(this);
    $el.find('ul').fadeOut(500);
    $el.find('.circle').stop().animate({
     'width'  :'50px',
     'height' :'50px',
     'top'  :'0px',
     'left'  :'0px',
     'opacity' :'0.1'
    },4000,'easeOutBack');
    $el.find('h2').removeClass('active');
    });
  });