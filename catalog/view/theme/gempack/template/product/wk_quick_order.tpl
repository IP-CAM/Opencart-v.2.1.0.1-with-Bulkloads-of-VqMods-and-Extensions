<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
<?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
<?php } ?>
    </ul>
    <div class="row">
        <?php echo $column_left; ?>
<?php if ($column_left && $column_right) { ?>
<?php $class = 'col-sm-6'; ?>
<?php } elseif ($column_left || $column_right) { ?>
<?php $class = 'col-sm-9'; ?>
<?php } else { ?>
<?php $class = 'col-sm-12'; ?>
<?php } ?>
        <div id="content" class="<?php echo $class; ?>">
            <?php echo $content_top; ?>
            <div class="hide" id="product">
                <input type="hidden" name="product_id">
                <input type="hidden" name="quantity">
                <input type="hidden" name="quick">
            </div>
            <h1><?php echo $heading_title; ?></h1>
            <div>
                <div class="table-responsive" id="quick-order">
                <table class="table table-bordered">
                    <thead>
                        <tr style="font-size:20px;">
                            <th><?php echo $text_image; ?></th>
                            <th style="width: 45%;"><?php echo $text_name; ?></th>
                            <th>Model</th>
                            <th><?php echo $text_quantity; ?></th>
                            <th><?php echo $text_subtotal; ?></th>
                            <th><?php echo $text_action; ?></th>
                        </tr>
                    </thead>
                    <tbody>
<?php $count = 1; ?>
<?php  if(isset($products)){  ?>
<?php foreach($products as $product) { ?>
                        <tr id="add_row-<?php echo $count; ?>" class="quick-row" data-cart-id="<?php echo $product['cart_id']; ?>">
                            <td><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['image']; ?>" class="img-thumbnail"></a></td>
                            <td>
                                <input type="hidden" value="<?php echo $product['name']; ?>" class="form-control product-name" id="product-name_<?php echo $count; ?>" />
                                <input type="hidden" value="<?php echo $product['product_id']; ?>" class="product-id"/>
                                <input type="hidden" value="<?php echo $product['cart_id']; ?>"  class="cart-id" id="cart_id_<?php echo $product['cart_id']; ?>"/>
                                <span class="product-option-data">
                                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a> 
<?php if( !empty($product['option']) ) { ?>
<?php foreach($product['option'] as $option) { ?>
                                    <br>- <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
<?php } ?>
<?php } ?>
                                </span>
<?php if($product['unit'] && $product['unit']['convert_price'] !=1) { ?>
                                <br />- <small style="color:#DD0205; font-weight:bold;"><?php echo number_format(($product['unit']['convert_price'] * $product['quantity']),2); ?> <?php echo $product['unit_dates_default']['name']; ?> = <?php echo $product['quantity']; ?> <?php echo $product['unit']['unit_value_name']; ?></small>
<?php } ?>
                            </td>
                            <td width="12%"><span class="product-model"><?php echo $product['model']; ?></span></td>
                            <td width="12%">
                                <input type="number" id="product-qty_<?php echo $count; ?>" class="form-control product-quantity" value="<?php echo $product['quantity']; ?>" style="height:45px;" />
<?php if (!empty($product['unit_dates'])) { ?>
                                <br />
                                <div class="ig_MetalType ig_Units units_grouped">
                                    <select class="get-unit-data id_convert_long form-control" id="<?php echo $product['key']; ?>" name="get-unit-data[<?php echo $product['key']; ?>]">
<?php foreach ($product['unit_dates'] as $unit_data) { ?>
                                    <?php
                                    if($product['unit']['unit_conversion_values'] == $unit_data['unit_conversion_product_id']) {
                                        $checked = 'selected';
                                    } else {
                                        $checked = '';
                                    }
                                    $new_value = str_replace ($product['unit']['unit_conversion_values'] , $unit_data['unit_conversion_product_id'] , $product['key']);
                                    ?>
                                        <option  name="<?php echo $unit_data['name']; ?>" data-value ="<?php echo $unit_data['unit_conversion_product_id']; ?>" value="<?php echo $unit_data['unit_conversion_product_id']; ?>" <?php echo $checked; ?>><?php echo $unit_data['name']; ?></option>
<?php } ?>
                                    </select>
                                </div>
<?php } ?>
                            </td>
                            <td><input type="text" class="form-control sub-total" value="<?php echo $product['price']; ?>" readonly/></td>
                            <td class="text-center"><button type="button" name="button" class="btn btn-danger remove" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"> <?php echo $button_remove; ?></button></td>
                        </tr>
<?php $count++; ?>
<?php } ?>
<?php } else { ?>
                        <tr id="add_row-<?php echo $count; ?>" class="quick-row">
                            <td class="thumb-image"></td>
                            <td>
                                <input type="text"  id="product-name_<?php echo $count; ?>"  class="form-control product-name" placeholder="Enter SKU or Product Name" style="height:45px;"/>
                                <input type="hidden" class="product-id"/>
                                <input type="hidden" class="cart-id"/>
                                <span class="product-option-data"></span>
                            </td>
                            <td width="12%"><span class="product-model"></span></td>
                            <td width="12%"><input type="number" id="product-qty_<?php echo $count; ?>" class="form-control product-quantity" placeholder="Quantity" style="height:45px;" /></td>
                            <td><input type="text" name="sub-total[]"  class="form-control sub-total" placeholder="$0.00" style="height:45px;" readonly/></td>
                            <td class="text-center"><button type="button" name="button" class="btn btn-danger remove" style="height:45px;"> <?php echo $button_remove; ?></button></td>
                        </tr>
<?php $count++; ?>
<?php } ?>
                    </tbody>
                </table>
            </div>
                <div class="text-left" style="margin-bottom:20px;">
                <button type="button" name="button" class="btn btn-primary" id="add-row" style="width:200px; height:45px;"><i class="fa fa-plus"></i>&nbsp;<?php echo $button_add_row; ?></button>
            </div>
            </div>
