$.fn.tabs=function(){var e=this;this.each(function(){var t=$(this);$(t.attr("href")).hide();t.click(function(){$(e).removeClass("selected");$(this).addClass("selected");$($(this).attr("href")).fadeIn();$(e).not(this).each(function(e,t){$($(t).attr("href")).hide()});return false})});$(this).show();$(this).first().click()}