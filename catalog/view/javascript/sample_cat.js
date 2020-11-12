// Generated by CoffeeScript 1.8.0

my_jQuery(function() {

 $(document).on("mouseenter", ".single_tag", function(event) {
	$('.product-info').hide();
	
	var parentPos = $(this).offset();
	if(parentPos.left > 800)
	{
	  $(this).find('.product-info').css({"left":"auto","right":"22px"});	
	}
	else
	{
		$(this).find('.product-info').css({"left":"22px","right":"auto"});	
		}
	$(this).find('.product-info').show();	
		
	//alert(parentPos.left);
  });
  $(document).on("mouseleave", ".single_tag", function(event) {
     $(this).find('.product-info').hide();
  });
		
 $(document).on("mouseenter", ".hotspot", function(event) {
	$('.product-info').hide();
	var parentPos = $(this).offset();
	if(parentPos.left > 800)
	{
	  $(this).find('.product-info').css({"left":"auto","right":"22px"});	
	}
	else
	{
		$(this).find('.product-info').css({"left":"22px","right":"auto"});	
		}
	
	$(this).find('.product-info').show();
  });
  $(document).on("mouseleave", ".hotspot", function(event) {
	  $(this).find('.product-info').hide();
  });
		
$(document).on("click", ".addtocart", function(event) {
	
	var loc =$(this).attr('rel');
	window.location.href = loc;
	
  });		
	
 }); 




(function($) {
  $(function() {
    var brick;
    brick = "<div class='brick small'><div class='delete'>&times;</div></div>";
    $(document).on("click touchend", ".gridly .brick", function(event) {
      var $this, size;
      event.preventDefault();
      event.stopPropagation();
      $this = $(this);
      $this.toggleClass('small');
      $this.toggleClass('large');
      if ($this.hasClass('small')) {
        size = 198;
      }
      if ($this.hasClass('large')) {
        size = 398;
      }
      $this.data('width', size);
      $this.data('height', size);
      return $('.gridly').gridly('layout');
    });
    $(document).on("click", ".gridly .delete", function(event) {
      var $this;
      event.preventDefault();
      event.stopPropagation();
      $this = $(this);
      $this.closest('.brick').remove();
      return $('.gridly').gridly('layout');
    });
    $(document).on("click", ".add", function(event) {
      event.preventDefault();
      event.stopPropagation();
	     $newtag = $('#remtags').find('.newtag').first().removeClass('newtag').clone();
	     var srcthumb = $newtag.find('.thumbimg').attr('rel');
		 var srcimg = $newtag.find('.imgbrick').attr('rel');
		 $newtag.find('.thumbimg').attr('src',srcthumb);
		 $newtag.find('.imgbrick').attr('src',srcimg);
		 
      $('.gridly').append($newtag);
      return $('.gridly').gridly();
    });
	
	
	 $(document).on("click", ".shuffle", function(event) {
      event.preventDefault();
      event.stopPropagation();
	     $('.gridly').find('.brick').remove();
		 for(ivar = 0 ;ivar<8  ;ivar++){
		   $newtag = $('#remtags').find('.newtag').first().removeClass('newtag').clone();
		   var srcthumb = $newtag.find('.thumbimg').attr('rel');
		   var srcimg = $newtag.find('.imgbrick').attr('rel');
		   $newtag.find('.thumbimg').attr('src',srcthumb);
		   $newtag.find('.imgbrick').attr('src',srcimg);
		   $('.gridly').append($newtag);
		   
		 }
      return $('.gridly').gridly();
    });
	
	
    return $('.gridly').gridly({
    base: 198, // px 
    gutter: 2, // px
	columns: 4
    
  });
  });

}(my_jQuery)).call(this);

//# sourceMappingURL=sample.js.map