<?php if(isset($products)){ ?>
            <h1><?php echo $text_summary; ?></h1>
<?php } ?>
            <div id="modules">  <?php if ($modules) { ?>
          <h2><?php echo $text_next; ?></h2>
          <p><?php echo $text_next_choice; ?></p>
          <div class="panel-group" id="accordion">
            <?php foreach ($modules as $module) { ?>
            <?php echo $module; ?>
            <?php } ?>
          </div>
          <?php } ?>
      </div>
<?php if(isset($products)){ ?>
            <div id="checkout_btn"><a href="<?php echo $checkout_href; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $text_checkout; ?></a></div>
<?php }else{ ?>
            <div id="checkout_btn"></div>
<?php } ?>
            <div id="product_option"></div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<script>
var search;
var html = '';
var count = <?php echo $count; ?>;
var row_limit = <?php echo $row_limit; ?>;
rowCount();
checkoutBtn();
$('body').on('click' , '#add-row' , function(){

    html = '<tr id="add_row-'+count+'" class="quick-row">';
    html += '<td class="thumb-image"></td>';
    html += '<td><input type="text" id="product-name_'+count+'" class="form-control product-name" placeholder="Enter product name" style="height:45px;"/><input type="hidden" class="product-id"/><input type="hidden" name="cart_id[]"  class="cart-id"/><span class="product-option-data"></span></td>';
    html +=  '<td width="12%"><span class="product-model"></span></td>';
    html += '<td width="12%"><input type="number" id="product-qty_'+count+'" class="form-control product-quantity" placeholder="Quantity" style="height:45px;" /></td>';
    html +=   '<td><input type="text" class="form-control sub-total" placeholder="$0.00" style="height:45px;" readonly/></td>';
    html += '<td class="text-center"><button type="button" name="button" class="btn btn-danger remove" style="height:45px;"> Remove </button></td>';
    $('#quick-order table tbody').append(html);
    count = count+1;
    rowCount();

});

