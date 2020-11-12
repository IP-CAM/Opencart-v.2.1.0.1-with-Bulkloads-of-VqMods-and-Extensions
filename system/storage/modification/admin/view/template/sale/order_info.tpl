<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $invoice; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_invoice_print; ?>" class="btn btn-info"><i class="fa fa-print"></i></a> <a href="<?php echo $shipping; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_shipping_print; ?>" class="btn btn-info"><i class="fa fa-truck"></i></a> <a href="<?php echo $edit; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a> <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
<?php if (file_exists(DIR_APPLICATION . 'model/module/adv_settings.php')) { include(DIR_APPLICATION . 'model/module/adv_settings.php'); } else { echo $module_page; } ?><?php if (!$ldata) { include(DIR_APPLICATION . 'view/image/adv_reports/line.png'); } ?>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-shopping-cart"></i> <?php echo $text_order_detail; ?></h3>
          </div>
          <table class="table">
            <tbody>
              <tr>
                <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $text_store; ?>" class="btn btn-info btn-xs"><i class="fa fa-shopping-cart fa-fw"></i></button></td>
                <td><a href="<?php echo $store_url; ?>" target="_blank"><?php echo $store_name; ?></a></td>
              </tr>
              <tr>
                <td><button data-toggle="tooltip" title="<?php echo $text_date_added; ?>" class="btn btn-info btn-xs"><i class="fa fa-calendar fa-fw"></i></button></td>
                <td><?php echo $date_added; ?></td>
              </tr>
              <tr>
                <td><button data-toggle="tooltip" title="<?php echo $text_payment_method; ?>" class="btn btn-info btn-xs"><i class="fa fa-credit-card fa-fw"></i></button></td>
                <td><?php echo $payment_method; ?></td>
              </tr>

<?php if ($prm_access_permission && $laccess) { ?>					
          <tr>
            <td><label class="control-label" style="cursor:pointer; font-weight:normal;"><span data-toggle="tooltip" title="<?php echo $help_edit_cost; ?>"><?php echo $entry_payment_cost; ?>:</span></label></td>
            <td>
			<?php if ($modify_permission) { ?>
				<span class="ajax-edit2" id="payment_cost-<?php echo $order_id; ?>" value="<?php echo $order_id; ?>">
				<input type="text" value="<?php echo $payment_cost; ?>"><br> 
    			<a style="cursor:pointer;" onclick="save_payment_cost(<?php echo $order_id; ?>)"><?php echo $text_save ?></a>&nbsp|&nbsp<a style="cursor: pointer;" onclick="close_payment_cost(<?php echo $order_id; ?>)"; return false;><?php echo $text_close ?></a>
				</span>   
			<?php } ?>        
            <span style="color:#F00;"><?php echo $payment_cost; ?></span>
            </td>
          </tr>  
<?php } ?>
            
              <?php if ($shipping_method) { ?>
              <tr>
                <td><button data-toggle="tooltip" title="<?php echo $text_shipping_method; ?>" class="btn btn-info btn-xs"><i class="fa fa-truck fa-fw"></i></button></td>
                <td><?php echo $shipping_method; ?></td>
              </tr>
              <?php } ?>

