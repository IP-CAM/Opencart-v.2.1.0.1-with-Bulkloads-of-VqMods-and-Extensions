// Generated by CoffeeScript 1.8.0

my_jQuery(function() {

    var showRight;
	
	
	if($('#mobile2-indicator').is(':visible')) 
	{
		showRight=310;
	}
	else
    if($('#tablet-indicator').is(':visible')) 
	{
		showRight=380;
	} 
	else if($('#tablet2-indicator').is(':visible')) 
	{
		showRight=600;
	}
	else if($('#mobile-indicator').is(':visible')) 
	{
		showRight=170;
		for(ivar=0;ivar<8;ivar++)
		{
		 $('.gridly').find('.brick').first().remove();
		}
	}
	else
	{
		showRight=800;
	}
	
 $(document).on("mouseenter", ".single_tag", function(event) {
	$('.product_info').hide();
	 $this = $(this);
	
	var parentPos = $(this).offset();
	
	if(parentPos.left > showRight)
	{
	  $(this).find('.product_info').css({"left":"auto","right":"22px"});	
	  	
	}
	else
	{
		$(this).find('.product_info').css({"left":"22px","right":"auto"});	
		}
	$(this).find('.product_info').show();	
	
		
	//alert(parentPos.left);
  });
  $(document).on("mouseleave", ".single_tag", function(event) {
     $(this).find('.product_info').hide();
  });
	


 $(document).on("mouseenter touchend", ".hotspot", function(event) {
	$('.product_info').hide();
	var parentPos = $(this).offset();
	
	if(parentPos.left > showRight)
	{
	  $(this).find('.product_info').css({"left":"auto","right":"22px"});	
	}
	else
	{
		$(this).find('.product_info').css({"left":"22px","right":"auto"});	
		}
	
	$(this).find('.product_info').show();
  });
  $(document).on("mouseleave", ".hotspot", function(event) {
	  $(this).find('.product_info').hide();
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
	
   
    $(document).on("click touchend", ".gridly .delete", function(event) {
      var $this;
      event.preventDefault();
      event.stopPropagation();
      $this = $(this);
      $this.closest('.brick').remove();
      return $('.gridly').gridly('layout');
    });
    $(document).on("click touchend", ".add", function(event) {
      event.preventDefault();
      event.stopPropagation();
	     $newtag = $('#remtags').find('.newtag').first().removeClass('newtag').clone();
		 
		 $newtag.find('.thumbimg').each(function( index ) {     
		     var srcthumb =  $(this).attr('rel');
			 $(this).attr('src',srcthumb);
		 });
	    // var srcthumb = $newtag.find('.thumbimg').attr('rel');
		// $newtag.find('.thumbimg').attr('src',srcthumb);
		
		var srcimg = $newtag.find('.imgbrick').attr('rel');
		 $newtag.find('.imgbrick').attr('src',srcimg);
		  if($('#remtags').find('.newtag').length<1)
		  {
			    $('.actions').hide();
		        location.reload();
				return false;
		  }
		// if($('#mobile-indicator').is(':visible') || $('#mobile2-indicator').is(':visible')  || $('#tablet-indicator').is(':visible') || $('#tablet2-indicator').is(':visible')) 
		//  {
			//  $('.gridly').find('.brick').first().remove();
			  
		 // }
      $('.gridly').append($newtag);
	  
	  
      return $('.gridly').gridly();
    });
	
	 $(document).on("click touchend", ".shuffle", function(event) {
      event.preventDefault();
      event.stopPropagation();
	     if($('#remtags').find('.newtag').length<1)
		 {
		    
		        location.reload();
				 $('.actions').hide();
				return false;
		 }
	     $('.gridly').find('.brick').remove();
		 var totalboxes =12
		 if($('#mobile-indicator').is(':visible')) 
		    totalboxes =4
		   
		 for(ivar = 0 ;ivar<totalboxes  ;ivar++){
		   $newtag = $('#remtags').find('.newtag').first().removeClass('newtag').clone();
		   $newtag.find('.thumbimg').each(function( index ) {     
		      var srcthumb =  $(this).attr('rel');
			 $(this).attr('src',srcthumb);
		  });
		  // var srcthumb = $newtag.find('.thumbimg').attr('rel');
		  // $newtag.find('.thumbimg').attr('src',srcthumb);
		  
		  var srcimg = $newtag.find('.imgbrick').attr('rel');
		   $newtag.find('.imgbrick').attr('src',srcimg);
		   $('.gridly').append($newtag);
		   
		 }
      return $('.gridly').gridly();
    });
	if($('#mobile-indicator').is(':visible')) 
	{
	 $(document).on("click", ".gridly .brick", function(event) {
		var $this, size;
		event.preventDefault();
		event.stopPropagation();
		$this = $(this);
		if ($(event.target).parent().is('.hotspot') && $this.hasClass('large') ){   
			return true;
		 }
		 if ($(event.target).parent().is('.price') && $this.hasClass('large') ){   
		
			window.open($(event.target).parent().find('a').attr('href'), '_blank');
			return true;
		 } 
		if( $this.hasClass('large') && $this.hasClass('single_tag') && $this.find('.product_info').length>0 && !$this.find('.product_info').is(":visible"))
		{
			var parentPos = $this.offset();
			if(parentPos.left > 170)
			{
			  $this.find('.product_info').css({"left":"auto","right":"22px"});	
			}
			else
			{
				$this.find('.product_info').css({"left":"22px","right":"auto"});	
				}
			$this.find('.product_info').show();	
			return 0;
		}
		else if($this.find('.product_info').is(":visible")){
			 $this.find('.product_info').hide();
	    }
		$this.toggleClass('small');
		$this.toggleClass('large');
		if ($this.hasClass('small')) {
		  size = 150;
		}
		if ($this.hasClass('large')) {
		  size = 302;
		}
		$this.data('width', size);
		$this.data('height', size);
		return $('.gridly').gridly('layout');
    });
	   return $('.gridly').gridly({  base: 150,  gutter: 2,columns: 2 ,draggable: false  });	
	}
	else
	if($('#mobile2-indicator').is(':visible')) 
	{
		 $(document).on("click", ".gridly .brick", function(event) {
		var $this, size;
		event.preventDefault();
		event.stopPropagation();
		$this = $(this);
		 if ($(event.target).parent().is('.hotspot') && $this.hasClass('large') ){   
			return true;
		 }
		 if ($(event.target).parent().is('.price') && $this.hasClass('large') ){   
		
			window.open($(event.target).parent().find('a').attr('href'), '_blank');
			return true;
		 } 
		if( $this.hasClass('large') && $this.hasClass('single_tag') && $this.find('.product_info').length>0 && !$this.find('.product_info').is(":visible"))
		{
			var parentPos = $this.offset();
			if(parentPos.left > 310)
			{
			  $this.find('.product_info').css({"left":"auto","right":"22px"});	
			}
			else
			{
				$this.find('.product_info').css({"left":"22px","right":"auto"});	
				}
			$this.find('.product_info').show();	
			return 0;
		}
		else if($this.find('.product_info').is(":visible")){
			 $this.find('.product_info').hide();
	    }
		$this.toggleClass('small');
		$this.toggleClass('large');
		if ($this.hasClass('small')) {
		  size = 170;
		}
		if ($this.hasClass('large')) {
		  size = 342;
		}
		$this.data('width', size);
		$this.data('height', size);
		return $('.gridly').gridly('layout');
    });
	   return $('.gridly').gridly({  base: 170,  gutter: 2,columns: 3,draggable: false  });	
	}
	else if($('#tablet-indicator').is(':visible')) 
	{
		 $(document).on("click", ".gridly .brick", function(event) {
		var $this, size;
		event.preventDefault();
		event.stopPropagation();
		$this = $(this);
		
		 if ( $(event.target).parent().is('.hotspot') && $this.hasClass('large') ){   
			return true;
		 }
		 if ($(event.target).parent().is('.price') && $this.hasClass('large') ){   
		
			window.open($(event.target).parent().find('a').attr('href'), '_blank');
			return true;
		 }
	//	console.log(event.type+'--');
	//	console.log(isTouch);
		if($this.hasClass('large') && $this.hasClass('single_tag') && $this.find('.product_info').length>0 && !$this.find('.product_info').is(":visible"))
		{
			
			var parentPos = $this.offset();
			
			if(parentPos.left > 370)
			{
			  $this.find('.product_info').css({"left":"auto","right":"22px"});	
			}
			else
			{
				$this.find('.product_info').css({"left":"22px","right":"auto"});	
				}
			$this.find('.product_info').show();	
			return 0;
		}
		else if($this.find('.product_info').is(":visible")){
			 $this.find('.product_info').hide();
	    }
	  
		
		
		$this.toggleClass('small');
		$this.toggleClass('large');
		if ($this.hasClass('small')) {
		  size = 170;
		}
		if ($this.hasClass('large')) {
		  size = 342;
		}
		$this.data('width', size);
		$this.data('height', size);
		return $('.gridly').gridly('layout');
    });
	   return $('.gridly').gridly({  base: 170,  gutter: 2,columns: 4,draggable: false   });	
	}
	else if($('#tablet2-indicator').is(':visible')) 
	{
		 $(document).on("click", ".gridly .brick", function(event) {
		var $this, size;
		event.preventDefault();
		event.stopPropagation();
		$this = $(this);
		
		 if ( $(event.target).parent().is('.hotspot') && $this.hasClass('large') ){   
			return true;
		 }
		 if ($(event.target).parent().is('.price') && $this.hasClass('large') ){   
		
			window.open($(event.target).parent().find('a').attr('href'), '_blank');
			return true;
		 }
	//	console.log(event.type+'--');
	//	console.log(isTouch);
		if($this.hasClass('large') && $this.hasClass('single_tag') && $this.find('.product_info').length>0 && !$this.find('.product_info').is(":visible"))
		{
			
			var parentPos = $this.offset();
			
			if(parentPos.left > 500)
			{
			  $this.find('.product_info').css({"left":"auto","right":"22px"});	
			}
			else
			{
				$this.find('.product_info').css({"left":"22px","right":"auto"});	
				}
			$this.find('.product_info').show();	
			return 0;
		}
		else if($this.find('.product_info').is(":visible")){
			 $this.find('.product_info').hide();
	    }
	  
		
		
		$this.toggleClass('small');
		$this.toggleClass('large');
		if ($this.hasClass('small')) {
		  size = 170;
		}
		if ($this.hasClass('large')) {
		  size = 342;
		}
		$this.data('width', size);
		$this.data('height', size);
		return $('.gridly').gridly('layout');
    });
	   return $('.gridly').gridly({  base: 170,  gutter: 2,columns: 5,draggable: false   });	
	
	}
	else
	{
		 $(document).on("click", ".gridly .brick", function(event) {
			var $this, size;
			event.preventDefault();
			event.stopPropagation();
			$this = $(this);
			$this.toggleClass('small');
			$this.toggleClass('large');
			if ($this.hasClass('small')) {
			  size = 170;
			}
			if ($this.hasClass('large')) {
			  size = 342;
			}
			$this.data('width', size);
			$this.data('height', size);
			return $('.gridly').gridly('layout');
        });
	//	alert(navigator.userAgent);
		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
             return $('.gridly').gridly({  base: 170,  gutter: 2,columns: 6,draggable: false  });
         }
		else
	   return $('.gridly').gridly({  base: 170,  gutter: 2,columns: 6  });
	}
	
    
  });

}(my_jQuery))//.call(this);

//# sourceMappingURL=sample.js.map