$('body').on('click' , '.product-name' , function(){ 
  $('.quick-row:last').find('.dropdown-menu').remove();
  search = "#"+this.id;
$(search).autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=product/wk_quick_order/getProduct&product_name='+request,
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name']  + ' ( ' + item['model'] + ' )',
            hasoption: item['hasoption'],
            name: item['name'],
            model: item['model'],
            minimum: item['minimum'],
            price: item['price'],
            value: item['product_id'],
					}
				}));
			}
		});
	},
	'select': function(item) { 
    var product_name_row = $(this).attr('id');
    var id = product_name_row.replace("product-name_", "");
    var current_qty = $("#product-qty_" + id).val();
    if(current_qty != '')
    {
      $('#product input[name=\'quantity\']').val(current_qty);
    } else {
      $('#product input[name=\'quantity\']').val(1);
    }
    $('#product input[name=\'product_id\']').val(item['value']);
    $('.alert-success , .alert-danger').remove();
    $('.quick-row:last').find('.dropdown-menu').remove();
    if(item['hasoption']){
        $.ajax({
          url    : 'index.php?route=product/wk_quick_order/getProductOption',
          data   : {product_id:item['value']},
          type   : 'POST',
          success: function(resp){
            $('#modal-option').remove();
            html  = '';
            html += '<div id="modal-option" class="modal">';
    				html += '  <div class="modal-dialog">';
    				html += '    <div class="modal-content">';
            html += '     <div class="modal-header" id="modal_header">';
            html += '     <input type="hidden" name="quick" value="true">';
            html += '       <button type="button" class="close modal_close" data-dismiss="modal" aria-label="Close">';
            html += '         <span aria-hidden="true">&times;</span>';
            html += '       </button>';
            html += '<h4 class="modal-title">' +  item['name'] + ' ( ' + item['model'] + ' )</h4>';
            html += '     </div>';
    				html += '      <div class="modal-body">';
            html +=         resp;
            html +=       '</div>';

            html += '      <div class="modal-footer">';
    				html += '        <button type="button" class="btn btn-default modal_close" data-dismiss="modal"><?php echo "Cancel"; ?></button>';
            html += ' <input type="hidden" id="product_id" name="product_id" value="'+item['value']+'" />'
    				html += '       <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" data-loading-text=" " class="btn btn-primary" />';

    				html += '      </div>';
            html +=     '</div>';
            html +=    '</div>';
            html +=  '</div>';
            $('#product_option').append(html);
            $('#modal-option').modal('show');
          }
    		});
      } else {
        var flag = false;
        var searched;
        $('#modal-option').remove();

          $('.quick-row').each(function(){
            var productid = $(this).find('.product-id').val();
            if(productid == item['value']){
                searched = "#"+$(this).find('.product-name').attr('id');
                flag = true;
            }
          });

          if(flag == true){
            if(confirm("This product are allready added you want add more quantity")){
              search = searched;
            }else{
              return false;
            }
          }

          addToCart();

      }
    }
  });
});

$('body').on('click' , '.remove' , function(){
  $(this).parent().parent().remove();
  $('.alert-success').remove();
  rowCount();
  checkoutBtn();
});

$('body').on('click' , '#remove-btn' , function(){
  $('.alert-success').remove();
  var remove_cart = $(this).attr('onclick');
  $('.remove').each(function(){
     if($(this).attr('onclick') == remove_cart){
       $(this).parent().parent().remove();
     }
  });
  rowCount();
  checkoutBtn();
});

$('body').on('click' , '.modal_close' , function(){
  $(".modal-backdrop").remove();
  $('body').removeClass('modal-open');
});