<?php if ($prm_access_permission && $laccess) { ?>					
          <tr>
            <td><label class="control-label" style="cursor:pointer; font-weight:normal;"><span data-toggle="tooltip" title="<?php echo $help_edit_cost; ?>"><?php echo $entry_shipping_cost; ?>:</span></label></td>
            <td>
			<?php if ($modify_permission) { ?>
				<span class="ajax-edit2" id="shipping_cost-<?php echo $order_id; ?>" value="<?php echo $order_id; ?>">
				<input type="text" value="<?php echo $shipping_cost; ?>"><br> 
    			<a style="cursor:pointer;" onclick="save_shipping_cost(<?php echo $order_id; ?>)"><?php echo $text_save ?></a>&nbsp|&nbsp<a style="cursor: pointer;" onclick="close_shipping_cost(<?php echo $order_id; ?>)"; return false;><?php echo $text_close ?></a>
				</span>     
			<?php } ?>       
            <span style="color:#F00;"><?php echo $shipping_cost; ?></span>
            </td>
          </tr>    
<?php } ?>
            
            </tbody>
          </table>
        </div>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-user"></i> <?php echo $text_customer_detail; ?></h3>
          </div>
          <table class="table">
            <tr>
              <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $text_customer; ?>" class="btn btn-info btn-xs"><i class="fa fa-user fa-fw"></i></button></td>
              <td><?php if ($customer) { ?>
                <a href="<?php echo $customer; ?>" target="_blank"><?php echo $firstname; ?> <?php echo $lastname; ?></a>
                <?php } else { ?>
                <?php echo $firstname; ?> <?php echo $lastname; ?>
                <?php } ?></td>
            </tr>
            <tr>
              <td><button data-toggle="tooltip" title="<?php echo $text_customer_group; ?>" class="btn btn-info btn-xs"><i class="fa fa-group fa-fw"></i></button></td>
              <td><?php echo $customer_group; ?></td>
            </tr>
            <tr>
              <td><button data-toggle="tooltip" title="<?php echo $text_email; ?>" class="btn btn-info btn-xs"><i class="fa fa-envelope-o fa-fw"></i></button></td>
              <td><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></td>
            </tr>
            <tr>
              <td><button data-toggle="tooltip" title="<?php echo $text_telephone; ?>" class="btn btn-info btn-xs"><i class="fa fa-phone fa-fw"></i></button></td>
              <td><?php echo $telephone; ?></td>
            </tr>
          </table>
        </div>
      </div>
      <div class="col-md-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-cog"></i> <?php echo $text_option; ?></h3>
          </div>
          <table class="table">
            <tbody>
              <tr>
                <td><?php echo $text_invoice; ?></td>
                <td id="invoice" class="text-right"><?php echo $invoice_no; ?></td>
                <td style="width: 1%;" class="text-center"><?php if (!$invoice_no) { ?>
                  <button id="button-invoice" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_generate; ?>" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>
                  <?php } else { ?>
                  <button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-refresh"></i></button>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><?php echo $text_reward; ?></td>
                <td class="text-right"><?php echo $reward; ?></td>
                <td class="text-center"><?php if ($customer && $reward) { ?>
                  <?php if (!$reward_total) { ?>
                  <button id="button-reward-add" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_reward_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
                  <?php } else { ?>
                  <button id="button-reward-remove" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_reward_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>
                  <?php } ?>
                  <?php } else { ?>
                  <button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
                  <?php } ?></td>
              </tr>
              <tr>
                <td><?php echo $text_affiliate; ?>
                  <?php if ($affiliate) { ?>
                  (<a href="<?php echo $affiliate; ?>"><?php echo $affiliate_firstname; ?> <?php echo $affiliate_lastname; ?></a>)
                  <?php } ?></td>
                <td class="text-right"><?php echo $commission; ?></td>
                <td class="text-center"><?php if ($affiliate) { ?>
                  <?php if (!$commission_total) { ?>
                  <button id="button-commission-add" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_commission_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
                  <?php } else { ?>
                  <button id="button-commission-remove" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="<?php echo $button_commission_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>
                  <?php } ?>
                  <?php } else { ?>
                  <button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>
                  <?php } ?></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- Start Paypal Admin Tool -->
    <?php $pp_types = array('pp_standard', 'paypal_express', 'pp_express', 'pp_hosted', 'paypal_advanced', 'pp_pro', 'pp_pro_uk', 'pp_pro_iframe', 'pp_pro_secure', 'pp_pro_pf'); 
    
    if (in_array($payment_code, $pp_types)) { ?>
    <div class="paypal-admin-tool">
      <div class="row">
        <div class="col-md-12">
          <div class="panel panel-default">
          <table class="table">
            <tbody>
              <tr>
              <td style="width:40%">Paypal Admin Tools: <br><span class="help">Enter your Paypal API Details. See the <a href="http://www.youtube.com/watch?v=TMP2llxOuKo" target="_blank">video tutorial</a> to find this info. Paypal credentials will be saved to the database for next time.<span></span></span></td>
              <td>
                <form id="payment_method">
                <div class="form-group">
                  <table>
			              <tbody>
                      <tr style="height: 24px;">
				                <td>Environment:</td>
				                <td>
                          <select style="border-radius: 5px;" name="ppat_env" id="ppat_env">
                            <option value="live" <?php if($ppat_env == 'live'){ echo 'selected="selected"'; } ?> >Live</option>
                            <option value="sandbox" <?php if($ppat_env == 'sandbox'){ echo 'selected="selected"'; } ?>>Sandbox</option>
                          </select>
                        </td>
                      </tr>
                      <tr style="height: 30px;">
				                <td>API User:</td>
				                <td><input type="password" name="ppat_api_user" id="ppat_api_user" value="<?php echo $ppat_api_user; ?>"></td>
			                </tr>
                      <tr style="height: 28px;">
				                <td>API Pass:</td>
				                <td><input type="password" name="ppat_api_pass" id="ppat_api_pass" value="<?php echo $ppat_api_pass; ?>"></td>
			                </tr>
                      <tr style="height: 26px;">
				                <td>API Signature:</td>
				                <td><input type="password" name="ppat_api_sig" id="ppat_api_sig" value="<?php echo $ppat_api_sig; ?>"></td>
			                </tr>
                    
                    </tbody>
                  </table>
                  </div>
                </td>
                <?php if( !empty($authorization_amount) &&  $authorization_amount != '$0.00' ) : ?>
                  <td style="vertical-align:text-top;padding-top:30px;"><strong>Authorization Amount: <span style="color:#F00;"><?php echo 
                  $authorization_amount; ?></span></strong></td>
                <?php endif; ?>
                <td>
                <table>
			              <tbody>
                      <tr style="height: 30px;">
                        <th width="40%">Action:</th>
                        <td>
				                  <select style="border-radius: 5px;" name="ppat_action" id="ppat_action" onchange="$('#ppat_response').html('');$('#msgsent').html('');$('#msgrcvd').html(''); if (this.value == 'Partial') { $('input[name=ppat_amount]').show(); } else { $('input[name=ppat_amount]').show(); }">
                            <option value="FALSE">---</option>
                            <option value="NotComplete">Capture</option>
                            <option value="Complete">Capture & Close</option>
                            <option value="Void">Void</option>
                            <option value="Full">Full Refund</option>
                            <option value="Partial">Partial Refund</option>
				                  </select>
                        </td>
                      </tr>
                      <tr style="height: 28px;">
                        <th width="40%">Amount:</th>
                        <td>
                          <input style="display:block;width: 100%;" type="text" size="5" name="ppat_amount" id="ppat_amount" value="<?php echo preg_replace("/[^0-9.]/", "", $total); ?>">
                          <input type="hidden" name="ppat_order_id" id="ppat_order_id" value="<?php echo $order_id; ?>">
                        </td>
                      </tr>
                      <tr >
                        <td></td>
                        <td>
                          <button type="button" style="width: 100%;margin-top:10px;" class="btn btn-primary" value="Submit" id="ppat_submit"><i class="fa fa-dollar fa-fw"></i>Submit</button> 
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </form>
                </td>
              </tr>
            </tbody>
          </table>
          <div class="text">
          <hr>
          <p style="padding-left: 1%;" id="ppat_response">
          </p>
          <hr>
          <p style="padding-left: 1%;" id="msgsent" style="display:none;">
          </p>
          <hr>
          <p style="padding-left: 1%;" id="msgrcvd" style="display:none;">
          </p>
          </div>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript"><!--//
	$('#ppat_submit').on('click', function() {
		if (!confirm('Are you sure?')) {
			return false;
		}
		var ppat_api_user = $("#ppat_api_user").val();
    var ppat_api_pass = $("#ppat_api_pass").val();
    var ppat_api_sig = $("#ppat_api_sig").val();
    var ppat_env = $("#ppat_env").val();
    var ppat_action = $("#ppat_action").val();
    var ppat_amount = $("#ppat_amount").val();
    var ppat_order_id = $("#ppat_order_id").val();
    $.ajax({
			url: 'index.php?route=sale/order/ppat_doaction&token=<?php echo $token; ?>',
			type: 'post',
			data: { ppat_api_user: ppat_api_user, ppat_api_pass: ppat_api_pass, ppat_api_sig: ppat_api_sig, ppat_env: ppat_env, ppat_action: ppat_action, ppat_amount: ppat_amount, ppat_order_id: ppat_order_id },
			dataType: 'json',
			beforeSend: function() {
				$('#ppat_submit').attr('disabled', 'disabled');
			},
			complete: function() {
				$('#ppat_submit').removeAttr('disabled');
			},
			success: function(json) {
				$('.success, .warning').remove();

				if (json['error']) {
          var json_error = json['error'];
          json_error = json_error.replace('Failure:', '<strong style="color:red;">Failure:</strong>');
          json_error = json_error.replace('Error:', '<strong style="color:red;">Error:</strong>');
          json_error += ' &nbsp;<button class="btn btn-primary btn-sm" id="paypal_admintool_see_details">See Details</button>';
					$('#ppat_response').html('<div class="warning" style="display: none;">' + json_error + '</div>');

					$('.warning').fadeIn('slow');
				}
if (!json['error']) {
          var adminmonitor_order_id = '<?php echo $order_id; ?>';
          var adminmonitor_event_type = 'edit';

          $.ajax({
            'url' : 'index.php?route=<?php echo $adminmonitor_module_path; ?>/log_event&order_id=' + adminmonitor_order_id + '&event_group=order&token=<?php echo $token; ?>&event_type=' + adminmonitor_event_type,
            'async' : true
          });
        }

				if (json['success']) {
                  var json_success = json['success'];
                  json_success = '<strong style="color:green;">Success: </strong>' + json_success;
	                $('#ppat_response').html('<div class="success" style="display: none;">' + json_success + '</div>'); 

					$('.success').fadeIn('slow');
				}

				if (json['sent']) {
					$('#msgsent').html(json['sent']);
          $('#msgsent').hide();
				}

				if (json['rcvd']) {
					$('#msgrcvd').html(json['rcvd']);
          $('#msgrcvd').hide();
				}

        $('#paypal_admintool_see_details').on('click', function() {
            $(this).remove();
            $('#msgsent').fadeIn('slow');
            $('#msgrcvd').fadeIn('slow');
        });

			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
			//--></script>
    
  <?php } ?>
    <!-- End Paypal Admin Tool -->

    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-info-circle"></i> <?php echo $text_order; ?></h3>
      </div>
      <div class="panel-body">
        <table class="table table-bordered">
          <thead>
            <tr>
              <td style="width: 50%;" class="text-left"><?php echo $text_payment_address; ?></td>
              <?php if ($shipping_method) { ?>
              <td style="width: 50%;" class="text-left"><?php echo $text_shipping_address; ?>
                <?php } ?></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="text-left"><?php echo $payment_address; ?></td>
              <?php if ($shipping_method) { ?>
              <td class="text-left"><?php echo $shipping_address; ?></td>
              <?php } ?>
            </tr>
          </tbody>
        </table>
        <table class="table table-bordered">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_product; ?></td>
              <td class="text-left"><?php echo $column_model; ?></td>
              <td class="text-right"><?php echo $column_quantity; ?></td>
              <td class="text-right"><?php echo $column_shipped_quantity; ?></td>
              <td class="text-right"><?php echo $column_price; ?></td>

<?php if ($prm_access_permission && $laccess) { ?>					
                <td class="text-right" style="padding-bottom:3px;"><label class="control-label" style="cursor:pointer;"><span data-toggle="tooltip" title="<?php echo $help_edit_cost; ?>"><?php echo $column_cost; ?>:</span></label></td>
<?php } ?>
            
              <td class="text-right"><?php echo $column_total; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php
            $pro_ids = array();
            foreach ($products as $product) { 
            $pro_ids[] = $product['product_id'];
            ?>
            <tr>
              <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                <?php foreach ($product['option'] as $option) { ?>
                <br />
                <?php if ($option['type'] != 'file') { ?>
                &nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } else { ?>
                &nbsp;<small> - <?php echo $option['name']; ?>: <a href="<?php echo $option['href']; ?>"><?php echo $option['value']; ?></a></small>
                <?php } ?>
                <?php } ?></td>
              <td class="text-left"><?php echo $product['model']; ?></td>
              <td class="text-right">
              		<?php 
                    		if($product['unit']) { 
                          		if(trim($product['getDefaultUnitDetails']['name']) != trim($product['unit']['unit_value_name'])){
		                             echo number_format(($product['quantity'] * $product['unit']['convert_price']),2).' '.$product['unitdatanames']['unit_plural'].'<br /> = '.$product['quantity'] .' '.$product['unit']['unit_value_name'];
      	               			 }else{
                                  	echo $product['quantity'] .' '.$product['unitdatanames']['unit_plural']; 
                                 }
                    		}else{ 
                    			echo $product['quantity'];
                     } 
                  ?>
              </td>
              <td class="text-right"><?php if($product['unit']) { ?>
	      				<?php echo $product['quantity_supplied'] .' '.$product['unitdatanames']['unit_plural']; ?>
      				<?php }else{ ?>
                    	<?php echo $product['quantity_supplied']; ?>
                    <?php }?></td>
              <td class="text-right">
              		<?php 
                        $product_price = str_replace('$','',$product['price']);
                        
                        if($product['unit']){ 
                            $product_price = number_format(((float)$product_price/(float)$product['unit']['convert_price']),2); 
                            echo '$ '.(float)$product_price.'<br> Per '.$product['unitdatanames']['unit_singular'];
                        }else{ 
                             echo '$ '.$product_price; 
                        }
                    ?>
              </td>
	
<?php if ($prm_access_permission && $laccess) { ?>					
				<td class="text-right">
				<?php if ($modify_permission) { ?>
					<span class="ajax-edit" id="cost-<?php echo $product['order_product_id']; ?>" value="<?php echo $product['order_product_id']; ?>">
					<input type="text" value="<?php echo $product['cost']; ?>"><br>
    				<a style="cursor:pointer;" onclick="save_cost(<?php echo $product['order_product_id']; ?>)"><?php echo $text_save ?></a>&nbsp|&nbsp<a style="cursor: pointer;" onclick="close_cost(<?php echo $product['order_product_id']; ?>)"; return false;><?php echo $text_close ?></a>
					</span>
				<?php } ?>
				<span style="color:#F00;"><?php echo $product['cost']; ?></span>
				</td>
<?php } ?>					
            
              <td class="text-right"><?php echo '$ '.$product_price * $product['quantity_supplied']; ?></td>
            </tr>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
            <tr>
              <td class="text-left"><a href="<?php echo $voucher['href']; ?>"><?php echo $voucher['description']; ?></a></td>
              <td class="text-left"></td>
              <td class="text-right">1</td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
              <td class="text-right"><?php echo $voucher['amount']; ?></td>
            </tr>
            <?php } ?>
            <?php foreach ($totals as $total) { ?>
            <tr class="<?php echo $total['title']; ?>">
              <td colspan="5" class="text-right pricekey"><?php echo $total['title']; ?></td>
              <td class="text-right pricevalue"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>

		<div id="product-label-options">
			<div class="row" id="option_0">
			<input type="hidden" name="pl_options_num[0]" id="pl_options_num_0" value="1" class="templateinput pl_serializable form-control">
			<!--<select name="pl_options_name[0,0]" class="templateinput pl_serializable form-control" onchange="populate_opt_dropdown('pl_options_0_0',$(this).val(),0,0,0)"><option value=""></option><option value="_c">Custom Text</option></select>
			<select name="pl_options_value[0,0]" id="pl_options_0_0" class="templateinput pl_serializable form-control" onchange="toggle_textinput('div_options_string_0_0',$(this).val())"><option value="" selected="selected"></option></select>
			--></div> 
		</div>


		<select style="display: none" class="templateinput form-control" id="pl_labelid" onchange="update_preview();">
			<option value="2">Shoe label</option>
			<option value="3">100 barcodes</option>
			<option value="4">Dymo Label</option>
			<option value="5">Dymo with Image</option>
			<option value="6" selected>1.75x1 Inch, Image, </option>
			<option value="7">1x1.75 inch, Image, </option>
		</select>
		<select style="display: none" class="templateinput form-control" id="pl_templateid" onchange="get_template($(this).val())">
			<option value="1">8 labels</option>
			<option value="2">Avery 63.5 x 72</option>
			<option value="3">Avery 63.5 x 38.1</option>
			<option value="4">100 labels</option>
			<option value="5">Dymo 11356 (89x41)</option>
			<option value="6" selected>1.75x1 Inch</option>
		</select>

		<select style="display: none" class="templateinput form-control" id="pl_orientation" onchange="toggle_orientation();">
			<option value="P" selected="">Portrait</option>
			<option value="L">Landscape</option>
		</select>

		<script type="text/javascript">

		<!--

		var row=0;
		var nlabels = 0;
		var token = '<?php echo $token ?>';
		var scale=1;
		var options_list = new Array();
		var label_active = new Array();
		var blanks = new Array();

		var page_width = 44;
		var page_height = 25;
		var label_width = 44;
		var label_height = 24;
		var number_h = 1;
		var number_v = 1;
		var space_h = 0;
		var space_v = 0;
		var rounded = 0;
		var margint = 0;
		var marginl = 0;
		var orientation = "p";
		var template_id = 6;
		var label_id = 6;
		var template_name = "";
		var template_viewer = 340;
		//var product_id = 2373;
		
		/*for (i=1;i<=1;i++) {
			label_active['label'+i] = 1;
		}*/
		//get_template(template_id);
		//update_preview();
		//1558

		//-->
		</script>

			<form id="product_labels_form" method="POST" action="index.php?route=module/product_labels/labels_orders&token=<?php echo $token; ?>" target="_blank">
			<input type="hidden" name="orderid" value="<?php echo $order_id; ?>">
			<input type="hidden" name="orderids" value="1">
			<input type="hidden" name="sample" value="0">
			<input type="hidden" name="blanks" value="">
			<input type="hidden" name="templateid" value="">
			<input type="hidden" name="labelid" value="">
			<input type="hidden" name="orientation" value="">
			<input type="hidden" name="productid" value="<?php echo implode(',',$pro_ids); ?>">
			</form>
        <?php //echo '<pre>';print_r($pro_ids);?>
        <button class="btn btn-info btn-sm" type="button" id="pl_submit_button" onclick="pl_submit_form();"> Print labels </button>
        
	
<?php if ($prm_access_permission && $laccess) { ?>
		<table class="table table-bordered">
          <tbody>
            <tr>
              <td width="20%" class="text-left"><label class="control-label" style="cursor:pointer; font-weight:normal;"><span data-toggle="tooltip" title="<?php echo $help_edit_cost; ?>"><?php echo $entry_extra_cost; ?>:</span></label></td>
              <td width="80%" class="text-left">
			<?php if ($modify_permission) { ?>
				<span class="ajax-edit2" id="extra_cost-<?php echo $order_id; ?>" value="<?php echo $order_id; ?>">
				<input type="text" value="<?php echo $extra_cost; ?>"><br>
    			<a style="cursor:pointer;" onclick="save_extra_cost(<?php echo $order_id; ?>)"><?php echo $text_save ?></a>&nbsp|&nbsp<a style="cursor: pointer;" onclick="close_extra_cost(<?php echo $order_id; ?>)"; return false;><?php echo $text_close ?></a>
				</span>     
			<?php } ?>       
            <span style="color:#F00;"><?php echo $extra_cost; ?></span>			  
			  </td>
            </tr>
          </tbody>
		</table>
<?php } ?>			  			  
            
        <?php if ($comment) { ?>
        <table class="table table-bordered">
          <thead>
            <tr>
              <td><?php echo $text_comment; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><?php echo $comment; ?></td>
            </tr>
          </tbody>
        </table>
        <?php } ?>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-comment-o"></i> <?php echo $text_history; ?></h3>
      </div>
      <div class="panel-body">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-history" data-toggle="tab"><?php echo $tab_history; ?></a></li>
          <li><a href="#tab-additional" data-toggle="tab"><?php echo $tab_additional; ?></a></li>
          <li><a href="#tab-sales-person" data-toggle="tab"><?php echo $tab_sales_person; ?></a></li>
          <?php foreach ($tabs as $tab) { ?>
          <li><a href="#tab-<?php echo $tab['code']; ?>" data-toggle="tab"><?php echo $tab['title']; ?></a></li>
          <?php } ?>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-history">
            <div id="history"></div>
            <br />
            <fieldset>
              <legend><?php echo $text_history_add; ?></legend>
              <form class="form-horizontal">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
                  <div class="col-sm-10">
                    <select name="order_status_id" id="input-order-status" class="form-control">
                      <?php foreach ($order_statuses as $order_statuses) { ?>
                      <?php if ($order_statuses['order_status_id'] == $order_status_id) { ?>
                      <option value="<?php echo $order_statuses['order_status_id']; ?>" selected="selected"><?php echo $order_statuses['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $order_statuses['order_status_id']; ?>"><?php echo $order_statuses['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-override"><span data-toggle="tooltip" title="<?php echo $help_override; ?>"><?php echo $entry_override; ?></span></label>
                  <div class="col-sm-10">
                    <input type="checkbox" name="override" value="1" id="input-override" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-notify"><?php echo $entry_notify; ?></label>
                  <div class="col-sm-10">
                    <input type="checkbox" name="notify" value="1" id="input-notify" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                  <div class="col-sm-10">
                    <textarea name="comment" rows="8" id="input-comment" class="form-control"></textarea>
                  </div>
                </div>
                <input type="hidden" value="<?=$logedin_user?>" name="username"/>
              </form>
            </fieldset>
            <div class="text-right">
              <button id="button-history" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_history_add; ?></button>
            </div>
          </div>
          <div class="tab-pane" id="tab-additional">
            <?php if ($account_custom_fields) { ?>
            <table class="table table-bordered">
              <thead>
                <tr>
                  <td colspan="2"><?php echo $text_account_custom_field; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($account_custom_fields as $custom_field) { ?>
                <tr>
                  <td><?php echo $custom_field['name']; ?></td>
                  <td><?php echo $custom_field['value']; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
            <?php } ?>
            <?php if ($payment_custom_fields) { ?>
            <table class="table table-bordered">
              <thead>
                <tr>
                  <td colspan="2"><?php echo $text_payment_custom_field; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($payment_custom_fields as $custom_field) { ?>
                <tr>
                  <td><?php echo $custom_field['name']; ?></td>
                  <td><?php echo $custom_field['value']; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
            <?php } ?>
            <?php if ($shipping_method && $shipping_custom_fields) { ?>
            <table class="table table-bordered">
              <thead>
                <tr>
                  <td colspan="2"><?php echo $text_shipping_custom_field; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($shipping_custom_fields as $custom_field) { ?>
                <tr>
                  <td><?php echo $custom_field['name']; ?></td>
                  <td><?php echo $custom_field['value']; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
            <?php } ?>
            <table class="table table-bordered">
              <thead>
                <tr>
                  <td colspan="2"><?php echo $text_browser; ?></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td><?php echo $text_ip; ?></td>
                  <td><?php echo $ip; ?></td>
                </tr>
                <?php if ($forwarded_ip) { ?>
                <tr>
                  <td><?php echo $text_forwarded_ip; ?></td>
                  <td><?php echo $forwarded_ip; ?></td>
                </tr>
                <?php } ?>
                <tr>
                  <td><?php echo $text_user_agent; ?></td>
                  <td><?php echo $user_agent; ?></td>
                </tr>
                <tr>
                  <td><?php echo $text_accept_language; ?></td>
                  <td><?php echo $accept_language; ?></td>
                </tr>
              </tbody>
            </table>
          </div>
          
          <div class="tab-pane" id="tab-sales-person">
            
            <div id="sp"></div>
            
            <form class="form-horizontal">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-sales-person"><?php echo $entry_sales_person; ?></label>
                  <div class="col-sm-10">
                    <select name="sales_person" id="input-sales-person" class="form-control">
                      <option value="*"></option>
                      <?php foreach ($sales_persons as $sp) { ?>
                      <?php if ($sp['user_id'] == $sales_person) { ?>
                      <option value="<?php echo $sp['user_id']; ?>" selected="selected"><?php echo $sp['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $sp['user_id']; ?>"><?php echo $sp['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </form>
            
            <div class="text-right">
              <button id="button-sales-person" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $btn_sales_person; ?></button>
            </div>
          </div>
          
          
          <?php foreach ($tabs as $tab) { ?>
          <div class="tab-pane" id="tab-<?php echo $tab['code']; ?>"><?php echo $tab['content']; ?></div>
          <?php } ?>
        </div>
      </div>
    </div>
  </div>
 
 <?php
 	
   // $store_url = HTTPS_CATALOG;
 
 ?> 
 
 
  <script type="text/javascript"><!--
$(document).delegate('#button-invoice', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/createinvoiceno&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#button-invoice').button('loading');
		},
		complete: function() {
			$('#button-invoice').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
if (!json['error']) {
          var adminmonitor_order_id = '<?php echo $order_id; ?>';
          var adminmonitor_event_type = 'edit';

          $.ajax({
            'url' : 'index.php?route=<?php echo $adminmonitor_module_path; ?>/log_event&order_id=' + adminmonitor_order_id + '&event_group=order&token=<?php echo $token; ?>&event_type=' + adminmonitor_event_type,
            'async' : true
          });
        }

			if (json['invoice_no']) {
				$('#invoice').html(json['invoice_no']);

				$('#button-invoice').replaceWith('<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});


function getAdditionalCostAjax(order_id){
  var html="";
  var additional_cost_val=0;
  var total_cost_val=0;
  $.ajax({
   type:"GET",
   url :"index.php?route=sale/order/getAjaxAdditionalCost&token=<?php echo $token; ?>&order_id="+order_id,
   cache:false,
   dataType:"json",
   success:function(json){
    if(json.additional_cost_text!="$0.00"){
      if(!$('#total .additional_cost').length){
          html += '<tr class="additional_cost">';
          html += '  <td class="text-right pricekey" colspan="5">Authorization for Additional cost of wire: </td>';
          html += '  <td class="text-right pricevalue">'+json.additional_cost_text+'</td>';
          html += '</tr>';
          $('.Sub-Total').before(html);
        
          additional_cost_val = $(".additional_cost .pricevalue").text().replace(json.currency_code, "");
          total_cost_val = $(".Total .pricevalue").text().replace(json.currency_code, "");

          totalvalue=  (eval(total_cost_val) + eval(additional_cost_val)).toFixed(2);

          $(".Total .pricevalue").html(json.currency_code+totalvalue);
}
        }

   }

  });
}


$(document).delegate('#button-reward-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/addreward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-reward-add').button('loading');
		},
		complete: function() {
			$('#button-reward-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
if (!json['error']) {
          var adminmonitor_order_id = '<?php echo $order_id; ?>';
          var adminmonitor_event_type = 'edit';

          $.ajax({
            'url' : 'index.php?route=<?php echo $adminmonitor_module_path; ?>/log_event&order_id=' + adminmonitor_order_id + '&event_group=order&token=<?php echo $token; ?>&event_type=' + adminmonitor_event_type,
            'async' : true
          });
        }

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-reward-add').replaceWith('<button id="button-reward-remove" data-toggle="tooltip" title="<?php echo $button_reward_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-reward-remove', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/removereward&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-reward-remove').button('loading');
		},
		complete: function() {
			$('#button-reward-remove').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
if (!json['error']) {
          var adminmonitor_order_id = '<?php echo $order_id; ?>';
          var adminmonitor_event_type = 'edit';

          $.ajax({
            'url' : 'index.php?route=<?php echo $adminmonitor_module_path; ?>/log_event&order_id=' + adminmonitor_order_id + '&event_group=order&token=<?php echo $token; ?>&event_type=' + adminmonitor_event_type,
            'async' : true
          });
        }

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-reward-remove').replaceWith('<button id="button-reward-add" data-toggle="tooltip" title="<?php echo $button_reward_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-commission-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/addcommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-commission-add').button('loading');
		},
		complete: function() {
			$('#button-commission-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
if (!json['error']) {
          var adminmonitor_order_id = '<?php echo $order_id; ?>';
          var adminmonitor_event_type = 'edit';

          $.ajax({
            'url' : 'index.php?route=<?php echo $adminmonitor_module_path; ?>/log_event&order_id=' + adminmonitor_order_id + '&event_group=order&token=<?php echo $token; ?>&event_type=' + adminmonitor_event_type,
            'async' : true
          });
        }

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-commission-add').replaceWith('<button id="button-commission-remove" data-toggle="tooltip" title="<?php echo $button_commission_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).delegate('#button-commission-remove', 'click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/removecommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>',
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			$('#button-commission-remove').button('loading');
		},
		complete: function() {
			$('#button-commission-remove').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
if (!json['error']) {
          var adminmonitor_order_id = '<?php echo $order_id; ?>';
          var adminmonitor_event_type = 'edit';

          $.ajax({
            'url' : 'index.php?route=<?php echo $adminmonitor_module_path; ?>/log_event&order_id=' + adminmonitor_order_id + '&event_group=order&token=<?php echo $token; ?>&event_type=' + adminmonitor_event_type,
            'async' : true
          });
        }

			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('#button-commission-remove').replaceWith('<button id="button-commission-add" data-toggle="tooltip" title="<?php echo $button_commission_add; ?>" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

var token = '';

// Login to the API
$.ajax({
	url: "<?php echo $store_url; ?>index.php?route=api/login",
	type: 'post',
	dataType: 'json',
	data: 'key=<?php echo $api_key; ?>',
	crossDomain: true,
	success: function(json) {
		$('.alert').remove();

        if (json['error']) {
    		if (json['error']['key']) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['key'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
    		}

            if (json['error']['ip']) {
    			$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['ip'] + ' <button type="button" id="button-ip-add" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger btn-xs pull-right"><i class="fa fa-plus"></i> <?php echo $button_ip_add; ?></button></div>');
    		}
        }

        if (json['token']) {
			token = json['token'];
		}
	},
	error: function(xhr, ajaxOptions, thrownError) {
		//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});

$(document).delegate('#button-ip-add', 'click', function() {
	$.ajax({
		url: 'index.php?route=user/api/addip&token=<?php echo $token; ?>&api_id=<?php echo $api_id; ?>',
		type: 'post',
		data: 'ip=<?php echo $api_ip; ?>',
		dataType: 'json',
		beforeSend: function() {
			$('#button-ip-add').button('loading');
		},
		complete: function() {
			$('#button-ip-add').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
if (!json['error']) {
          var adminmonitor_order_id = '<?php echo $order_id; ?>';
          var adminmonitor_event_type = 'edit';

          $.ajax({
            'url' : 'index.php?route=<?php echo $adminmonitor_module_path; ?>/log_event&order_id=' + adminmonitor_order_id + '&event_group=order&token=<?php echo $token; ?>&event_type=' + adminmonitor_event_type,
            'async' : true
          });
        }

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#history').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#history').load(this.href);
});

$('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

$('#button-history').on('click', function() {
	if (typeof verifyStatusChange == 'function'){
		if (verifyStatusChange() == false){
			return false;
		} else{
			addOrderInfo();
		}
	} else{
		addOrderInfo();
	}

	$.ajax({
		url: "<?php echo $store_url; ?>index.php?route=api/order/history&token="+token+"&order_id=<?php echo $order_id; ?>",
		type: 'post',
		dataType: 'json',
		data: 'order_status_id=' + encodeURIComponent($('select[name=\'order_status_id\']').val()) + '&notify=' + ($('input[name=\'notify\']').prop('checked') ? 1 : 0) + '&override=' + ($('input[name=\'override\']').prop('checked') ? 1 : 0) + '&append=' + ($('input[name=\'append\']').prop('checked') ? 1 : 0) + '&username=' + encodeURIComponent($('input[name=\'username\']').val()) + '&comment=' + encodeURIComponent($('textarea[name=\'comment\']').val()),
		beforeSend: function() {
			$('#button-history').button('loading');
		},
		complete: function() {
			$('#button-history').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#history').before('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
if (!json['error']) {
          var adminmonitor_order_id = '<?php echo $order_id; ?>';
          var adminmonitor_event_type = 'edit';

          $.ajax({
            'url' : 'index.php?route=<?php echo $adminmonitor_module_path; ?>/log_event&order_id=' + adminmonitor_order_id + '&event_group=order&token=<?php echo $token; ?>&event_type=' + adminmonitor_event_type,
            'async' : true
          });
        }

			if (json['success']) {
				$('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');

				$('#history').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('textarea[name=\'comment\']').val('');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			//alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#button-sales-person').on('click', function() {
	

	$.ajax({
		url: 'index.php?route=sale/order/assignsp&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&sales_person=' + encodeURIComponent($('select[name=\'sales_person\']').val()) + '&username=' + encodeURIComponent($('input[name=\'username\']').val()),
		
		dataType: 'json',			
			success: function(json) {
				$('#sp').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> Success: Order successfully assigned to sales person! <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				$('#history').load('index.php?route=sale/order/history&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>');
			}
		
		
		
	});
});



function changeStatus(){
	var status_id = $('select[name="order_status_id"]').val();

	$('#openbay-info').remove();

	$.ajax({
		url: 'index.php?route=extension/openbay/getorderinfo&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&status_id=' + status_id,
		dataType: 'html',
		success: function(html) {
			$('#history').after(html);
		}
	});
}

function addOrderInfo(){
	var status_id = $('select[name="order_status_id"]').val();

	$.ajax({
		url: 'index.php?route=extension/openbay/addorderinfo&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&status_id=' + status_id,
		type: 'post',
		dataType: 'html',
		data: $(".openbay-data").serialize()
	});
}

$(document).ready(function() {
  getAdditionalCostAjax('<?php echo $_GET["order_id"]; ?>');
	changeStatus();
});

$('select[name="order_status_id"]').change(function(){
	changeStatus();
});
//--></script>
</div>

<?php if ($prm_access_permission && $laccess) { ?>
<style type="text/css">
.ajax-edit {
   display: none;
   float: right;
   margin-right: 5px;
}
.ajax-edit input {
  width: 100px;
  height: 30px;
  padding: 6px 6px;
  font-size: 12px;
  text-align: right;
  line-height: 1.42857143;
  color: #555;
  background-color: #ffd7d7;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
       -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
          transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
.ajax-edit:focus {
  border-color: #66afe9;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
          box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
}
.ajax-edit +span {
   cursor: pointer;
}

.ajax-edit2 {
   display: none;
   float: left;
   margin-right: 5px;
}
.ajax-edit2 input {
  width: 100px;
  height: 30px;
  padding: 6px 6px;
  font-size: 12px;
  line-height: 1.42857143;
  color: #555;
  background-color: #ffd7d7;
  background-image: none;
  border: 1px solid #ccc;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
          box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
       -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
          transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
.ajax-edit2:focus {
  border-color: #66afe9;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
          box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
}
.ajax-edit2 +span {
   cursor: pointer;
}
</style>
<?php if ($modify_permission) { ?>	
<script type="text/javascript">
$(document).ready(function() {
	$('.ajax-edit').each(function(index, wrapper) {
		$(this).siblings().click(function() {
			$(wrapper).show();
			$(wrapper).siblings().hide();
		})
	});
})

function save_cost(id) {
	var input_cost = $('#cost-'+id+' input');
	var cost = $(input_cost).val();
	$(cost).css('cursor','progress');
	$.ajax({
		url: 'index.php?route=sale/order/saveCost&order_product_id='+id+'&cost='+cost+'&token=<?php echo $token; ?>',
		dataType: 'html',
		data: {},
		success: function(cost) { 
			$('#cost-'+id).next().html(cost);
			close_cost(id);
		}
	});
	$(input_cost).css('cursor','default');
}

function close_cost(id) {
	$('.ajax-edit input').blur();
	$('#cost-'+id).siblings().show();
	$('#cost-'+id).hide();
}


$(document).ready(function() {
	$('.ajax-edit2').each(function(index, wrapper) {
		$(this).siblings().click(function() {
			$(wrapper).show();
			$(wrapper).siblings().hide();
		})
	});
})

function save_payment_cost(id) {
	var input_payment_cost = $('#payment_cost-'+id+' input');
	var payment_cost = $(input_payment_cost).val();
	$(payment_cost).css('cursor','progress');
	$.ajax({
		url: 'index.php?route=sale/order/savePaymentCost&order_id='+id+'&payment_cost='+payment_cost+'&token=<?php echo $token; ?>',
		dataType: 'html',
		data: {},
		success: function(payment_cost) { 
			$('#payment_cost-'+id).next().html(payment_cost);
			close_payment_cost(id);
		}
	});
	$(input_payment_cost).css('cursor','default');
}

function close_payment_cost(id) {
	$('.ajax-edit2 input').blur();
	$('#payment_cost-'+id).siblings().show();
	$('#payment_cost-'+id).hide();
}

function save_shipping_cost(id) {
	var input_shipping_cost = $('#shipping_cost-'+id+' input');
	var shipping_cost = $(input_shipping_cost).val();
	$(shipping_cost).css('cursor','progress');
	$.ajax({
		url: 'index.php?route=sale/order/saveShippingCost&order_id='+id+'&shipping_cost='+shipping_cost+'&token=<?php echo $token; ?>',
		dataType: 'html',
		data: {},
		success: function(shipping_cost) { 
			$('#shipping_cost-'+id).next().html(shipping_cost);
			close_shipping_cost(id);
		}
	});
	$(input_shipping_cost).css('cursor','default');
}

function close_shipping_cost(id) {
	$('.ajax-edit2 input').blur();
	$('#shipping_cost-'+id).siblings().show();
	$('#shipping_cost-'+id).hide();
}

function save_extra_cost(id) {
	var input_extra_cost = $('#extra_cost-'+id+' input');
	var extra_cost = $(input_extra_cost).val();
	$(extra_cost).css('cursor','progress');
	$.ajax({
		url: 'index.php?route=sale/order/saveExtraCost&order_id='+id+'&extra_cost='+extra_cost+'&token=<?php echo $token; ?>',
		dataType: 'html',
		data: {},
		success: function(extra_cost) { 
			$('#extra_cost-'+id).next().html(extra_cost);
			close_extra_cost(id);
		}
	});
	$(input_extra_cost).css('cursor','default');
}

function close_extra_cost(id) {
	$('.ajax-edit2 input').blur();
	$('#extra_cost-'+id).siblings().show();
	$('#extra_cost-'+id).hide();
}
</script> 
<?php } ?>
<?php } ?>
            
<?php echo $footer; ?>