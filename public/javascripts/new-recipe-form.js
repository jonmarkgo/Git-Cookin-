$(function() {
	$("#metacont").click(function() {
if ($("#recipemeta").is(":visible")) {
		$("#recipemeta").hide("drop",{},"fast",function() {
			$("#ingredcont").show();
		$("#ingredients").show("drop",{},"fast");	
		$("#metacont").text("Back");
	});
	}
	else {
		$("#recipemeta").show("drop",{},"fast",function() {
			$("#metacont").text("Continue");
			$("#ingredcont").hide();
		$("#ingredients").hide("drop",{},"fast");	
	});
	}
		});	


	$("#ingredcont").click(function() {
if ($("#ingredients").is(":visible")) {
		$("#ingredients").hide("drop",{},"fast",function() {
			$("#metacont").hide();
			$("#subbut").show();
		$("#steppy").show("drop",{},"fast");	
		$("#ingredcont").text("Back");
		var ingredhtml = '';
		$('.inline-inputs').each(function(index, el) {
			if ($(el).find('.quantity').val() != '') {
			ingredhtml += '<li class="ingredient"><span class="label">' + $(el).find('.quantity').val() + ' ' + $(el).find('.measurement').val() + ' ' + $(el).find('.ingredientname').val() + '</span><div style="display:none;" class="indetails"><input type="hidden" name="quantitytrash" class="hidquant" value="' + $(el).find('.quantity').val() + '"><input type="hidden" class="hidmeas" name="measurementtrash" value="' + $(el).find('.measurement').val() + '"><input type="hidden" class="hidname" name="ingredientnametrash" value="' + $(el).find('.ingredientname').val() + '"></div></li>';
}

});
		
		$("#stepingredients").html(ingredhtml);
		$( ".ingredient" ).draggable({revert: "invalid"});
	});
	}
	else {
		$("#ingredients").show("drop",{},"fast",function() {
			$("#ingredcont").text("Continue");
			$("#metacont").show();
			$("#subbut").hide();
		$("#steppy").hide("drop",{},"fast");	
	});
	}
		});	

		$(".lastingred input:last").live(
			'focus',function() {
				$(".lastingred").after('<div class="clearfix lastingred"> <div class="input"> <div class="inline-inputs">  <input class="mini quantity" type="number" placeholder="1" name="quantity[]"> <input class="small measurement" type="text" placeholder="cup" name="measurement[]"> <input type="text" placeholder="whole wheat flour" class="ingredientname" name="ingredientname[]"> </div></div> </div>');
          $(this).parent().parent().parent().removeClass("lastingred");
		});
		$(".laststep input").live(
			'focus',function() {
				$(".laststep").after('<tr class="laststep"><td><div class="clearfix stepinput"><div class="input"><input class="xlarge" type="text" name="step[]" placeholder="Combine milk and flour."></div></div></td><td><ul class="unstyled"></ul></td></tr>');
				$(this).parent().parent().parent().parent().removeClass("laststep");
				$( ".stepinput" ).droppable({
			hoverClass: "success",
			drop: function( event, ui ) {
				var stepindex = $(this).parent().parent().index() - 1;
				$(ui.draggable).fadeOut().remove();
				$(this).parent().parent().find('td:last > ul').append('<li><span class="label success">' + $(ui.draggable).text() + '</span>' + $(ui.draggable).find('.indetails').html() + '</li>').fadeIn();

				$(this).parent().parent().find('li:last > .hidquant').attr('name','step' + stepindex + 'quantity[]');
				$(this).parent().parent().find('li:last > .hidmeas').attr('name','step' + stepindex + 'measurement[]');
				$(this).parent().parent().find('li:last > .hidname').attr('name','step' + stepindex + 'ingredientname[]');
			}
		});
		});

		
$( ".stepinput" ).droppable({
			hoverClass: "success",
			drop: function( event, ui ) {
				var stepindex = $(this).parent().parent().index() - 1;
				$(ui.draggable).fadeOut().remove();
				$(this).parent().parent().find('td:last > ul').append('<li><span class="label success">' + $(ui.draggable).text() + '</span>' + $(ui.draggable).find('.indetails').html() + '</li>').fadeIn();

				$(this).parent().parent().find('li:last > .hidquant').attr('name','step' + stepindex + 'quantity[]');
				$(this).parent().parent().find('li:last > .hidmeas').attr('name','step' + stepindex + 'measurement[]');
				$(this).parent().parent().find('li:last > .hidname').attr('name','step' + stepindex + 'ingredientname[]');
			}
		});
		          
	});