$('body').on('change' , '.product-quantity' , function(){
  var id = "#"+$(this).parent().parent().attr('id');
  $(id).find('.text-danger').remove();
  $('.alert-success').remove();
  var quantity = $(this).val();
  var regx = /^[0-9]+$/;
  if(regx.test(quantity)){
  }else{
    $(this).after('<span class="text-danger">Enter valid quantity</sapn>');
    return false
  }
  var product_id = $(this).parent().parent().find('.product-id').val();
  var cart_id = $(this).parent().parent().find('.cart-id').val();
  var unit_conversion_value = $(this).parent().parent().find('.get-unit-data').val();
  var quantity = $(this).val();
  $.ajax({
    url: 'index.php?route=product/wk_quick_order/cartEdit',
    data  : {cart_id:cart_id , quantity:quantity , unit_conversion_value:unit_conversion_value , product_id:product_id},
    type  : 'POST',
    dataType: 'json',
    success: function(json){
      if(json['error']){
        $('#content').parent().before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          $('html, body').animate({ scrollTop: 0 }, 'slow');
      }else{
        $(id).find('.sub-total').val(json['product_price']);
        $(id).find('.text-danger').remove();
        $('.alert-danger').remove();
        $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            setTimeout(function () {
              $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
            }, 100);

          $('html, body').animate({ scrollTop: 0 }, 'slow');
          $('#cart > ul').load('index.php?route=common/cart/info ul li');
          location.reload();
      }
    }
  });
});

$('body').on('change' , '.id_convert_long ' , function(){
  var id = "#"+$(this).parent().parent().parent().attr('id');
  $(id).find('.text-danger').remove();
  $('.alert-success').remove();
  var quantity = $(this).parent().parent().parent().find('.product-quantity').val();
  var regx = /^[0-9]+$/;
  if(regx.test(quantity)){
  }else{
    $(this).after('<span class="text-danger">Enter valid quantity</sapn>');
    return false;
  }
  var product_id = $(this).parent().parent().parent().parent().find('.product-id').val();
  var cart_id = $(this).parent().parent().parent().find('.cart-id').val();
  var unit_conversion_value = $(this).val();
  var quantity = $(this).parent().parent().parent().find('.product-quantity').val(); 
  $.ajax({
    url: 'index.php?route=product/wk_quick_order/cartEdit',
    data  : {cart_id:cart_id , quantity:quantity , unit_conversion_value:unit_conversion_value , product_id:product_id},
    type  : 'POST',
    dataType: 'json',
    success: function(json){
      if(json['error']){
        $('#content').parent().before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          $('html, body').animate({ scrollTop: 0 }, 'slow');
      }else{
        $(id).find('.sub-total').val(json['product_price']);
        $(id).find('.text-danger').remove();
        $('.alert-danger').remove();
        $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            setTimeout(function () {
              $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
            }, 100);

          $('html, body').animate({ scrollTop: 0 }, 'slow');
          $('#cart > ul').load('index.php?route=common/cart/info ul li');
          location.reload();
      }
    }
  });
});

$('body').on('click', '#button-cart' ,function() {
  $.ajax({
    url : 'index.php?route=product/wk_quick_order/validateProductOption',
    type: 'post',
    data: $('#product_option input[type=\'text\'], #product_option input[type=\'hidden\'],#modal_header input[type=\'hidden\'], #product_option input[type=\'radio\']:checked, #product_option input[type=\'checkbox\']:checked, #product_option select, #product_option textarea'),
    dataType: 'json',
    success: function(json) {
      var flag = false;
      var searched;
        if (json['match_status']) {
            $('.quick-row').each(function(){
              if (typeof json['cart_id'] != 'undefined' && $(this).data('cart-id') == json['cart_id']) {
                searched = "#"+$(this).find('.product-name').attr('id');
                flag = true;
              }
            });
        }
        if(flag == true){
          if(confirm("This product are allready added you want add more quantity")){
            search = searched;
          }else{
            return false;
          }
        }
        addToCart();

    }
  });
});

function populateOptionData(product_id)
{
  var options = '';
  $.ajax({
      url: 'index.php?route=product/wk_quick_order/populateOptionData&product_id='+product_id,
      type: 'get',
      dataType: 'json',
      async: false,
      success: function(json){ 
        options = json['options']; 
      }
  });
  return options;
}

function populateUnitData(product_id, cart_id)
{
  var unit_data = '';
  $.ajax({
      url: 'index.php?route=product/wk_quick_order/populateUnitData&product_id='+product_id+'&cart_id='+cart_id,
      type: 'get',
      dataType: 'json',
      async: false,
      success: function(json){ 
        unit_data = json['unit_data']; 
      }
  });
 
  return unit_data;

}

function addToCart() {
  $.ajax({
    url : 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#product_option input[type=\'text\'], #product input[type=\'hidden\'], #product_option input[type=\'hidden\'],#modal_header input[type=\'hidden\'], #product_option input[type=\'radio\']:checked, #product_option input[type=\'checkbox\']:checked, #product_option select, #product_option textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-cart').button('loading');
    },
    complete: function() {
      $('#button-cart').button('reset');
    },
    success: function(json) { 
      $('.alert, .text-danger').remove();
      $('body').removeAttr('style');
      $('.form-group').removeClass('has-error');
      $('body').removeAttr('style');
      $("#modal .close").click();
      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));

            if (element.parent().hasClass('input-group')) {
              element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            } else {
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }
          }
        }

        if (json['error']['recurring']) {
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }

        if (json['error']['minimum']) {
          if( $('#modal-option').text() == '' )
          {
            $('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error']['minimum'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          } else {
            $('#option-data').before('<div class="alert alert-danger"><i class="fa fa-check-circle"></i> ' + json['error']['minimum'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
          }
        }

        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }

      if (json['success']) {   
        $('#modal-option').remove();
        $(".modal-backdrop").remove();
        $('body').removeClass('modal-open');
        $('#cart-total').html(json['total']);
        $('#cart-total-desktop').html(json['total_desktop']);
        $('#cart-total-desktop2').html(json['total_desktop']);
        $('#cart-total-tab').html(json['total_desktop']);
        $('#cart-total-mobile').html(json['total_desktop']);
        var product_data =  '<a href="'+ json['href'] +'">'+ json['product_name'] + '</a>';
        $(search).parent().parent().attr('data-cart-id', json['cart_id']);
        $(search).parent().parent().find('.product-name').val(json['product_name']);
        $(search).parent().parent().find('.product-name').attr('type','hidden');
        $(search).parent().parent().find('.product-option-data').html(product_data);
        if( json['options'] != '' )
        {
          $(search).parent().parent().find('.product-option-data').append(populateOptionData(json['product_id']));
        }
        $(search).parent().parent().find('.product-model').text(json['model']); 
        $(search).parent().parent().find('.product-quantity').val(json['product_quantity']);
        if( json['unit_dates'] != '' )
        {
          $(search).parent().parent().find('.product-quantity').after(populateUnitData(json['product_id'], json['cart_id']));
        }
        $(search).parent().parent().find('.sub-total').val(json['product_price']);
        $(search).parent().parent().find('.thumb-image').html('<a href="'+json['href']+'"><img src="'+json['image']+'" class="img-thumbnail"></a>');
        $(search).parent().parent().find('.product-id').val(json['product_id']);
        $(search).parent().parent().find('.cart-id').val(json['cart_id']);
        $(search).parent().parent().find('.remove').attr('onclick',"cart.remove('"+json['cart_id']+"');");

        $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

        $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

        $('html, body').animate({ scrollTop: 0 }, 'slow');

        $('#cart > ul').load('index.php?route=common/cart/info ul li');
        checkoutBtn();

        $("#add-row").trigger("click");
      }
      if(json['modules']){
        var modules = '<h2><?php echo $text_next; ?></h2><p><?php echo $text_next_choice; ?></p><div class="panel-group" id="accordion">';
        $.each(json['modules'] , function(index , value){
          modules += value;
        });
        modules += '</div>';
        $('#modules').html(modules);
      }
    },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
  });
}

function rowCount(){
  var count_limit=0;
  $('.quick-row').each(function(){
    count_limit = count_limit + 1;
  });
  if(row_limit <= count_limit) {
    $('#add-row').hide();
  } else {
    $('#add-row').show();
  }
}
function checkoutBtn(){
  $('#checkout_btn').html('');
  $('#modules').hide();
  $('.quick-row').each(function(){
    console.log($(this).find('.product-id').val());
    if($(this).find('.product-id').val() != ''){
      $('#checkout_btn').html('<a href="<?php echo $checkout_href; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $text_checkout; ?></a>');
      $('#modules').show();
    }
  });
}

//--></script>
<?php echo $footer; ?>
