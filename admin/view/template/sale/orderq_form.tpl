
<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $button_back; ?></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
      <br>
      <i class="fa fa-tachometer" aria-hidden="true"></i>
      &nbsp;&nbsp; <?php echo $text_version; ?>
    </div>
  </div>
  <link type="text/css" href="view/stylesheet/product_labels/stylesheet.css" rel="stylesheet" media="screen" />

  <script type="text/javascript" src="view/javascript/product_labels/pdfobject.js"></script>
<script type="text/javascript" src="view/javascript/product_labels/product_lebel_edit.js"></script>
  <div class="container-fluid">
  <?php if(isset($error_upload)){ ?>
    <div style="color: #a94442; background-color: #f2dede; border-color: #ebccd1;padding: 10px;" class=""><?php foreach($error_upload as $error){ echo $error."<br/>";  } ?><button type="button" class="close" data-dismiss="alert">&times;</button></div>
    <?php  } ?>
    <div class="row">
      <div class="col-md-12">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-shopping-cart"></i> <?php echo $text_order_detail; ?></h3>
          </div>
          <table class="table">
            <tbody>
              <tr style="display:none;">
                <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $entry_store; ?>" class="btn btn-info btn-xs"><i class="fa fa-shopping-cart"></i> <?php echo $entry_store; ?> </button></td>
                <td>
                  <select name="store" id="input-store" class="form-control">
                    <?php foreach ($stores as $store) { ?>
                    <?php if ($store['store_id'] == $store_id) { ?>
                    <option value="<?php echo $store['href']; ?>" selected="selected"><?php echo $store['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $store['href']; ?>"><?php echo $store['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </td>
              </tr>
              <tr>
                <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $entry_store; ?>" class="btn btn-info btn-xs"><i class="fa fa-shopping-cart"></i> <?php echo $entry_store; ?> </button></td>
                <td>
                 <div class="input-group">
                  <select name="store_type" id="input-store-type" class="form-control">
                    <option value="0" <?php if ( $order_type == 0 ) { echo 'selected'; } ?>>Gempacked</option>
                    <option value="1" <?php if ( $order_type == 1 ) { echo 'selected'; } ?>>POS</option>
                    <option value="2" <?php if ( $order_type == 2 ) { echo 'selected'; } ?>>Incoming</option>
                    <option value="3" <?php if ( $order_type == 3 ) { echo 'selected'; } ?>>Backorder</option>
                  </select>
                  <?php $order_type = ( isset( $_GET['order_type'] ) && $_GET['order_type'] == 'backorder' ) ? 3 : 0; ?>
                  <input type="hidden" id="order_type" value="<?php echo $order_type; ?>">
                  <span class="input-group-btn">
                      <button type="button" id="button-change-store" data-loading-text="Loading..." class="btn btn-primary btn-success">Change Store</button>
                  </span></div>
                </td>
              </tr>
              <tr>
                <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $entry_currency; ?>" class="btn btn-info btn-xs"><i class="fa fa-usd"></i> <?php echo $entry_currency; ?> </button></td>
                <td>
                  <select name="currency" id="input-currency" class="form-control">
                    <?php foreach ($currencies as $currency) { ?>
                    <?php if ($currency['code'] == $currency_code) { ?>
                    <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </td>
              </tr>
               <?php if($order_id) { ?>
                <tr class="customer">
                <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $entry_customer; ?>" class="btn btn-info btn-xs"><i class="fa fa-user"></i> <?php echo $entry_customer; ?> </button></td>
                <td>
                  <input type="text" name="customer" value="<?php echo $customer; ?>" placeholder="<?php echo $entry_customer; ?>" id="input-customer" class="form-control" />
                  <input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
                </td>
              </tr>
               <?php } else { ?>
               <input type="hidden" id="neworder" value="">
              <tr class="customer">
                <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $entry_customer; ?>" class="btn btn-info btn-xs"><i class="fa fa-user"></i> <?php echo $entry_customer; ?> </button></td>
                <td>
                  <input type="text" name="customer" value="<?php echo $customer; ?>" placeholder="<?php echo $help_customer; ?>" id="input-customer" class="form-control" />
                  <input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
                </td>
              </tr>
              <?php } ?>
              <tr class="personaldetails" style="display:none;">
                <td><button data-toggle="tooltip" title="<?php echo $text_details; ?>" class="btn btn-info btn-xs"><i class="fa fa-user"></i> <?php echo $text_details; ?></button></td>
                <td class="pdetails"></td>
              </tr>
              <tr>
                <td></td>
               <td class="messagecomeshere"></td>
              </tr>
              <tr>
                <td style="border-top:none;"></td>
               <td class="updatecustomerdetails"  style="display:none;">
                <?php echo $text_updateded; ?>&nbsp;<button class="btn btn-info btn-xs"  id="refreshcustomer" onclick="refreshdetails();"><i class="fa fa-refresh"></i> </button> <?php echo $text_tosave; ?>
              </td>
            </tr>
              <tr>
                <td></td>
                  <td align="right">
                  <a class="btn btn-info btn-xs customerdetails" href="<?php echo $customeredit; ?>" style="display:none;" target="_blank"><?php echo $entry_updatecustomer; ?></a>
                  <button class="btn btn-info btn-xs latestorders" id="latestorders" style="display:none;"><?php echo $entry_latestorders; ?></button>
                  <a class="btn btn-info btn-xs" href="<?php echo $newcustomer; ?>" target="_blank"><?php echo $entry_addnewcustomer; ?></a>
                </td>
                </tr>
            </tbody>
          </table>
        </div>
      </div>
      
    </div>

    <div id="uploadDialogue" class="modal fade" role="dialog">
                <div class="modal-dialog">

                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">Order Images</h4>
                    </div>
                    <div class="modal-body">
                     <div id="maindiv">
                      <div id="formdiv">
                      <h2>Multiple Image Upload For Orders</h2>
                      <form enctype="multipart/form-data" action="index.php?route=sale/order/uploadOrderImages&token=<?php echo $token; ?>" method="post">
                      <p> Only JPEG,PNG,JPG,PDF and ZIP files are supported.</p>
                      <div id="filediv"><input name="file[]" type="file" id="file"/></div>
                      <input type="button" id="add_more" class="upload" value="Add More Files"/>
                      <input type="hidden" name="order_id"  value="<?php echo $order_id; ?>"/>
                      <input type="submit" value="Upload File" name="submit" id="upload" class="upload"/>
                      </form>
                  
                      </div>
                      </div>

                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                  </div>

                </div>
              </div>

              <script type="text/javascript">
                
                var abc = 0;      // Declaring and defining global increment variable.
                $(document).ready(function() {
                //  To add new input file field dynamically, on click of "Add More Files" button below function will be executed.
                $('#add_more').click(function() {
                $(this).before($("<div/>", {
                id: 'filediv'
                }).fadeIn('slow').append($("<input/>", {
                name: 'file[]',
                type: 'file',
                id: 'file'
                }), $("<br/><br/>")));
                });
                // Following function will executes on change event of file input to select different file.
                $('body').on('change', '#file', function() {
                if (this.files && this.files[0]) {
                abc += 1; // Incrementing global variable by 1.
                var z = abc - 1;
                var x = $(this).parent().find('#previewimg' + z).remove();
                $(this).before("<div id='abcd" + abc + "' class='abcd'><img id='previewimg" + abc + "' src=''/></div>");
                var reader = new FileReader();
                reader.onload = imageIsLoaded;
                reader.readAsDataURL(this.files[0]);
                $(this).hide();
                $("#abcd" + abc).append($("<img/>", {
                id: 'img',
                src: 'https://image.flaticon.com/icons/png/128/59/59836.png',
                alt: 'delete'
                }).click(function() {
                $(this).parent().parent().remove();
                }));
                }
                });
                // To Preview Image
                function imageIsLoaded(e) {
                $('#previewimg' + abc).attr('src', e.target.result);
                };
                $('#upload').click(function(e) {
                var name = $(":file").val();
                if (!name) {
                alert("First Image Must Be Selected");
                e.preventDefault();
                }
                });
                });
                  $(document).on('show.bs.modal','#viewImagesModal', function () {
                      $.ajax({
                      type:"GET",
                      url: "index.php?route=sale/order/getOrderImages&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>",
                      cache:false,
                      dataType:'json',
                      success:function(data){
                        var htmlImages="";
                        $(data.dataRows).each(function(i){
                          ispdf = data.dataRows[i].image.lastIndexOf(".pdf");
                            if (ispdf > 0){
                              htmlImages += '<div class="row"><div class="col-sm-8 col-md-offset-2"><a target="_blank" href="'+data.dataRows[i].image+'"><i class="fa fa-file-pdf-o" style="font-size:150px;color:red"></i></a></div></div>';
                            }else{
                              iszip = data.dataRows[i].image.lastIndexOf(".zip");
                            if (iszip > 0){
                              htmlImages += '<div class="row"><div class="col-sm-8 col-md-offset-2"><a target="_blank" href="'+data.dataRows[i].image+'"><i class="fa fa-file-archive-o" style="font-size:150px;color:red"></i></a></div></div>';
                            }else{
                            htmlImages += '<div class="row"><div class="col-sm-8 col-md-offset-2"><a target="_blank" href="'+data.dataRows[i].image+'"><img class="img-responsive" src="'+data.dataRows[i].image+'" width="250"></a></div></div>';
                            }
                          }
                        });
                        $("#viewImagesModal .modal-body").html(htmlImages);
                      }
                      });
                    });


              </script>
              <style type="text/css"> 
                   @import "http://fonts.googleapis.com/css?family=Droid+Sans";
                                #maindiv{
                width:960px;
                margin:10px auto;
                padding:10px;
                font-family:'Droid Sans',sans-serif
                }
                #formdiv{
                width:500px;
                float:left;
                text-align:center
                }
                
                .upload{
                background-color:red;
                border:1px solid red;
                color:#fff;
                border-radius:5px;
                padding:10px;
                text-shadow:1px 1px 0 green;
                box-shadow:2px 2px 15px rgba(0,0,0,.75)
                }
                .upload:hover{
                cursor:pointer;
                background:#c20b0b;
                border:1px solid #c20b0b;
                box-shadow:0 0 5px rgba(0,0,0,.75)
                }
                #file{
                color:green;
                padding:5px;
                border:1px dashed #123456;
                background-color:#f9ffe5
                }
                #upload{
                margin-left:45px
                }
                #noerror{
                color:green;
                text-align:left
                }
                #error{
                color:red;
                text-align:left
                }
                #img{
                width:17px;
                border:none;
                height:17px;
                margin-left:-20px;
                margin-bottom:91px
                }
                .abcd{
                text-align:center
                }
                .abcd img{
                height:100px;
                width:100px;
                padding:5px;
                border:1px solid #e8debd
                }
            </style>
<div id="viewImagesModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title">View Order Images</h4>
                    </div>
                    <div class="modal-body">
                     

                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default hidden" data-dismiss="modal">Close</button>
                    </div>
                  </div>

                </div>
              </div>
    <div class="panel panel-default productdetails">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
            
           <form id="product_labels_form" method="POST" action="index.php?route=module/product_labels/labels_orders&token=<?php echo $token; ?>" target="_blank"  class="form-horizontal">
          <div class="tab-content">
              <div class="table-responsive">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <td width="2%;"></td>
                      <td class="text-left"><?php echo $column_image; ?></td>
                      <td class="text-left"><?php echo $column_product; ?></td>
                      <td class="text-left"><?php echo $column_model; ?></td>
                      <td class="text-right" width="6%;"><?php echo $column_quantity; ?></td>
                      <td class="text-right" width="15%;"><?php echo 'Quantity Shipped'; ?></td>
                      <td class="text-right"><?php echo $column_price; ?></td>
                      <td class="text-right"><?php echo $column_total; ?></td>
                      <td><?php echo $column_action; ?></td>
                    </tr>
                  </thead>
                  <tbody id="cart">
                    <?php $proids=array(); if ($order_products || $order_vouchers) { ?>
                    <?php $product_row = 0; ?>
                    <input type="hidden" name="refreshproducts" value="0" />
                    <?php foreach ($order_products as $order_product) { ?>
                    <tr>
                      <td><?php echo $order_product['order_item_sort_order'];  ?></td>
                      <td class="text-left">
                      <img src="<?php echo $order_product['image']; ?>" alt="<?php echo $order_product['name']; ?>" class="img-thumbnail" /></td>
                      <td class="text-left"><?php echo $order_product['name']; ?><br />
                        <input type="hidden" name="product[<?php echo $product_row; ?>][product_id]" value="<?php echo $order_product['product_id']; ?>" />
                        <?php foreach ($order_product['option'] as $option) { ?>
                        - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                        <?php if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'image') { ?>
                        <input type="hidden" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['product_option_value_id']; ?>" />
                        <?php } ?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                        <input type="hidden" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option['product_option_value_id']; ?>" />
                        <?php } ?>
                        <?php if ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') { ?>
                        <input type="hidden" name="product[<?php echo $product_row; ?>][option][<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" />
                        <?php } ?>
                        <?php } ?></td>
                      <td class="text-left"><?php echo $order_product['model']; ?></td>
                      <td class="text-right"><?php echo $order_product['quantity']; ?>
                      <?php 
                      			
                      	
                                 		$quantity_supplied = $order_product['quantity_supplied']; 
                                ?>
                        <input type="hidden" name="product[<?php echo $product_row; ?>][quantity]" value="<?php echo $order_product['quantity']; ?>" />
                      	 <input type="hidden" name="product[<?php echo $product_row; ?>][quantity_supplied]" value="<?php echo $quantity_supplied;?>" />
                         <input type="hidden" name="product[<?php echo $product_row; ?>][unit_conversion_values]" value="<?php echo $order_product['unit_conversion_values']; ?>" />
                      </td>
                      <td class="text-right"></td>
                      <td class="text-right">
                      <?php 
                      		if( !empty($order_product['unit_conversion_values']) && $order_product['convert_price'] > 1 )
                            {
                            	$product_total_price = $order_product['quantity'] * floatval($order_product['price']);
                                $product_total_qty = $order_product['quantity'] * $order_product['convert_price'];
                                $order_product['price'] = number_format((float)$product_total_price/$product_total_qty, 2, '.', '');
                            } 
                       ?>
                      <input type="hidden" name="product[<?php echo $product_row; ?>][price]" value="<?php echo $order_product['price']; ?>" /></td>
                      <td class="text-center"></td>
                    </tr>
                    <?php $product_row++; ?>
                      <?php $proids[]=$order_product['product_id']; ?>
                    <?php } ?>
                    <?php $voucher_row = 0; ?>
                    <?php foreach ($order_vouchers as $order_voucher) { ?>
                    <tr>
                      <td class="text-left"><?php echo $order_voucher['description']; ?>
                        <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][voucher_id]" value="<?php echo $order_voucher['voucher_id']; ?>" />
                        <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][description]" value="<?php echo $order_voucher['description']; ?>" />
                        <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][code]" value="<?php echo $order_voucher['code']; ?>" />
                        <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][from_name]" value="<?php echo $order_voucher['from_name']; ?>" />
                        <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][from_email]" value="<?php echo $order_voucher['from_email']; ?>" />
                        <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][to_name]" value="<?php echo $order_voucher['to_name']; ?>" />
                        <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][to_email]" value="<?php echo $order_voucher['to_email']; ?>" />
                        <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][voucher_theme_id]" value="<?php echo $order_voucher['voucher_theme_id']; ?>" />
                        <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][message]" value="<?php echo $order_voucher['message']; ?>" />
                        <input type="hidden" name="voucher[<?php echo $voucher_row; ?>][amount]" value="<?php echo $order_voucher['amount']; ?>" /></td>
                      <td class="text-left"></td>
                      <td class="text-right">1</td>
                      <td class="text-right"></td>
                      <td class="text-right"></td>
                      <td class="text-center"></td>
                    </tr>

                    <?php $voucher_row++; ?>
                    <?php } ?>
                    <?php } else { ?>
                    <tr>
                      <td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
                    </tr>
                  </tbody>
                  <?php } ?>
                  <tbody id="total">
                     <?php if ($order_products || $order_vouchers) { ?>
                    <tr>
                      <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                  <tbody id="return-total">
                    <?php if(!empty($rma_details['rma']) && ($rma_details['refund_approved'] > 0)) { ?>

                    <input type="hidden" id="rma_id" value="<?php echo $rma_details['rma']['id']; ?>">
                    <input type="hidden" id="order_id" value="<?php echo $order_id; ?>">
                    <tr>
                      <td class="text-right pricekey" colspan="7">Return Total</td>
                      <td class="text-right pricevalue">
                        <div class="input-group">
                          <span class="input-group-btn">
                            <button class="btn btn-info" id="input-update-return" title="Update Return Total" type="button"><i class="fa fa-refresh"></i></button>
                          </span>
                          
                          <input type="text" style="text-align: right;" class="form-control" name="return_total" id="return_total" value="<?php echo $rma_details['refund_approved']; ?>">
                          
                        </div><!-- /input-group --></td>
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

    var row=0;
    var nlabels = 0;
    var token = '<?php echo $token ?>';
    var scale=1;
    var options_list = new Array();
    var label_active = new Array();
    var blanks = new Array();

    //options_list[<?php /*echo $product_options['product_option_id'] ?>] = ['<?php echo join('\',\'',array_map(function($element){return $element['name'];}, $product_options['product_option_value'])) */?>'];


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

                  <!-- Product Labels data -->
                  <input type="hidden" id="prolab_orderid" name="orderid" value="<?php echo $order_id; ?>">
                  <input type="hidden" id="prolab_orderids" name="orderids" value="1">
                  <input type="hidden" id="prolab_sample" name="sample" value="0">
                  <input type="hidden" id="prolab_blanks" name="blanks" value="">
                  <input type="hidden" id="prolab_templateid" name="templateid" value="">
                  <input type="hidden" id="prolab_labelid" name="labelid" value="">
                  <input type="hidden" id="prolab_orientation" name="orientation" value="p">
                  <input type="hidden" id="prolab_proids" name="productid" value="<?php echo implode(',',$proids); ?>">
                  <!-- Product Labels data -->
                  
                  
                <div class="text-right">
                  <button type="button" id="simpleInvoice" class="btn btn-success btn-sm">Simple Invoice</button>
                  <button type="button" id="viewImages" data-toggle="modal" data-target="#viewImagesModal" class="btn btn-success btn-sm">View Images</button>
                  <button type="button" data-toggle="modal" data-target="#uploadDialogue" class="btn btn-success btn-sm">Upload Images</button>
                  <button type="button" id="UpdateProducts" class="btn btn-success btn-sm">Update Products</button>
                  <button type="button" id="RefreshCart" class="btn btn-success btn-sm">Refresh Products</button>
                  <button type="button" id="saveAllCart" class="btn btn-success btn-sm" style="display:none;">Save Products</button>
                  <button type="button" id="UpdateShipping" class="btn btn-success btn-sm">Save Products</button> 
                  <button type="button" class="btn btn-info btn-sm" data-toggle="modal" id="addproductsid" data-target="#addproducts"><?php echo $entry_addproducts; ?></button>
                  
                  <!--<button class="btn btn-info btn-sm" type="button" id="pl_submit_button" onclick="pl_submit_form();"> Print All Labels </button>-->

                  <button type="button" class="btn btn-info btn-sm hidden" data-toggle="modal" id="addvoucherid" data-target="#addvoucher"><?php echo $entry_addvoucher; ?></button>
                </div>
              </div>
              <div class="tab-content">
                <div id="addproducts" class="modal fade" role="dialog">
                  <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><?php echo $entry_addproducts; ?></h4>
                      </div>
                      <div class="modal-body">
                        <fieldset>
                            <legend><?php echo $text_product; ?></legend>
                            <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
                              <div class="col-sm-10">
                                <input type="text" name="product" placeholder="<?php echo $entry_filterby; ?>" value="" id="input-product" class="form-control" />
                                <input type="hidden" name="product_id" value="" />
                                <input type="hidden" name="sku" value="" />
                              </div>
                            </div>
                             <div id="product_image"></div>
                            <div id="product-details">
                            	
                                <div id="product-data-info">
                                	<div id="product-model"></div>
                                	<div id="product-price"></div>
                                </div>
                            </div>
                            <div id="option"></div>
                            <div class="form-group">
                              <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
                              <div class="col-sm-10">
                                <input type="text" name="quantity" value="1" id="input-quantity" class="form-control" />
                              </div>
                            </div>
                            <div id="unit-options"></div>
                          </fieldset>
                          <div class="text-right">
                            <button type="button" id="button-product-add" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_product_add; ?></button>
                          </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_cancel; ?></button>
                      </div>
                    </div>

                  </div>
                </div>
                <div id="vieworders" class="modal fade" role="dialog">
                  <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><?php echo $text_previous_orders; ?></h4>
                      </div>
                      <div class="modal-body">
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_cancel; ?></button>
                      </div>
                    </div>

                  </div>
                </div>
                <div id="addvoucher" class="modal fade" role="dialog">
                  <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><?php echo $entry_addvoucher; ?></h4>
                      </div>
                      <div class="modal-body">
                       <fieldset>
                          <legend><?php echo $text_voucher; ?></legend>
                          <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-to-name"><?php echo $entry_to_name; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="to_name" value="" id="input-to-name" class="form-control" />
                            </div>
                          </div>
                          <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-to-email"><?php echo $entry_to_email; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="to_email" value="" id="input-to-email" class="form-control" />
                            </div>
                          </div>
                          <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-from-name"><?php echo $entry_from_name; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="from_name" value="" id="input-from-name" class="form-control" />
                            </div>
                          </div>
                          <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-from-email"><?php echo $entry_from_email; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="from_email" value="" id="input-from-email" class="form-control" />
                            </div>
                          </div>
                          <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-theme"><?php echo $entry_theme; ?></label>
                            <div class="col-sm-10">
                              <select name="voucher_theme_id" id="input-theme" class="form-control">
                                <?php foreach ($voucher_themes as $voucher_theme) { ?>
                                <option value="<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></option>
                                <?php } ?>
                              </select>
                            </div>
                          </div>
                          <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-message"><?php echo $entry_message; ?></label>
                            <div class="col-sm-10">
                              <textarea name="message" rows="5" id="input-message" class="form-control"></textarea>
                            </div>
                          </div>
                          <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-amount"><?php echo $entry_amount; ?></label>
                            <div class="col-sm-10">
                              <input type="text" name="amount" value="<?php echo $voucher_min; ?>" id="input-amount" class="form-control" />
                            </div>
                          </div>
                        </fieldset>
                        <div class="text-right">
                          <button type="button" id="button-voucher-add" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_voucher_add; ?></button>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                      </div>
                    </div>

                  </div>
                </div>
              </div>
              <br />
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
                                      <form id="paypal_admintool_payment_method">
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
            <fieldset>
              <legend><?php echo $text_address_detail; ?></legend>
              <div class="addressdetails">
                <table class="table">
                  <?php if($order_id) { ?>
                   <tr class="orderaddresspayment">
                    <td style="width: 1%;"><?php echo $text_payment_address; ?></td>
                    <td>
                       <?php echo $payment_address = $payment_firstname . ' ' . $payment_lastname . ', ' . $payment_address_1 . ', ' . $payment_city . ', ' . $payment_postcode. ', ' . $payment_country; ?>

                      <?php foreach ($payment_custom_fields as $custom_field) { ?>
                        ,&nbsp;<?php echo $custom_field['name']; ?>: <?php echo $custom_field['value']; ?>
                        <?php } ?>
                    </td>
                  </tr>
                  <?php if($shipping_method) { ?>
                  <tr class="orderaddressshipping">
                    <td style="width: 1%;"><?php echo $text_shipping_address; ?></td>
                    <td>
                       <?php echo $shipping_address = $shipping_firstname.' '.$shipping_lastname.', '.$shipping_address_1.', '.$shipping_city.', '.$shipping_postcode.', '.$shipping_country; ?>
                      <?php foreach ($shipping_custom_fields as $custom_field) { ?>
                        ,&nbsp;<?php echo $custom_field['name']; ?>: <?php echo $custom_field['value']; ?>
                        <?php } ?>
                    </td>
                  </tr>
                  <?php } ?>
                  <?php } ?>
                  <tr class="paymentaddress">
                    <td style="width: 15%;"><span data-toggle="tooltip" title="<?php echo $entry_address; ?>" class="btn btn-info btn-xs"><i class="fa fa-home"></i> <?php echo $entry_payment_address; ?></span></td>
                    <td>
                      <select name="payment_address" id="input-payment-address" class="form-control">
                          <option value="0"><?php echo $text_none; ?></option>
                          <?php foreach ($addresses as $address) { ?>
                          	<?php $addresses_payment = $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', '. $address['postcode'] . ', ' . $address['country']; ?>
                          	<?php if($payment_address == $addresses_payment){?>
                          		<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', '. $address['postcode'] . ', ' . $address['country']; ?></option>
                          	<?php }else{?>
                            		<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', '. $address['postcode'] . ', ' . $address['country']; ?></option>
                            
                            <?php }?>
                          <?php } ?>
                        </select>
                    </td>
                    <td style="width: 10%;"><span data-toggle="tooltip" title="<?php echo $text_edit_address; ?>" class="btn btn-info btn-xs" onclick="addressdetailspopup(1);"><i class="fa fa-edit"></i> <?php echo $text_edit_address; ?></span></td>
                  </tr>
                  <tr class="shippingaddress">
                    <td style="width: 15%;"><span data-toggle="tooltip" title="<?php echo $entry_address; ?>" class="btn btn-info btn-xs"><i class="fa fa-home"></i> <?php echo $entry_shipping_address; ?></span></td>
                    <td>
                      <select name="shipping_address" id="input-shipping-address" class="form-control">
                          <option value="0"><?php echo $text_none; ?></option>
                          <?php foreach ($addresses as $address) { ?>
                          	<?php $addresses_shipping = $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', '. $address['postcode'] . ', ' . $address['country']; ?>
                            	<?php if($shipping_address == $addresses_shipping){?>
                          				<option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', '. $address['postcode'] . ', ' . $address['country']; ?></option>
                          		<?php }else{?>
                                	<option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', '. $address['postcode'] . ', ' . $address['country']; ?></option>
                                
                                <?php }?>
                          <?php } ?>
                        </select>
                    </td>
                    <td style="width: 10%;"><span data-toggle="tooltip" title="<?php echo $text_edit_address; ?>" class="btn btn-info btn-xs" onclick="addressdetailspopup(0);"><i class="fa fa-edit"></i> <?php echo $text_edit_address; ?></span></td>
                  </tr>
                  <tr class="noaddressfound" style="display:none;">
                     <td style="width: 1%;"><button data-toggle="tooltip" title="<?php echo $entry_add_address; ?>" class="btn btn-danger btn-xs"><i class="fa fa-plus-square"></i> <?php echo $entry_add_address; ?></button></td>
                    <td>
                      <?php echo $noaddress_1; ?><a href="" class="addaddress" target="_blank">Click here</a> <?php echo $noaddress_2; ?>
                    </td>
                  </tr>
                </table>
                <div id="addressedit" class="modal fade" role="dialog">
                  <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><?php echo $text_address_detail ?></h4>
                      </div>
                      <div class="modal-body">
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-success" id="saveaddress"><?php echo $button_save; ?></button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><?php echo $button_cancel; ?></button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="personaldetails_success"  style="display:none;">

                <div class="text-success2"><i class="fa fa-check-circle"></i> <?php echo $text_personaldetails_success; ?> </div>
              </div>
              <div class="paymentaddress_success"  style="display:none;">
              </div>
               <div class="shippingaddress_success"  style="display:none;">
              </div>
              <div class="shippingmethod_success"  style="display:none;">
              </div>
              <div class="paymentmethod_success"  style="display:none;">
              </div>
              <div class="addressmessages"  style="display:none;">
              </div>
              <br>
            </fieldset>
            <?php if($customtotalstatus) { ?>
             <fieldset>
            <legend><?php echo $text_customtotal; ?></legend>
              <div class="col-sm-4">
                    <div class="table-responsive">
                      <table class="table table-bordered">
                        <thead>
                          <tr>
                            <td class="text-left"><?php echo $text_customfee; ?></td>
                            <td class="text-left"><?php echo $text_customtaxes; ?></td>
                            <td class="text-left"><?php echo $text_customamount; ?></td>
                          </tr>
                        </thead>
                        <tbody id="customtotal">
                            <?php foreach ($customtotal as $key => $value) { ?>
                              <tr>
                              <td><input type="text" class="form-control" name="customtotal[<?php echo $key ?>][name]" value="<?php echo $value['name']; ?>" ></td>
                              <td>
                                <select name="customtotal[<?php echo $key ?>][tax_class_id]" id="input-tax-class" class="form-control">
                                  <option value="0">--None--</option>
                                  <?php foreach ($customttotal_tax_classes as $tax_class) { ?>
                                  <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                                  <?php } ?>
                                </select>
                              </td>
                              <td><input type="text" class="form-control" name="customtotal[<?php echo $key ?>][amount]" value="<?php echo $value['amount']; ?>" ></td>
                              </tr>
                            <?php } ?>
                        </tbody>
                      </table>
                    </div>
                    <div class="pull-right">
                      <button type="button" id="button-savecustomtotal" data-toggle="tooltip" title="<?php echo $button_save; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                    </div>
                  </div>
                  <div class="col-sm-8">
                    <div class="col-sm-6">
                      <div class="table-responsive">
                        <table class="table table-bordered">
                          <thead>
                            <tr>
                              <td class="text-left"><i class="fa fa-truck" aria-hidden="true"></i> <?php echo $text_customshipping; ?></td>
                              <td class="text-left"><?php echo $text_customtaxes; ?></td>
                              <td class="text-left"><?php echo $text_customamount; ?></td>
                            </tr>
                          </thead>
                          <tbody id="customtotal_shipping">
                            <tr>
                                <td><input type="text" class="form-control" name="customtotal_shipping[name]" value="<?php echo $shipping_method_name; ?>" id="shippingname"></td>
                                <td>
                                  <select name="customtotal_shipping[tax_class_id]" id="input-tax-class" class="form-control">
                                    <option value="0">--None--</option>
                                    <?php foreach ($customttotal_tax_classes as $tax_class) { ?>
                                    <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                                    <?php } ?>
                                  </select>
                                </td>
                                <td><input type="text" class="form-control" name="customtotal_shipping[amount]" value="<?php echo $shipping_method_cost; ?>" ></td>
                            </tr>
                          </tbody>
                        </table>
                        <div class="pull-right">
                        <button type="button" id="button-savecustomshipping" data-toggle="tooltip" title="<?php echo $button_save; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                        <button type="button" onclick="$('#shippingname').val('');$('#button-savecustomshipping').trigger('click');" data-toggle="tooltip" title="<?php echo $button_removecustomshipping; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><i class="fa fa-remove"></i></button>
                      </div>
                      </div>
                      </div>
                      <div class="col-sm-6">
                      <div class="table-responsive">
                        <table class="table table-bordered">
                          <thead>
                            <tr>
                              <td class="text-left"><i class="fa fa-credit-card" aria-hidden="true"></i> <?php echo $text_custompayment; ?></td>
                              <td class="text-left"><?php echo $text_customamount; ?></td>
                            </tr>
                          </thead>
                          <tbody id="customtotal_payment">
                            <tr>
                              <td><input type="text" class="form-control" name="customtotal_payment[name]" value="<?php echo $payment_method_name; ?>" id="paymentname"></td>
                              <td><input type="text" class="form-control" name="customtotal_payment[amount]" value="<?php echo $payment_method_cost; ?>" ></td>
                            </tr>
                          </tbody>
                        </table>
                        <div class="pull-right">
                        <button type="button" id="button-savecustompayment" data-toggle="tooltip" title="<?php echo $button_save; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                        <button type="button" onclick="$('#paymentname').val('');$('#button-savecustompayment').trigger('click');" data-toggle="tooltip" title="<?php echo $button_removecustompayment; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><i class="fa fa-remove"></i></button>
                      </div>
                      </div>
                      </div>
                  </div>
                </fieldset>
                <?php } ?>
            <fieldset>
                <legend><?php echo $text_more_detail; ?></legend>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-shipping-method"><?php echo $entry_shipping_method; ?></label>
                  <div class="col-sm-10">
                      <select name="shipping_method" id="input-shipping-method" class="form-control">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php if ($shipping_code) { ?>
                        <option value="<?php echo $shipping_code; ?>" selected="selected"><?php echo $shipping_method; ?></option>
                        <?php } ?>
                      </select>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-payment-method"><?php echo $entry_payment_method; ?></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <select name="payment_method" id="input-payment-method" class="form-control">
                        <option value=""><?php echo $text_select; ?></option>
                        <?php if ($payment_code) { ?>
                        <option value="<?php echo $payment_code; ?>" selected="selected"><?php echo $payment_method; ?></option>
                        <?php } ?>
                      </select>
                      <span class="input-group-btn">
                      <button type="button" id="button-payment-method" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_apply; ?></button>
                      </span></div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-coupon"><?php echo $entry_coupon; ?></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <input type="text" name="coupon" value="<?php echo $coupon; ?>" id="input-coupon" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_apply; ?></button>
                      </span></div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-voucher"><?php echo $entry_voucher; ?></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <input type="text" name="voucher" value="<?php echo $voucher; ?>" id="input-voucher" data-loading-text="<?php echo $text_loading; ?>" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" id="button-voucher" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_apply; ?></button>
                      </span></div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-reward"><?php echo $entry_reward; ?></label>
                  <div class="col-sm-10">
                    <div class="input-group">
                      <input type="text" name="reward" value="<?php echo $reward; ?>" id="input-reward" data-loading-text="<?php echo $text_loading; ?>" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" id="button-reward" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_apply; ?></button>
                      </span></div>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
                  <div class="col-sm-10">
                    <select name="order_status_id" id="input-order-status" class="form-control">
                      <?php foreach ($order_statuses as $order_status) { ?>
                      <?php if ($order_status['order_status_id'] == $order_status_id) { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                  <input type="hidden" name="order_id" id="order_id" value="<?php echo $order_id; ?>" />
                </div>
                <div class="form-group">
                <label class="col-sm-2 control-label" for="input-notify"><?php echo $text_notify; ?></label>
                <div class="col-sm-10">
                  <select name="notify-orderentry" id="input-notify" class="form-control">
                    <option value="1"><?php echo $text_yes; ?></option>
                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  </select>
                </div>
              </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
                  <div class="col-sm-10">
                    <textarea name="comment" rows="5" id="input-comment" class="form-control"><?php echo $comment; ?></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-affiliate"><?php echo $entry_affiliate; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="affiliate" value="<?php echo $affiliate; ?>" id="input-affiliate" class="form-control" />
                    <input type="hidden" name="affiliate_id" value="<?php echo $affiliate_id; ?>" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-additionalemail"><?php echo $entry_additionalemail; ?></label>
                  <div class="col-sm-10">
                    <textarea name="additionalemail" id="input-additionalemail" class="form-control" placeholder="<?php echo $help_additionalemail; ?>" /></textarea>
                  </div>
                </div>
              </fieldset>
              <div class="row">
                <div class="col-sm-6 text-left">
                </div>
                <div class="col-sm-6 text-right">
                  <button type="button" id="button-refresh" data-toggle="tooltip" title="<?php echo $button_refresh; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-warning"><i class="fa fa-refresh"></i></button>
                  <button type="button" class="btn btn-primary button-save"><i class="fa fa-check-circle"></i> <?php echo $button_save; ?></button>
                  <button type="button" id="button-save" class="btn btn-primary hidden"><i class="fa fa-check-circle"></i> <?php echo $button_save; ?></button>
                </div>
              </div>
          </form>
          </div>
        </div>
      </div>
    </div>

   <!-- Trigger the modal with a button -->
<button type="button" id="invoke_update_stock" class="btn btn-info btn-lg hidden" data-toggle="modal" data-target="#updateStock"></button>

<!-- Modal -->
<div id="updateStock" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content form-horizontal">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Stock Manager : Update Stock </h4>
      </div>
      <div class="modal-body">

        <div class="row" id="product_stock_data">
          
        </div>

       <div class="form-group">
         <label class="control-label col-sm-2">In Stock</label>
         <div class="col-sm-5">
           <input type="radio" name="instock" checked="checked" value="1" id="instock" > Yes 
         </div>
         <div class="col-sm-5">
           <input type="radio" name="instock" id="outstock" value="0"> No 
         </div>
       </div>

       <div class="row" id="product_stock_data_html">
          
        </div>

       <div id="appendStorageHtml"></div>
       <div class="form-group">
         <label class="control-label col-sm-2">Total Instock</label>
         <div class="col-sm-10">
          <input type="text" name="total_instock" value="" class="form-control" placeholder="Total Instock">
         </div>
       </div>
       <div class="form-group">
        <div class="col-sm-2 col-md-offset-2">
         <button type="button" id="addStorageLocation" class="btn btn-info" data-counter="0"><i class="fa fa-plus"> &nbsp;Add Location</i></button>
       </div>
       </div>
       <input type="text" class="hidden" id="productid" name="product_id" value="">
       <div class="form-group">
        <div class="col-sm-10">
         <button type="button" id="button_update_popup" class="btn btn-success" name="sub_popup"><i class="fa fa-refresh"></i> &nbsp;Update Stock</button>
       </div>
       </div>
       <div class="row" id="product_incoming_order_history_html">  
       </div>
       <div class="form-group">
        <div class="col-sm-10">
         <input type="hidden" id="current_popup_product_id" value="">
         <button type="button" class="btn btn-primary" id="add_to_incoming_order">Add to Incoming Order</button>
         <button type="button" class="btn btn-success" id="create_backorder">Create Backorder</button>
        </div>
       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>


<!-- Print Label Modal -->
<div class="modal fade" id="printModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Product Label</h4>
      </div>
      <div class="modal-body">
        <!--  Label Code -->
        <div class="row">
							<div class="col-sm-7">
								<legend><?php echo $text_template_settings; ?></legend>
							</div>
							<div class="col-sm-5">
								<legend><?php echo $text_preview; ?></legend>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-7">
								<div class="row">
									<div class="form-group form-group-sm">
										<label class="col-sm-4 control-label text-right" for="template"><?php echo $text_select_label; ?></label>
										<div class="col-sm-8">
											<select id="popupprolabel" name="select_label" class="select_label form-control" style="margin-bottom:10px;">
												<option value=""><?php echo $text_option_new_label; ?></option>
												<?php $name_i = 1; ?>
												<?php foreach($labels as $id => $label_name) { ?>
												<?php 	if(empty($label_name)) { ?>
												<?php 		$label_name="Label_".$name_i; ?>
												<?php 		$name_i++; ?>
												<?php 	} ?>
												<option value="<?php echo $id ?>" <?php if($settings['product_labels_default_label'] == $id) echo " selected" ?>><?php echo $label_name; ?></option>
												<?php } ?>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12" class="form-group form-group-sm">
										<form id="edit_label_form" class="form-horizontal">
										<input type="hidden" name="route" value="module/product_labels/labels">
										<input type="hidden" name="token" value="<?php echo $token ?>">
										<input type="hidden" name="sample" value="1">
										<input type="hidden" name="edit" value="1">
										<input type="hidden" name="labelid" value="">
										<div id="form_elements">
										<?php foreach(array("rect","img","text","barcode") as $element_type) { ?>
											<div class="well" style="padding:5px;"> <div class="row">
												<div class="col-sm-12">
													<legend style="margin-bottom:2px;"><?php echo ${'text_'.$element_type} ?></legend>
												</div>
											</div>
											<div class="col-xs-12">
												<div class="row" id="element_test">
													<div class="col-xs-2 col-lg-2 oc2-pl-label-input-header"><p><?php echo $text_add; ?></p></div>
													<div class="col-xs-2 col-lg-2 oc2-pl-label-input-header <?php //echo ControllerModuleProductLabels::toggle($element_type,0) ?>"><p data-toggle="tooltip" data-original-title="<?php echo $text_tip_font_f; ?>"><?php echo $text_font_f; ?></p></div>
													<div class="col-xs-1 col-lg-1 oc2-pl-label-input-header <?php //echo ControllerModuleProductLabels::toggle($element_type,0) ?>"><p data-toggle="tooltip" data-original-title="<?php echo $text_tip_font_s; ?>"><?php echo $text_font_s; ?></p></div>
													<div class="col-xs-1 col-lg-1 oc2-pl-label-input-header <?php //echo ControllerModuleProductLabels::toggle($element_type,9) ?>"><p data-toggle="tooltip" data-original-title="<?php echo $text_tip_font_a; ?>"><?php echo $text_font_a; ?></p></div>
													<div class="col-xs-3 col-lg-3 oc2-pl-label-input-header <?php //echo ControllerModuleProductLabels::toggle($element_type,1) ?>"><p data-toggle="tooltip" data-original-title="<?php echo $text_tip_text; ?>"><?php echo $text_text; ?></p></div>
													<div class="col-xs-5 col-lg-5 oc2-pl-label-input-header <?php //echo ControllerModuleProductLabels::toggle($element_type,2) ?>"><p data-toggle="tooltip" data-original-title="<?php echo $text_tip_img; ?>"><?php echo $text_img; ?></p></div>
													<div class="col-xs-1 col-lg-1 oc2-pl-label-input-header "><p data-toggle="tooltip" data-original-title="<?php echo $text_tip_xpos; ?>"><?php echo $text_xpos; ?></p></div>
													<div class="col-xs-1 col-lg-1 oc2-pl-label-input-header "><p data-toggle="tooltip" data-original-title="<?php echo $text_tip_ypos; ?>"><?php echo $text_ypos; ?></p></div>
													<div class="col-xs-1 col-lg-1 oc2-pl-label-input-header <?php //echo ControllerModuleProductLabels::toggle($element_type,5) ?>"><p data-toggle="tooltip" data-original-title="<?php echo $text_tip_width; ?>"><?php echo $text_width; ?></p></div>
													<div class="col-xs-1 col-lg-1 oc2-pl-label-input-header <?php //echo ControllerModuleProductLabels::toggle($element_type,6) ?>"><p data-toggle="tooltip" data-original-title="<?php echo $text_tip_height; ?>"><?php echo $text_height; ?></p></div>
													<div class="col-xs-1 col-lg-1 oc2-pl-label-input-header <?php //echo ControllerModuleProductLabels::toggle($element_type,7) ?>"><p data-toggle="tooltip" data-original-title="<?php echo $text_tip_color; ?>"><?php echo $text_color; ?></p></div>
													<div class="col-xs-1 col-lg-1 oc2-pl-label-input-header <?php //echo ControllerModuleProductLabels::toggle($element_type,8) ?>"><p data-toggle="tooltip" data-original-title="<?php echo $text_tip_fill; ?>"><?php echo $text_fill; ?></p></div>
												</div>
											</div>
											<!-- labels here -->
											<div class="row" id="tfoot_<?php echo $element_type ?>">
												<div class="col-sm-12">
													<button type="button" class="btn btn-default btn-xs" style="margin-bottom:2px;margin-top:10px;" onclick="add_label_element('<?php echo $element_type ?>');return false;"><?php echo $text_addnew; ?> <b><?php echo ${'text_'.$element_type} ?></b></button>
												</div>
											</div> </div>
										<?php } ?>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="form-group form-group-sm">
										<div class="col-sm-6">
											<button type="button" id="deletebutton_label" onclick="delete_label();" class="btn btn-sm btn-primary" style="visibility:hidden;"><i class="fa fa-times"></i> <?php echo $button_delete; ?></button>
											<button type="button" id="savebutton_label" onclick="save_label();" class="btn btn-sm btn-primary" style="visibility:hidden;"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
										</div>
										<div class="col-sm-6">
											<div class="input-group input-group-sm">
												<span class="input-group-btn">
	        										<button type="button" id="saveasbutton_label" onclick="pl_saveas_label();" class="btn btn-primary"><?php echo $button_saveas; ?></button>
	      										</span>
	      										<input type="text" name="saveas_label_name" class="form-control" value="">
											</div>
										</div>
									</div>
								</div>
								</form>
							</div>
							<div class="col-sm-5">
								<div class="row">
									<div class="form-group form-group-sm">
										<div class="col-sm-2">
											<button type="button" onclick="preview_label();return false;" id="previewbutton_label" class="btn btn-sm btn-primary"><?php echo $button_preview; ?></button>
										</div>
										<div class="col-sm-6">
											<select name="templateid" id="popupprotemplateid" class="select_template form-control">
											<?php foreach($label_templates as $id => $label_template) { ?>
												<option value="<?php echo $id ?>" <?php if($settings['product_labels_default_template'] == $id) echo " selected" ?>><?php echo $label_template; ?></option>
											<?php } ?>
											</select>
										</div>
										<div class="col-sm-4">
											<select name="orientation" class="form-control" id="popupproorientation">
												<option value="P" <?php if($settings['product_labels_default_orientation'] == "P") echo " selected" ?>><?php echo $text_portrait; ?></option>
												<option value="L" <?php if($settings['product_labels_default_orientation'] == "L") echo " selected" ?>><?php echo $text_landscape; ?></option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<div id="preview_pdf_label" style="width:100%;height:350px;margin-top:10px;"></div>
										<div id="debug"></div>
									</div>
								</div>
							</div>
						</div>
        <!-- Label Code -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary popupprintonelabel">Print Label</button>
        <button type="button" class="btn btn-primary popupprintalllabel">Print All Label</button>
      </div>
    </div>
  </div>
</div>
<!-- Print Label Modal -->



  <script type="text/javascript"><!--

  $("#addStorageLocation").click(function(){
    var htmlStorage="";

    var counters=$("#addStorageLocation").attr('data-counter');

    htmlStorage +='<div id="main_storge'+counters+'"><div class="form-group">';
    htmlStorage +='   <label class="col-sm-2 control-label">Quantity </label>';
    htmlStorage +='<div class="col-sm-10">';
    htmlStorage +=' <input type="text" name="locations['+counters+'][location_quantity]" placeholder="Quantity" id="quantity_up'+counters+'" value="" class="form-control">';
    htmlStorage +='</div>';
    htmlStorage +='</div>';

    htmlStorage +='<div class="form-group">';
    htmlStorage +=' <label class="col-sm-2 control-label">Location</label>'; 
    htmlStorage +='   <div class="col-sm-10">'; 
    htmlStorage +='    <input type="text" name="locations['+counters+'][location_name]" id="location_popup'+counters+'" value="" class="form-control">'; 
    htmlStorage +='   </div>'; 
    htmlStorage +=' </div>';
    htmlStorage += '<div class="col-sm-12 pull-right"><button onclick="removeRow('+counters+');" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></div></div>';

    $("#appendStorageHtml").append(htmlStorage);
counters++;
    $("#addStorageLocation").attr('data-counter',counters);

});
function removeRow(row){
$("#main_storge"+row).remove();
}


var nocallagain;
var shouldirefresh;
var prevcsid = 0;
var customshipping = 0;
var custompayment = 0;
var totalprice = 0;
var subtotalprice = 0;
var finalprice = 0;
var additional_cost_val= 0;
// Disable the tabs
$('#order a[data-toggle=\'tab\']').on('click', function(e) {
	return false;
});

var token2 = '';

// Login to the API
$.ajax({
	url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/login',
	type: 'post',
	data: 'key=<?php echo $api_key; ?>',
	dataType: 'json',
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
			token2 = json['token'];
      $('select[name=\'currency\']').trigger('change');
      <?php if($order_id)  { ?>
        shouldirefresh = 0;
        customerlogin();
      <?php } ?>
		}
	},
	error: function(xhr, ajaxOptions, thrownError) {
		alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}
});


$("#button_update_popup").click(function(){
  
  /*if($("#quantity_up").val()==""&&$("input[name=instock_popup]:checked").val()==7){
    alert("Please enter instock quantity");
    $("#quantity_up").focus();
    return false;
  }*/
  $("#button_update_popup").html("Updating");
  $.ajax({
    type:'post',
    url:'index.php?route=module/product_labels/updateStocks&token=<?php echo $token; ?>',
    cache:false,
    data:$("#updateStock input[type^=text],#updateStock input[type^=hidden], #updateStock input[type=radio]:checked"),
    success:function(data){
      
         $("#button_update_popup").html("<i class='fa fa-refresh'></i> updated");
    
    }
  });
});
/*$("input[name=instock_popup]").click(function(){
  if($("#instock").is(":checked")){
    $("#quantity_updator").show("slow");
  }else{
    $("#quantity_updator").hide("slow");
  }
});*/
function openStockModel(product_id){
     
     $.ajax({
      type:'GET',
      url: 'index.php?route=module/product_labels/getStockRelatedData&product_id='+product_id+'&token=<?php echo $token; ?>',
      cache:false,
      dataType:'json',
      success:function(data){
        $("#current_popup_product_id").val(product_id);
        var htmlstockdata1="";
        var htmlstockdata2="";
        var html_incoming_order_history ="";
        var labourcost=data.product_data.labour_cost;
        var unique_option_price=data.product_data.unique_option_price;
        htmlstockdata1 += '<div class="row"><div style="padding:30px;" class="col-sm-2"><img src="../image/'+data.product_data.image+'" width="60"></div><div class="col-sm-10"><h3> '+data.product_data.name+'</h3><div class="col-sm-4"><b>Model: '+data.product_data.model+'</b></div><div class="col-sm-4"><b>MPN: '+data.product_data.mpn+'</b></div><div class="col-sm-4"><b>Price: '+data.product_data.price+'<br/>('+parseFloat(labourcost).toFixed(4)+'+'+parseFloat(unique_option_price).toFixed(8)+')</b></div><div class="col-sm-4"><b>SKU: '+data.product_data.sku+'</b></div><div class="col-sm-4"><b>UPC: '+data.product_data.upc+'</b></div></div></div>';

        if(data.location_data){
        var counter=0;
          $(data.location_data).each(function(i){
             
              
        htmlstockdata2 +='<div id="main_storge'+counter+'"><div class="form-group">';
        htmlstockdata2 +='   <label class="col-sm-2 control-label">Quantity </label>';
        htmlstockdata2 +='<div class="col-sm-10">';
        htmlstockdata2 +=' <input type="text" name="locations['+counter+'][location_quantity]" placeholder="Quantity" id="quantity_up'+counter+'" value="'+data.location_data[i].location_quantity+'" class="form-control">';
        htmlstockdata2 +='</div>';
        htmlstockdata2 +='</div>';

        htmlstockdata2 +='<div class="form-group">';
        htmlstockdata2 +=' <label class="col-sm-2 control-label">Location</label>'; 
        htmlstockdata2 +='   <div class="col-sm-10">'; 
        htmlstockdata2 +='    <input type="text" name="locations['+counter+'][location_name]" id="location_popup'+counter+'" value="'+data.location_data[i].location_id+'" class="form-control">'; 
        htmlstockdata2 +='   </div>'; 
        htmlstockdata2 +=' </div>';
        htmlstockdata2 += '<div class="col-sm-12 pull-right"><button onclick="removeRow('+counter+');" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></div></div>';
        counter++;
             });
      }

      if(!jQuery.isEmptyObject(data.incoming_orders)){ 
        var incoming_order_data = data.incoming_orders;
        html_incoming_order_history += '<h3 style="margin-left:10px;">Incoming Order History</h3>';
        html_incoming_order_history += '<div class="table-responsive"><table class="table table-bordered table-hover"><thead><tr>';
        html_incoming_order_history += '<td>Order ID</td><td>Manufacturer</td><td>Status</td><td>No Of Items</td><td>Date Added</td><td>Action</td></tr></thead><tbody>';
        $(incoming_order_data).each(function(i){
          //alert(JSON.stringify(incoming_order_data[i].status, null, 4));
            html_incoming_order_history += '<tr><td>' + incoming_order_data[i].order_id + '</td>';
            html_incoming_order_history += '<td>' + incoming_order_data[i].manufacturer + '</td>';
            html_incoming_order_history += '<td>' + incoming_order_data[i].status + '</td>';
            html_incoming_order_history += '<td>' + incoming_order_data[i].no_of_items + '</td>';
            html_incoming_order_history += '<td>' + incoming_order_data[i].date_added + '</td>';
            html_incoming_order_history += '<td>'; 
            html_incoming_order_history += '<a href="'+incoming_order_data[i].view+'" data-toggle="tooltip" title="View" class="btn btn-sm btn-info"><i class="fa fa-eye"></i></a> <a href="'+incoming_order_data[i].edit+'" data-toggle="tooltip" title="Edit" class="btn btn-sm btn-primary"><i class="fa fa-pencil"></i></a><a href="'+incoming_order_data[i].pdfinv_packing+'" data-toggle="tooltip" title="Packing Slip" class="btn btn-warning btn-sm" target="_blank"><i class="fa fa-file-text-o"></i></a><a href="'+incoming_order_data[i].link_pdf_order_request+'" data-toggle="tooltip" title="PDF Order Request" class="btn btn-success btn-sm" target="_blank"><i class="fa fa-file-text-o"></i></a><a href="'+incoming_order_data[i].copy+'" data-toggle="tooltip" title="Copy" class="btn btn-warning btn-sm" onclick="return confirm(\'Do you really want to copy this order?\') ? true : false;"><i class="fa fa-copy"></i></a><button type="button" value="'+incoming_order_data[i].order_id+'" id="button-delete'+incoming_order_data[i].order_id+' data-toggle="tooltip" title="Delete" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button></td></tr>';
        });
        html_incoming_order_history += '</tbody></table></div>';
      }
        $("#addStorageLocation").attr("data-counter",counter);

        $("#productid").val(product_id);
        $("input[name=total_instock]").val(data.product_data.quantity);
        
        $("#product_stock_data").html(htmlstockdata1);
        $("#product_stock_data_html").html(htmlstockdata2);
        $("#product_incoming_order_history_html").html(html_incoming_order_history);

      
      $("#invoke_update_stock").trigger('click');
        // console.log(data.location);
      }
     });
}

$("#add_to_incoming_order").click(function() {
  var product_id = $("#current_popup_product_id").val();
  $.ajax({
    url: 'index.php?route=sale/orderq/create_incoming_order&product_id='+product_id+'&order_id=' + $('input[name=\'order_id\']').val()+'&token=<?php echo $token; ?>',
    dataType: 'json',
    crossDomain: true,
    success: function(json) {
      var success_html = '<div class="alert alert-success" id="success_html">Product added to incoming order successfully!</div>';
      $("#success_html").empty();
      $( "#add_to_incoming_order" ).before( success_html );  
    }
  });
  
});
    
$("#create_backorder").click(function() {
  var product_id =  $("#current_popup_product_id").val();
  var customer_id = $("input[name=customer_id]").val(); 
  $.ajax({
    url: 'index.php?route=sale/orderq/create_backorder&product_id='+product_id+'&customer_id='+customer_id+'&order_id=' + $('input[name=\'order_id\']').val()+'&token=<?php echo $token; ?>',
    dataType: 'json',
    crossDomain: true,
    success: function(json) {
      var success_html = '<div class="alert alert-success" id="success_html">Backorder created successfully!</div>';
      $("#success_html").empty();
      $( "#add_to_incoming_order" ).before( success_html );  
    }
  }); 
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

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Currency
$('select[name=\'currency\']').on('change', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/currency&token=' + token2,
		type: 'post',
		data: 'currency=' + $('select[name=\'currency\'] option:selected').val(),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('select[name=\'currency\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				// Highlight any found errors
				$('select[name=\'currency\']').parent().parent().addClass('has-error');
			}
      if (json['success']) {
        if(shouldirefresh) {
          $('#button-refresh').trigger('click');
        }
        shouldirefresh = 1;
      }

		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

//refresh products
$('#RefreshCart').on('click', function() {
	$('#UpdateProducts').trigger("click");
	/*$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/refreshprices&token=' + token2,
		type: 'post',
		dataType: 'json',
		crossDomain: true,
		data: $('input[name^=\'order_id\'],#cart input[name^=\'product\'][type=\'text\'], #cart input[name^=\'product\'][type=\'hidden\'], #cart input[name^=\'product\'][type=\'radio\']:checked, #cart input[name^=\'product\'][type=\'checkbox\']:checked, #cart select[name^=\'product\'], #cart textarea[name^=\'product\'], #cart input[name^=\'refreshproducts\']'),
		success: function(json) {
			$('#cart input[name^=\'refreshproducts\']').val(1);
			$('#button-refresh').trigger('click');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});*/
})


$(document).on('focus', '.productqty', function(e) {	
	if($(window).width() < 1050)
	{
		$(this).val('');
	}
})

//update products
$(document).on('keyup', '.productqty,.productprice', function(e) {
	var mydata = $(this).parent().parent();
	var productqty 		= mydata.find('.productqty').val();
	var productprice 	= mydata.find('.productprice').val();
	
	if( isNaN(productqty) || productqty.length < 1)
	{
		//productqty = 0;
		//mydata.find('.productqty').val(productqty.toFixed(2));
    productqty = mydata.find('.convertqty').val() != undefined ? mydata.find('.convertqty').val() : mydata.find('.actualqty').val();
    mydata.find('.productqty').val(''); 
	}
	
	if( isNaN(productprice) || productprice.length < 1)
	{
		productprice = 0;
		mydata.find('.productprice').val(productprice.toFixed(2));
	}
	
	var total_price =  eval(productqty) * eval(productprice);
	mydata.find('.producttotal').text('$'+total_price.toFixed(2));
	var totalnow = 0;
	$('.producttotal').each(function(){
		totalnow += eval( $(this).text().replace('$','') );	
	})
	
	
	if( isNaN(finalprice) ) finalprice = 0;

  additional_cost_val = $(".additional_cost .pricevalue").text().replace("$", "");
  if(isNaN(additional_cost_val)) additional_cost_val = 0;
  if(!additional_cost_val) additional_cost_val = 0;
  $("#total .Sub-Total .pricevalue").text('$'+totalnow.toFixed(2));
  
  var totl = eval(totalnow) + eval(finalprice) + eval(additional_cost_val);
	
	$("#total .Total .pricevalue").text('$'+totl.toFixed(2))
	
});

$('#UpdateShipping').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/updateshipping&token=' + token2,
		dataType: 'json',
		type: 'post',
		crossDomain: true,
		data: { shipping_title: $('input[name=\'shipping_title\']').val(), shipping_value : $('input[name=\'shipping_value\']').val(), order_id : $('input[name=\'order_id\']').val(), shipping_method: $( "#input-shipping-method option:selected" ).val(), shipping_method_text: $( "#input-shipping-method option:selected" ).text()},
		success: function(json) {
			//console.log(json);
			$('#saveAllCart').trigger("click");
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});


$('#UpdateProducts').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/updateproducts&token=' + token2,
		dataType: 'json',
		type: 'post',
		crossDomain: true,
		data: $('input[name^=\'order_id\'],#cart input[name^=\'product\'][type=\'text\'], #cart input[name^=\'product\'][type=\'hidden\'], #cart input[name^=\'product\'][type=\'radio\']:checked, #cart input[name^=\'product\'][type=\'checkbox\']:checked, #cart select[name^=\'product\'], #cart textarea[name^=\'product\'],#cart input[name^=\'refreshproducts\']'),
		success: function(json) {
			//console.log(json);
			//$('#cart input[name^=\'refreshproducts\']').val(1);
			$('#button-refresh').trigger('click');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#simpleInvoice').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/orderq/simpleinvoice&token=<?php echo $token; ?>&order_id=' + $('input[name=\'order_id\']').val(),
		dataType: 'json',
		type: 'get',
		crossDomain: true,
		success: function(json) {
      if(json['error'])
      {
        html = '<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>';
      }	
      
      if(json['success'])
      {
        html = '<div class="alert alert-success"><i class="fa fa-check-circle"></i> Invoice is ready. Please download it from <a href="<?php echo HTTPS_CATALOG; ?>' + 'image/invoice/' + json['success'] + '"><b>Here</b></a><button type="button" class="close" data-dismiss="alert">&times;</button></div>';
      }

      $( "#simpleInvoice" ).parent().before( html );
		}
	});
});

// Update Return Total
$('#input-update-return').on('click', function() {
  var return_total = $('#return_total').val();
  var rma_id = $('#rma_id').val();
  var order_id = $('#order_id').val();
  $.ajax({
    url: 'index.php?route=catalog/wk_rma_admin/update_return_total&token=<?php echo $token; ?>',
    dataType: 'json',
    type: 'get',
    crossDomain: true,
    data: {
      order_id: order_id,
      rma_id: rma_id,
      total: return_total
    },
    success: function(json) {
      //console.log(json);
      //$('#cart input[name^=\'refreshproducts\']').val(1);
      $('#button-refresh').trigger('click');
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
})

// Add all products to the cart using the api
$('#button-refresh').on('click', function() {
	  if($("#neworder").val()=='yes'){
    url=$('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/products<?php if(isset($_GET["order_id"])) echo "&orderid=1"; ?>&neworder=1&token=' + token2
  }else{
    url=$('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/products<?php if(isset($_GET["order_id"])) echo "&orderid=1"; ?>&token=' + token2
  }
  $.ajax({
    url: url,
		dataType: 'json',
		crossDomain: true,
		success: function(json) {
			$('.alert-danger, .text-danger').remove();

			// Check for errors
			if (json['error']) {
				if (json['error']['warning']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['error']['stock']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['stock'] + '</div>');
          $('html, body').animate({ scrollTop: 0 }, 'slow');
				}

				if (json['error']['minimum']) {
					for (i in json['error']['minimum']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['minimum'][i] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}
				}
			}

			var shipping = false;

			html = '';

			if (json['products'].length) {
				for (i = 0; i < json['products'].length; i++) {
					product = json['products'][i];
					//console.log(JSON.stringify(product, null, 4));
					html += '<tr class="productno" data-index="'+[i]+'">';
          html += '  <td>' + product['order_item_sort_order'] + '</td>';
          html += '  <td class="text-left"><img src="' + product['image'] + '" alt="' + product['name'] + '" title="' + product['name'] + '"></td>';
					html += '  <td class="text-left"><input type="text" class="form-control productname" value="'+product['name'] +'" name="product_name[' + i + ']" />' + ' ' + (!product['stock'] ? '<span class="text-danger">***</span>' : '');
					html += '  <input type="hidden" name="product[' + i + '][product_id]" value="' + product['product_id'] + '" />';

					if (product['option']) {
						for (j = 0; j < product['option'].length; j++) {
							option = product['option'][j];

							html += '  - <small>' + option['name'] + ': ' + option['value'] + '</small><br />';

							if (option['type'] == 'select' || option['type'] == 'radio' || option['type'] == 'image') {
								html += '<input type="hidden" name="product[' + i + '][option][' + option['product_option_id'] + ']" value="' + option['product_option_value_id'] + '" />';
							}

							if (option['type'] == 'checkbox') {
								html += '<input type="hidden" name="product[' + i + '][option][' + option['product_option_id'] + '][]" value="' + option['product_option_value_id'] + '" />';
							}

							if (option['type'] == 'text' || option['type'] == 'textarea' || option['type'] == 'file' || option['type'] == 'date' || option['type'] == 'datetime' || option['type'] == 'time') {
								html += '<input type="hidden" name="product[' + i + '][option][' + option['product_option_id'] + ']" value="' + option['value'] + '" />';
							}
						}
					}

					html += '</td>';
					html += '  <td class="text-left"><input class="form-control productmodel" type="text" name="product_model[' + i + ']" value="' + product['model'] + '" /><br/><b>Location: '+product['location']+'</b></td>';
					
					html += '  <td class="text-right"><div class="input-group btn-block" style="max-width: 200px;">';
					if(product['unit'] && product['unit'] != ''){                                        
                        html += '  <input type="hidden" name="product[' + i + '][unit_conversion_values]" value="' + product['unit']['unit_conversion_values'] + '" />';
                    }
					if(product['unit']['unit_conversion_values']) {
						
						var price = parseFloat(product['price']/product['unit']['convert_price']).toFixed(2);
						
						var total = parseFloat(price * parseFloat(product['quantity']*product['unit']['convert_price'])).toFixed(2);
					}else{
						var price = parseFloat(product['price']).toFixed(2);
						var total = parseFloat(price * product['quantity']).toFixed(2);	
					}
					var quantity = parseFloat(product['quantity']*product['unit']['convert_price']).toFixed(2);
					var real_quantity = parseFloat(product['quantity']).toFixed(2);
					if(product['unit']['unit_conversion_values']) {
						html += '  <input type="hidden" class="convertqty" name="product[' + i + '][convert_quantity]" value="' + quantity + '" />';
						html += '  <input type="hidden" name="product[' + i + '][quantity]" value="' + real_quantity + '" />';
						html += '  <input type="hidden" name="product[' + i + '][unit_convertion]" value="1" />';
                        
						if(product['unit_dates_default']['name'] != product['unit']['unit_value_name']){
		                     html += quantity + ' ' + product['DefaultUnitName']['unit_plural'] + '<br />' + product['quantity'] + ' '+product['unit']['unit_value_name']+'</td>';
      	               		 }else{
                               	html += quantity + ' ' + product['DefaultUnitName']['unit_plural'] +'</td>';
                             }
                    }
            else{
                    html += '  <input type="hidden" class="actualqty" name="product[' + i + '][quantity]" value="' +  product['quantity'] + '" />';
                    if (product['DefaultUnitName']['unit_plural'])
                    {
                      html += product['quantity'] + ' ' + product['DefaultUnitName']['unit_plural'] +'</div></td>';
                    } else {
                      html += product['quantity'] + '</div></td>';
                    }
              }

                        if(product['quantity_supplied']==null){
								html +='<td class="text-right"><input type="text" name="product[' + i + '][quantity_supplied]" value="" class="form-control productqty" /></div></td>';
                    }else if(product['quantity_supplied']==0){
								html +='<td class="text-right"><input type="text" name="product[' + i + '][quantity_supplied]" value="0" class="form-control productqty" /></div></td>';
                    }else{
       					   html +='<td class="text-right"><input type="text" name="product[' + i + '][quantity_supplied]" value="' + product['quantity_supplied'] + '" class="form-control productqty" /></div></td>';
         		 }
					
          			html += '  <td class="text-right"><input class="form-control productprice" type="text" value="'+product['newprice']+'" name="product[' + i + '][price]" /><input class="form-control unit-product-price" type="hidden" value="'+product['unit_product_price']+'" name="product[' + i + '][unit_product_price]" /><!--' + product['pricewithtax'] + '<br><small>Ex.Tax ' + product['price'] + '<small>-->';
          			html += '  <!--<input type= "hidden" name="product[' + i + '][price]" value="' + product['newprice'] + '" >--></td>';
					
					html += '  <td class="text-right producttotal">' + product['total'] + '</td>';
					html += '  <td class="text-center" style="width: 3px;"><button type="button" value="' + product['cart_id'] + '" title="<?php echo $button_remove; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button> <a href="javascript:void(0);" data-href="index.php?route=module/product_labels/printOrderProductlabel&product_id=' + product['product_id'] + '&token=<?php echo $token; ?>" data-productid="'+product['product_id']+'" target="_blank" title="Print Label" class="btn btn-success productlabelpopup"><i class="fa fa-print fa-2x"></i></a> <a href="javascript:void(0);" title="Update Stock" onclick="openStockModel('+product['product_id']+');" class="btn btn-info"><i class="fa fa-refresh fa-2x"></i></a></td>';
					html += '</tr>';

					if (product['shipping'] != 0) {
						shipping = true;
					}
				}
			}

			if (!shipping) {
        $('select[name=\'shipping_address\'] option').removeAttr('selected');
        $('select[name=\'shipping_address\']').prop('disabled', true);
				$('select[name=\'shipping_method\'] option').removeAttr('selected');
				$('select[name=\'shipping_method\']').prop('disabled', true);
				$('#button-shipping-method').prop('disabled', true);
			} else {
        $('select[name=\'shipping_address\']').prop('disabled', false);
				$('select[name=\'shipping_method\']').prop('disabled', false);
				$('#button-shipping-method').prop('disabled', false);
			}

      if(customshipping) {
        $('select[name=\'shipping_method\'] option').removeAttr('selected');
        $('select[name=\'shipping_method\']').prop('disabled', true);
        $('#button-shipping-method').prop('disabled', true);
      }

      if(custompayment) {
        $('select[name=\'payment_method\'] option').removeAttr('selected');
        $('select[name=\'payment_method\']').prop('disabled', true);
        $('#button-payment-method').prop('disabled', true);
      } else {
        $('select[name=\'payment_method\']').prop('disabled', false);
        $('#button-payment-method').prop('disabled', false);
      }

			if (json['vouchers'].length) {
				for (i in json['vouchers']) {
					voucher = json['vouchers'][i];

					html += '<tr>';
					html += '  <td class="text-left">' + voucher['description'];
                    html += '    <input type="hidden" name="voucher[' + i + '][code]" value="' + voucher['code'] + '" />';
					html += '    <input type="hidden" name="voucher[' + i + '][description]" value="' + voucher['description'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][from_name]" value="' + voucher['from_name'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][from_email]" value="' + voucher['from_email'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][to_name]" value="' + voucher['to_name'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][to_email]" value="' + voucher['to_email'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][voucher_theme_id]" value="' + voucher['voucher_theme_id'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][message]" value="' + voucher['message'] + '" />';
                    html += '    <input type="hidden" name="voucher[' + i + '][amount]" value="' + voucher['amount'] + '" />';
					html += '  </td>';
					html += '  <td class="text-left"></td>';
					html += '  <td class="text-right">1</td>';
					html += '  <td class="text-right">' + voucher['amount'] + '</td>';
          html += '  <td class="text-right"></td>';
					html += '  <td class="text-right">' + voucher['amount'] + '</td>';
					html += '  <td class="text-center" style="width: 3px;"><button type="button" value="' + voucher['code'] + '" data-toggle="tooltip" title="<?php echo $button_remove; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
					html += '</tr>';
				}
			}

			if (!json['products'].length && !json['vouchers'].length) {
				html += '<tr>';
				html += '  <td colspan="8" class="text-center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';
			}
			$('#cart').html(html);
      $('.productdetails').removeClass("lessopacity");
      $('.addressdetails').removeClass("lessopacity");
      
      gettotals();
	  $('#button-save').show();
	  
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

function saveShippedQuantity(cart_id,row_id){
	
	alert(cart_id);
	alert( $('input[name=\'product['+row_id+'][quantity_supplied]\']').val());	
	
}

function checkForTax()
{
  $.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/checkfortax&token=' + token2,
		dataType: 'json',
		type: 'post',
		crossDomain: true,
		data: { shipping_address_id: $("select[name=shipping_address] option:selected").val(), customer_id : $("input[name=customer_id]").val(), order_id: $('input[name=\'order_id\']').val()},
		success: function(json) {

		}
  });
  
}

function gettotals() {
  $.ajax({
    url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/getTotal&token=' + token2 + '&order_id=' + $('input[name=\'order_id\']').val(),
    dataType: 'json',
    crossDomain: true,
    success: function(json) {

      html = "";

      if (typeof json['totals'] !== 'undefined' && json['totals'].length) {
        for (i in json['totals']) {
          total = json['totals'][i];
          
          var totalclass = total['title'];
          totalclass = totalclass.replace("(", "");
          totalclass = totalclass.replace(")", "");
          totalclass = totalclass.replace(" ", "-");
          
          //console.log(totalclass);
          if(totalclass == "Sub-Total") subtotalprice = total['text'].replace("$", "");
          if(totalclass == "Total") totalprice = total['text'].replace("$", "");
          
          
          if(subtotalprice) subtotalprice = subtotalprice.replace(",","");
          if(totalprice) totalprice 	= totalprice.replace(",","");
          
          finalprice = eval(totalprice) - eval(subtotalprice);
		  
		  if(total['code'] == 'shipping')
		  {
			  var shipping_title = total['title'];
			  var shipping_value = total['text'];
			  html += '<tr class="shipping">';
			  html += '  <td class="text-right pricekey" colspan="7"><input type="text" style="text-align: right;" class="form-control" name="shipping_title" id="shipping_title" value="' + shipping_title + '":</td>';
			  html += '  <td class="text-right pricevalue"><input type="text" style="text-align: right;" class="form-control" name="shipping_value" id="shipping_value" value="' + shipping_value + '":</td>';
			  html += '</tr>';
			  
		  } else {

			  html += '<tr class="'+totalclass+'">';
			  html += '  <td class="text-right pricekey" colspan="7">' + total['title'] + ':</td>';
			  html += '  <td class="text-right pricevalue">' + total['text'] + '</td>';
			  html += '</tr>';
		  }
        }
      }

      if (!json['totals'].length && !json['products'].length && !json['vouchers'].length) {
        html += '<tr>';
        html += '  <td colspan="8" class="text-center"><?php echo $text_no_results; ?></td>';
        html += '</tr>';
      }

      $('#total').html(html);
	  $('#shipping_title,#shipping_value').on('change', function() {
		$("#input-shipping-method option[value='free.free']").attr('selected', 'selected');
      });
      if(nocallagain) {
        $('select[name=\'payment_address\']').trigger('change');
        $('select[name=\'shipping_address\']').trigger('change');
      }
      var orderids="<?php echo $_GET['order_id']; ?>";
      getAdditionalCostAjax(orderids);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
};


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
          html += '  <td class="text-right pricekey" colspan="7">Authorization for Additional cost of wire: </td>';
          html += '  <td class="text-right pricevalue">'+json.additional_cost_text+'</td>';
          html += '</tr>';
          $('#total .Sub-Total').before(html);
        
          additional_cost_val = $(".additional_cost .pricevalue").text().replace(json.currency_code, "");
          total_cost_val = $(".Total .pricevalue").text().replace(json.currency_code, "");

          totalvalue=  (eval(total_cost_val) + eval(additional_cost_val)).toFixed(2);

          $(".Total .pricevalue").html(json.currency_code+totalvalue);
}
        }

   }

  });
}


function addressdetailspopup(addresstype) {
  if(addresstype == 1) {
    var addressid = $("select[name=payment_address] option:selected").val();
  } else {
    var addressid = $("select[name=shipping_address] option:selected").val();
  }
  if(addressid == 0) {
    alert("Select address from drop down to edit or create new address in customer edit details");
    return false;
  }
  $.ajax({
    url: 'index.php?route=sale/orderq/getadetails&token=<?php echo $token; ?>&aid=' + addressid,
    dataType: 'json',
    crossDomain: true,
    success: function(json) {
      $("#addressedit .modal-body").html(json);
      $("#addressedit").modal('toggle');
      $('input[name=addresstype]').val(addresstype);
      $(document).delegate('#saveaddress', 'click', function() {
        $.ajax({
            url: 'index.php?route=sale/orderq/saveaddress&token=<?php echo $token; ?>',
            type: 'post',
            data: $('#addressedit input[type=\'hidden\'],.pdetails select[name=customer_group_id], #addressedit input[type=\'text\'], #addressedit input[type=\'date\'], #addressedit input[type=\'datetime-local\'], #addressedit input[type=\'time\'], #addressedit input[type=\'password\'], #addressedit input[type=\'checkbox\']:checked, #addressedit input[type=\'radio\']:checked, #addressedit textarea, #addressedit select'),
            dataType: 'json',
            beforeSend: function() {
                $('#saveaddress').button('loading');
            },
            complete: function() {
                $('#saveaddress').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
    
                if (json['error']) {
                    $('#saveaddress').button('reset');
    
                    if (json['error']['warning']) {
                        $('#addressedit .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
    
                    for (i in json['error']) {
                      var element = $('#input-address-' + i.replace('_', '-'));
    
                      if ($(element).parent().hasClass('input-group')) {
                        $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                      } else {
                        $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                      }
                    }
    
                    // Highlight any found errors
                    $('.text-danger').parent().parent().addClass('has-error');
                } else {
                  if($('input[name=addresstype]').val() == 1) {
                    $('select[name=\'payment_address\']').trigger("change");
                  } else {
                    $('select[name=\'shipping_address\']').trigger("change");
                  }
                  $("#addressedit .modal-body").html("");
                  $("#addressedit").modal('toggle');
    
                }
                location.reload();
                },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
       });
    });
    
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
};

function getPersonalDetails(cid) {
  $.ajax({
     url: 'index.php?route=sale/orderq/getpdetails&token=<?php echo $token; ?>&store_id=' + $('select[name=\'store_id\'] option:selected').val()+'&cid=' + cid+'&order_id=' + $('input[name=\'order_id\']').val(),
    dataType: 'json',
    crossDomain: true,
    success: function(json) {
      $(".personaldetails .pdetails").html(json).show();
      $(".personaldetails").show();
      $('select[name=\'customer_group_id\']').trigger('change');
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
};

// Customer
$('input[name=\'customer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=customer/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
          if(item['oname'] == undefined) {
            item['oname'] = item['name'];
          }
					return {
						category: item['customer_group'],
						label: item['oname'],
						value: item['customer_id'],
						customer_group_id: item['customer_group_id'],
						address: item['address'],
            address_id: item['address_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		// Reset all custom fields
    if(value == 0) {
      $('#cart').html("");
      return false;
    }
    if(!prevcsid) {

    } else if(prevcsid != value) {
      $('#cart').html("");
    }
    prevcsid = value;
     $(".messagecomeshere").html('');
    $('.productdetails').addClass("lessopacity");
    $('.addressdetails').addClass("lessopacity");
    $('.customerdetails').attr("href","index.php?route=customer/customer/edit&token=<?php echo $token; ?>&customer_id="+item['value']);
    getPersonalDetails(item['value']);
		$('.customer input[type=\'text\'], .customer textarea').not('.customer input[name=\'customer\'], .customer input[name=\'customer_id\']').val('');
		$('.customer select option').removeAttr('selected');
		$('.customer input[name=\'customer\']').val(item['label']);
    
		$('.customer input[name=\'customer_id\']').val(item['value']);
    customerlogin();
    html = '<option value="0"><?php echo $text_none; ?></option>';
    var haikya = 0;
    for (i in  item['address']) {
      haikya = 1;
      break;
    }
    if (haikya) {
      $('.noaddressfound').hide();
      $('.noaddressfound').hide();
      for (i in  item['address']) {
        html += '<option value="' + item['address'][i]['address_id'] + '">' + item['address'][i]['firstname'] + ' ' + item['address'][i]['lastname'] + ', ' + item['address'][i]['address_1'] + ', ' + item['address'][i]['city'] + ', ' + item['address'][i]['country'] + '</option>';
      }
      $('select[name=\'payment_address\']').html(html);
      $('select[name=\'shipping_address\']').html(html);
      $('select[name=\'shipping_address\']').trigger('change');
      $('select[name=\'payment_address\']').trigger('change');
      $('.updatecustomerlink').attr("href","index.php?route=customer/customer/edit&token=<?php echo $token; ?>&customer_id="+item['value']);
    } else {
      $('.addaddress').attr("href","index.php?route=customer/customer/edit&token=<?php echo $token; ?>&customer_id="+item['value']);
      $('.noaddressfound').show();
    }
    
	}
});

function refreshdetails(){
  $(".messagecomeshere").html('');
  $('.paymentaddress_success').hide();
  $('.shippingaddress_success').hide();
  $('.personaldetails_success').hide();
  $('.productdetails').addClass("lessopacity");
  $('.addressdetails').addClass("lessopacity");
  $.ajax({
        url: 'index.php?route=sale/orderq/savepdetails&token=<?php echo $token; ?>',
        type: 'post',
        data: $('#form-customer input[type=\'text\'], #form-customer input[type=\'date\'], #form-customer input[type=\'datetime-local\'], #form-customer input[type=\'time\'], #form-customer input[type=\'password\'], #form-customer input[type=\'hidden\'], #form-customer input[type=\'checkbox\']:checked, #form-customer input[type=\'radio\']:checked, #form-customer textarea, #form-customer select, tr.customer input[type=\'text\'], tr.customer input[type=\'hidden\']'),
        dataType: 'json',
        success: function(json) {
            $('.alert, .text-danger').remove();

            if (json['error'] != "") {
                $(".messagecomeshere").html('<div class="text-danger2">'+json['error']+'</div>');
            } else {
              $(".messagecomeshere").html('<div class="text-success2"><i class="fa fa-check-circle"></i> <?php echo $text_savedpdetails; ?></div>');
              customerlogin();
              $('select[name=\'shipping_address\']').trigger('change');
              $('select[name=\'payment_address\']').trigger('change');
            }
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    });
} 

function customerlogin(){
  nocallagain = 1;
  $.ajax({
    url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/customer&token=' + token2+'&order_id=' + $('input[name=\'order_id\']').val(),
    type: 'post',
    data: $('tr.customer input[type=\'text\'], tr.customer input[type=\'hidden\']'),
    dataType: 'json',
    crossDomain: true,
    beforeSend: function() {
      $('#button-customer').button('loading');
    },
    complete: function() {
       $('#button-customer').button('reset');
    },
    success: function(json) {
      //$('.alert, .text-danger').remove();
      //$('.form-group').removeClass('has-error');
      if($("input[name=customer_id]").val() != undefined) {
        getPersonalDetails($("input[name=customer_id]").val());
        $('.updatecustomerdetails').show();
      }
      $(".customerdetails").show();
      $('.personaldetails').show();
      $(".latestorders").show();
      if (json['error']) {
        $('.productdetails').removeClass("lessopacity");
        $('.addressdetails').removeClass("lessopacity");
        if (json['error']['warning']) {
          $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        }
        html = "";
        for (i in json['error']) {
         html += '<div class="text-danger2">' + json['error'][i] + '</div>';
        }
        $(".messagecomeshere").append(html);
          
        if($('.messagecomeshere').find("div.text-danger2").length != "0") {
          disableaddressandcart();
        }
      } else {
                enableaddressandcart();
                // Refresh products, vouchers and totals
                var request_1 = $.ajax({
                    url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/add&backend=1&token=' + token2,
                    type: 'post',
                    data: $('input[name^=\'order_id\'],#cart input[name^=\'product\'][type=\'text\'], #cart input[name^=\'product\'][type=\'hidden\'], #cart input[name^=\'product\'][type=\'radio\']:checked, #cart input[name^=\'product\'][type=\'checkbox\']:checked, #cart select[name^=\'product\'], #cart textarea[name^=\'product\']'),
                    dataType: 'json',
                    crossDomain: true,
                    beforeSend: function() {
                        $('#button-product-add').button('loading');
                    },
                    complete: function() {
                        $('#button-product-add').button('reset');
                    },
                    success: function(json) {
                        $('.alert, .text-danger').remove();
                        $('.form-group').removeClass('has-error');

                        if (json['error'] && json['error']['warning']) {
                            $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                        }
                },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });

                var request_2 = request_1.then(function() {
                    $.ajax({
                        url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/addVoucher&token=' + token2,
                        type: 'post',
                        data: $('#cart input[name^=\'voucher\'][type=\'text\'], #cart input[name^=\'voucher\'][type=\'hidden\'], #cart input[name^=\'voucher\'][type=\'radio\']:checked, #cart input[name^=\'voucher\'][type=\'checkbox\']:checked, #cart select[name^=\'voucher\'], #cart textarea[name^=\'voucher\']'),
                        dataType: 'json',
                        crossDomain: true,
                        beforeSend: function() {
                            $('#button-voucher-add').button('loading');
                        },
                        complete: function() {
                            $('#button-voucher-add').button('reset');
                        },
                        success: function(json) {
                            $('.alert, .text-danger').remove();
                            $('.form-group').removeClass('has-error');

                            if (json['error'] && json['error']['warning']) {
                                $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                            }
                    },
                        error: function(xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                });

                request_2.done(function() {
                    if($('.messagecomeshere').find("div.text-danger2").length == "0") {
                      $('.personaldetails_success').show();
                    }
                    $('#button-refresh').trigger('click');
                });
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
};

$('#addproducts input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=module/pos/autocomplete_product&backend=1&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request)+ '&filter_model2=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id'],
             image: item['image'],
						model: item['model'],
						option: item['option'],
						price: item['price']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#addproducts input[name=\'product\']').val(item['label']);
		$('#addproducts input[name=\'product_id\']').val(item['value']);
		if (item['image'] != '') {
		  htmlimage = '  <img src="' + item['image'] + '" alt="' + item['label'] + '" title="' + item['label'] + '">';
		  $('#product_image').html(htmlimage);
		} else {
		  $('#product_image').html("");
		}
		getoptionsData();
	
	}
});

$('#button-product-add').on('click', function() {
  $("#neworder").val("yes");
  nocallagain = 1;
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/add&backend=1&token=' + token2,
		type: 'post',
		data: $('input[name^=\'order_id\'],#addproducts input[name=\'product_id\'], #addproducts input[name=\'quantity\'], #addproducts input[name^=\'option\'][type=\'text\'], #addproducts input[name^=\'option\'][type=\'hidden\'], #addproducts input[name^=\'option\'][type=\'radio\']:checked, #addproducts input[name^=\'option\'][type=\'checkbox\']:checked, #addproducts select[name^=\'option\'], #addproducts input[name^=\'unit_conversion_values\'], #addproducts textarea[name^=\'option\']'),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-product-add').button('loading');
		},
		complete: function() {
			$('#button-product-add').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['warning']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							$(element).parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							$(element).after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['store']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['store'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parentsUntil('.form-group').parent().addClass('has-error');
			} else {
				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click'); 
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Voucher
$('#button-voucher-add').on('click', function() {
  nocallagain = 1;
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/voucher/add&token=' + token2,
		type: 'post',
		data: $('#addvoucher input[type=\'text\'], #addvoucher input[type=\'hidden\'], #addvoucher input[type=\'radio\']:checked, #addvoucher input[type=\'checkbox\']:checked, #addvoucher select, #addvoucher textarea'),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-voucher-add').button('loading');
		},
		complete: function() {
			$('#button-voucher-add').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['warning']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				for (i in json['error']) {
					var element = $('#input-' + i.replace('_', '-'));

					if (element.parent().hasClass('input-group')) {
						$(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
					} else {
						$(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
					}
				}

				// Highlight any found errors
				$('.text-danger').parentsUntil('.form-group').parent().addClass('has-error');
			} else {
				$('input[name=\'from_name\']').attr('value', '');
				$('input[name=\'from_email\']').attr('value', '');
				$('input[name=\'to_name\']').attr('value', '');
				$('input[name=\'to_email\']').attr('value', '');
				$('textarea[name=\'message\']').attr('value', '');
				$('input[name=\'amount\']').attr('value', '<?php echo addslashes($voucher_min); ?>');

				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#cart').delegate('.btn-danger', 'click', function() {
	var node = this;


	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/remove&token=' + token2,
		type: 'post',
		data: 'key=' + encodeURIComponent(this.value),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$(node).button('loading');
		},
		complete: function() {
			$(node).button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			// Check for errors
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			} else {
				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});


$('#cart').delegate('.btn-primary', 'click', function() {
    var node = this;
    nocallagain = 1;
    // Refresh products, vouchers and totals
    $.ajax({
        url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/add&token=' + token2,
        type: 'post',
        data: $('input[name^=\'order_id\'],#cart input[name^=\'product\'][type=\'text\'], #cart input[name^=\'product\'][type=\'hidden\'], #cart input[name^=\'product\'][type=\'radio\']:checked, #cart input[name^=\'product\'][type=\'checkbox\']:checked, #cart select[name^=\'product\'], #cart textarea[name^=\'product\'],#cart input[name^=\'refreshproducts\']'),
        dataType: 'json',
        crossDomain: true,
        beforeSend: function() {
            $(node).button('loading');
        },
        complete: function() {
            $(node).button('reset');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

            if (json['error'] && json['error']['warning']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            }

            if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }).done(function() {
        $('#button-refresh').trigger('click');
    });
});

$('#cart').delegate('.form-control', 'click', function() {
		
		$('#button-save').hide();
		$('#button-refresh').show();
			
});

$('.button-save').on( 'click', function() {
	$('#UpdateShipping').trigger('click');
	//$('#saveAllCart').trigger("click");
})

$('#saveAllCart').on( 'click', function() {
  $('#UpdateProducts').trigger('click');
  checkForTax();
    var node = this;
    nocallagain = 1;
    // Refresh products, vouchers and totals
    $.ajax({
        url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/add&token=' + token2,
        type: 'post',
        data: $('input[name^=\'order_id\'],#cart input[name^=\'product\'][type=\'text\'], #cart input[name^=\'product\'][type=\'hidden\'], #cart input[name^=\'product\'][type=\'radio\']:checked, #cart input[name^=\'product\'][type=\'checkbox\']:checked, #cart select[name^=\'product\'], #cart textarea[name^=\'product\'], #cart input[name^=\'refreshproducts\']'),
        dataType: 'json',
        crossDomain: true,
        beforeSend: function() {
            $(node).button('loading');
        },
        complete: function() {
            $(node).button('reset');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');
			
			$('#button-refresh').hide();
            if (json['error'] && json['error']['warning']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            }

            if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
        },
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
    }).done(function() {
      waitingDialog.show();
        $('#button-refresh').trigger('click');
        setTimeout(function() { $('#button-save').trigger('click'); },20000);
    });
});


$('select[name=\'payment_address\']').on('change', function() {

  $('.addressmessages').hide();
  $('.paymentmethod_success').hide();
  if(this.value == 0) {$('.paymentaddress_success').hide();return false;}
  $.ajax({
    url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/paymentaddress&token=' + token2 + '&address_id=' + this.value,
    type: 'post',
    data: $('#tab-payment input[type=\'text\']'),
    dataType: 'json',
    crossDomain: true,
    success: function(json) {
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      // Check for errors
      if (json['error']) {
        errormessage = "";
        for (i in json['error']) {
         errormessage += '<div class="text-danger2">' + json['error'][i] + '<?php echo $text_paymentdetails; ?></div>';
        }
        $(".addressmessages").html(errormessage).show(); 
      } else {
        $('.paymentaddress_success').html('<div class="text-success2"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>').show();
        // Payment Methods
        $.ajax({
          url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/payment/methods&token=' + token2,
          dataType: 'json',
          crossDomain: true,
          beforeSend: function() {
            $('#button-payment-address i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
            $('#button-payment-address').prop('disabled', true);
          },
          complete: function() {
            $('#button-payment-address i').replaceWith('<i class="fa fa-arrow-right"></i>');
            $('#button-payment-address').prop('disabled', false);
          },
          success: function(json) {
            if (json['error']) {
              $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            } else {
              html = '<option value=""><?php echo $text_select; ?></option>';

              if (json['payment_methods']) {
                for (i in json['payment_methods']) {
                  if (json['payment_methods'][i]['code'] == $('select[name=\'payment_method\'] option:selected').val()) {
                    html += '<option value="' + json['payment_methods'][i]['code'] + '" selected="selected">' + json['payment_methods'][i]['title'] + '</option>';
                  } else {
                    html += '<option value="' + json['payment_methods'][i]['code'] + '">' + json['payment_methods'][i]['title'] + '</option>';
                  }
                }
              }

              $('select[name=\'payment_method\']').html(html);

              if($('.messagecomeshere').find("div.text-danger2").length == "0") {
                if($('select[name=\'payment_method\'] option:selected').val()) {
                  $('#button-payment-method').trigger("click");
                }
              }

            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        }).done(function() {
                    // Refresh products, vouchers and totals
            //$('#button-refresh').trigger('click');

            // If shipping required got to shipping tab else total tabs
            // if ($('select[name=\'shipping_method\']').prop('disabled')) {
            //   $('a[href=\'#tab-total\']').tab('show');
            // } else {
            //   $('a[href=\'#tab-shipping\']').tab('show');
            // }
        });
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('select[name=\'shipping_address\']').on('change', function() {
  $('.addressmessages').hide();
  $('.shippingmethod_success').hide();
  if(this.value == 0) { $('.shippingaddress_success').hide();return false;}
  $.ajax({
    url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/orderquotecart/shippingaddress&token=' + token2 + '&address_id=' + this.value,
    type: 'post',
    data: $('#tab-shipping input[type=\'text\']'),
    dataType: 'json',
    crossDomain: true,
    beforeSend: function() {
      $('#saveaddress').button('loading');
    },
    complete: function() {
      $('#saveaddress').button('reset');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      // Check for errors
      if (json['error']) {
        errormessage = "";
        for (i in json['error']) {
         errormessage += '<div class="text-danger2">' + json['error'][i] + '<?php echo $text_shippingdetails; ?></div>';
        }
        $(".addressmessages").html(errormessage).show();
      } else {
        $('.shippingaddress_success').html('<div class="text-success2"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>').show();
        // Shipping Methods
        var request = $.ajax({
          url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/shipping/methods&token=' + token2,
          dataType: 'json',
          beforeSend: function() {
            $('#saveaddress i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
            $('#saveaddress').prop('disabled', true);
          },
          complete: function() {
            $('#saveaddress i').replaceWith('<i class="fa fa-arrow-right"></i>');
            $('#saveaddress').prop('disabled', false);
          },
          success: function(json) {
            if (json['error']) {
              $('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
            } else {
              // Shipping Methods
              html = '<option value=""><?php echo $text_select; ?></option>';

              if (json['shipping_methods']) {
                for (i in json['shipping_methods']) {
                  if( json['shipping_methods'][i]['title'] != "In Store Shipping" )
                  {
                    html += '<optgroup label="' + json['shipping_methods'][i]['title'] + '">';

                    if (!json['shipping_methods'][i]['error']) {
                      for (j in json['shipping_methods'][i]['quote']) {
                        if (json['shipping_methods'][i]['quote'][j]['code'] == $('select[name=\'shipping_method\'] option:selected').val()) {
                          html += '<option value="' + json['shipping_methods'][i]['quote'][j]['code'] + '" selected="selected">' + json['shipping_methods'][i]['quote'][j]['title'];
                            if(json['shipping_methods'][i]['quote'][j]['code'] != 'free.free')
                            {   html += ' - ' + json['shipping_methods'][i]['quote'][j]['text'];
                              html += '</option>';
                            } else {
                              html += '</option>';
                            }
                        } else {
                          html += '<option value="' + json['shipping_methods'][i]['quote'][j]['code'] + '">' + json['shipping_methods'][i]['quote'][j]['title'] + ' - ' + json['shipping_methods'][i]['quote'][j]['text'] + '</option>';
                        }
                      }
                    } else {
                      html += '<option value="" style="color: #F00;" disabled="disabled">' + json['shipping_method'][i]['error'] + '</option>';
                    }

                    html += '</optgroup>';
                  }
                }
                html += '<optgroup label="POS">';
                  if ($('select[name=\'shipping_method\'] option:selected').val() == 'instore.instore') {
                    html += '<option value="instore.instore" selected="selected">Instore Shipping</option>';
                  } else {
                    html += '<option value="instore.instore">Instore Shipping</option>';
                  }
                  html += '</optgroup>'; 
              }
			  html = html.replace("Custom Shipping - $0.00", "Custom Shipping");
              $('select[name=\'shipping_method\']').html(html);
              if($('.messagecomeshere').find("div.text-danger2").length == "0") {
                if($('select[name=\'shipping_method\'] option:selected').val()) {
                  $('#button-shipping-method').trigger("click");
                }
              }
            }
          },
          error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
          }
        });
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

// Shipping Method
$('#button-shipping-method').on('click', function() {
  $('.addressmessages').hide();
  $('.shippingmethod_success').hide();
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/shipping/method&token=' + token2,
		type: 'post',
		data: 'shipping_method=' + $('select[name=\'shipping_method\'] option:selected').val(),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-shipping-method').button('loading');
		},
		complete: function() {
			$('#button-shipping-method').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				$('.addressmessages').html('<div class="text-danger2"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' </div>').show();
        $('#button-shipping-method').removeClass("btn-success");
				// Highlight any found errors
				$('select[name=\'shipping_method\']').parent().parent().parent().addClass('has-error');
			}

			if (json['success']) {
				$('.shippingmethod_success').html('<div class="text-success2"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>').show();

        $('#button-shipping-method').addClass("btn-success");

				// Refresh products, vouchers and totals
        nocallagain = 0;
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Payment Method
$('#button-payment-method').on('click', function() {
  $('.addressmessages').hide();
  $('.paymentmethod_success').hide();
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/payment/method&token=' + token2,
		type: 'post',
		data: 'payment_method=' + $('select[name=\'payment_method\'] option:selected').val(),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-payment-method').button('loading');
		},
		complete: function() {
			$('#button-payment-method').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				$('.addressmessages').html('<div class="text-danger2"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' </div>').show();
        $('#button-payment-method').removeClass("btn-success");
				// Highlight any found errors
				$('select[name=\'payment_method\']').parent().parent().parent().addClass('has-error');
			}

			if (json['success']) {
				$('.paymentmethod_success').html('<div class="text-success2"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>').show();
				
				if($("#input-coupon").val()!=""){
				$("#button-coupon").trigger('click');
				}

        $('#button-payment-method').addClass("btn-success");
				// Refresh products, vouchers and totals
        nocallagain = 0;
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Change Store
$('#button-change-store').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/order/changestore&token=' + token2+ '&order_id=' + $('input[name=\'order_id\']').val(),
		type: 'post',
		data: 'store_type=' + $('select[name=\'store_type\'] option:selected').val(),
		dataType: 'json',
		crossDomain: true,
		success: function(json) {
			$('#button-change-store').text("Changed");
    }
	});
});

// Coupon
$('#button-coupon').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/coupon&token=' + token2,
		type: 'post',
		data: 'coupon=' + $('input[name=\'coupon\']').val(),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-coupon').button('loading');
		},
		complete: function() {
			$('#button-coupon').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('#button-coupon').removeClass("btn-success");
				// Highlight any found errors
				$('input[name=\'coupon\']').parent().parent().parent().addClass('has-error');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('#button-coupon').addClass("btn-success");
				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Voucher
$('#button-voucher').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/voucher&token=' + token2,
		type: 'post',
		data: 'voucher=' + $('input[name=\'voucher\']').val(),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-voucher').button('loading');
		},
		complete: function() {
			$('#button-voucher').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('#button-voucher').removeClass("btn-success");
				// Highlight any found errors
				$('input[name=\'voucher\']').parent().parent().parent().addClass('has-error');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('#button-voucher').addClass("btn-success");
				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Reward
$('#button-reward').on('click', function() {
	$.ajax({
		url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/reward&token=' + token2,
		type: 'post',
		data: 'reward=' + $('input[name=\'reward\']').val(),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-reward').button('loading');
		},
		complete: function() {
			$('#button-reward').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('#button-reward').removeClass("btn-success");
				// Highlight any found errors
				$('input[name=\'reward\']').parent().parent().parent().addClass('has-error');
			}

			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        $('#button-reward').addClass("btn-success");
				// Refresh products, vouchers and totals
				$('#button-refresh').trigger('click');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Affiliate
$('input[name=\'affiliate\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=marketing/affiliate/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				json.unshift({
					affiliate_id: 0,
					name: '<?php echo $text_none; ?>'
				});

				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['affiliate_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'affiliate\']').val(item['label']);
		$('input[name=\'affiliate_id\']').val(item['value']);
	}
});

// Checkout
$('#button-save').on('click', function() {
	 if ($('input[name=\'order_id\']').val() == 0) {
    var url = $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/oqorder/add&token=' + token2;
    if( $("#order_type").val() == 3 )
    {
      url += '&order_type=' + $("#order_type").val();
    }
  } else {
    var url = $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/oqorder/edit&token=' + token2 + '&order_id=' + $('input[name=\'order_id\']').val();
  }
    
	$.ajax({
		url: url,
		type: 'post',
		data: $('select[name=\'payment_method\'] option:selected,  select[name=\'shipping_method\'] option:selected, select[name=\'order_status_id\'], select, textarea[name=\'comment\'], input[name=\'affiliate_id\'], textarea[name=\'additionalemail\'],input[name=\'coupon\'],input[name=\'voucher\'],input[name=\'reward\']'),
		dataType: 'json',
		crossDomain: true,
		beforeSend: function() {
			$('#button-save').button('loading');
		},
		complete: function() {
			$('#button-save').button('reset');
		},
		success: function(json) {
			$('.alert').remove();

			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
         		$('html, body').animate({ scrollTop: 0 }, 'slow');
			}

			if (json['success'])
			{
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '  <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				// setTimeout(function() {location = 'index.php?route=sale/order&token=<?php echo $token; ?>';},2500);
				waitingDialog.hide();
        	}

			if (json['order_id']) {
				$('input[name=\'order_id\']').val(json['order_id']);
			}
			$('#UpdateProducts').trigger('click');
			var page_url = window.location.href;
			
			if ($('input[name=\'order_id\']').val() > 0 && page_url.indexOf("sale/orderq/add") !== -1) 
			{
				$("#cart").html("");
				$("#total").html("");
				$("#input-payment-address").val("");
				$("#input-shipping-address").val("");
				$("#input-shipping-method").val("");
				$("#input-payment-method").val("");
				$('input[name=\'order_id\']').val(0);
			}
			
			if(page_url.indexOf("sale/orderq/edit") !== -1) 
			{
				setTimeout(function(){
					location.reload();
				}, 2000);
			}
			waitingDialog.hide();
			
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#content').delegate('button[id^=\'button-upload\'], button[id^=\'button-custom-field\'], button[id^=\'button-payment-custom-field\'], button[id^=\'button-shipping-custom-field\']', 'click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload/upload&token=<?php echo $token; ?>',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$(node).parent().find('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input[type=\'hidden\']').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);
					}

					if (json['code']) {
						$(node).parent().find('input[type=\'hidden\']').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});

$("#get-unit-data").change(function() {
	  alert('here');
		 var coversion_id = $("#get-unit-data").find('option:selected').attr('data-value');
		   // alert(coversion_id);
			document.getElementById("unit_conversion_values").value = coversion_id;
			//alert($('#unit_conversion_values').val());
			$('#unit_conversion_values').val(coversion_id);
});

//--></script>
  <script type="text/javascript">
function addUnit(){
	
		 var coversion_id = $("#get-unit-data").find('option:selected').attr('data-value');
		   // alert(coversion_id);
			document.getElementById("unit_conversion_values").value = coversion_id;
			//alert($('#unit_conversion_values').val());
			$('#unit_conversion_values').val(coversion_id);
       
		
}

function getoptionsData(){
	product_id = parseInt($('input[name=product_id]').val());
	$.ajax({
		url: 'index.php?route=module/pos/getProductOptions&token=<?php echo $token; ?>&product_id='+product_id,
		type: 'post',
		dataType: 'json',
		beforeSend: function() {
			
		},
		complete: function() {
			
		},
		cacheCallback: function(json) {
			
		},
		cachePreDone: function(cacheKey, callback) {
			
		},
		success: function(json) {
			// display string attributes
			var dispay_attrs_string = ['name', 'sku', 'upc', 'model', 'cost', 'description', 'price', 'quantity', 'thumb', 'manufacturer', 'location', 'minimum'];
			for (i = 0; i < dispay_attrs_string.length; i++) {
				var value = json[dispay_attrs_string[i]] ? json[dispay_attrs_string[i]] : '';
				if ('thumb' == dispay_attrs_string[i]) {
					$('#product_details_thumb').attr('src', json['thumb']);
					$('#product_details_thumb').attr('alt', json['name']);
				} else {
					$('#product_details_' + dispay_attrs_string[i]).html($('<textarea />').html(value).text());
				}
			}
			
			// dispaly array attributes
			var html = ''
			if (json['option_data'] && json['option_data'].length > 0) {
 			html  = '<fieldset>';
            html += '  <legend><?php echo $entry_option; ?></legend>';

			for (i = 0; i < json['option_data'].length; i++) {
				option = json['option_data'][i];

				if (option['type'] == 'select') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <select onchange="getGroupProductId()" name="option[' + option['product_option_id'] + ']" id="input-option' + option['product_option_id'] + '" class="form-control">';
					html += '      <option value=""><?php echo $text_select; ?></option>';

					for (j = 0; j < option['option_value'].length; j++) {
						option_value = option['option_value'][j];

						html += '<option value="' + option_value['product_option_value_id'] + '"';
						
						if(option_value['is_requested_option_value']){
							html += ' selected';
						}
						html +='>' + option_value['name'];
						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}

						html += '</option>';
					}

					html += '    </select>';
					html += '  </div>';
					html += '</div>';
				}

				if (option['type'] == 'radio') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <select name="option[' + option['product_option_id'] + ']" id="input-option' + option['product_option_id'] + '" class="form-control">';
					html += '      <option value=""><?php echo $text_select; ?></option>';

					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];

						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}

						html += '</option>';
					}

					html += '    </select>';
					html += '  </div>';
					html += '</div>';
				}

				if (option['type'] == 'checkbox') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <div id="input-option' + option['product_option_id'] + '">';

					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];

						html += '<div class="checkbox">';

						html += '  <label><input type="checkbox" name="option[' + option['product_option_id'] + '][]" value="' + option_value['product_option_value_id'] + '" /> ' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}

						html += '  </label>';
						html += '</div>';
					}

					html += '    </div>';
					html += '  </div>';
					html += '</div>';
				}

				if (option['type'] == 'image') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <select name="option[' + option['product_option_id'] + ']" id="input-option' + option['product_option_id'] + '" class="form-control">';
					html += '      <option value=""><?php echo $text_select; ?></option>';

					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];

						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];

						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}

						html += '</option>';
					}

					html += '    </select>';
					html += '  </div>';
					html += '</div>';
				}

				if (option['type'] == 'text') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" id="input-option' + option['product_option_id'] + '" class="form-control" /></div>';
					html += '</div>';
				}

				if (option['type'] == 'textarea') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10"><textarea name="option[' + option['product_option_id'] + ']" rows="5" id="input-option' + option['product_option_id'] + '" class="form-control">' + option['value'] + '</textarea></div>';
					html += '</div>';
				}

				if (option['type'] == 'file') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <button type="button" id="button-upload' + option['product_option_id'] + '" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>';
					html += '    <input type="hidden" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" id="input-option' + option['product_option_id'] + '" />';
					html += '  </div>';
					html += '</div>';
				}

				if (option['type'] == 'date') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-3"><div class="input-group date"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-date-format="YYYY-MM-DD" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';
				}

				if (option['type'] == 'datetime') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-3"><div class="input-group datetime"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-date-format="YYYY-MM-DD HH:mm" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';
				}

				if (option['type'] == 'time') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-3"><div class="input-group time"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-date-format="HH:mm" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';
				}
			}
			html += '</fieldset>';
			$('#option').html(html);
			
			unit_datas = json['unit_datas'];
			defaultunit = json['DefaultUnitdata']; 
			alldata = json;
			html = '';
			if(unit_datas.length > 0){
				html = '<div class="form-group" id="option-unit_value">';
				if(unit_datas !='' && defaultunit != ''){
					html += '  <input type="hidden" id="unit_conversion_values" name="unit_conversion_values" value="'+defaultunit['unit_conversion_product_id']+'" />';
				}	
				html += '<label class="col-sm-2 control-label" for="unit-input">Unit</label>';
				html += '<div class="col-sm-10" id="unit">';
				html += '<select id="get-unit-data" name="unit[0]" class="form-control" onChange="addUnit();" >';					
							for (j = 0; j < unit_datas.length; j++) {
									unit_value = unit_datas[j];                               
									html += '<option data-value ="' + unit_value['unit_conversion_product_id'] + '" value="' + unit_value['convert_price'] + '">' + unit_value['name'];
	
								html += '</option>';
							}
	
							html += '</select>';
			
				html += '</div>';
			}
			
			if(alldata !='' && alldata['data']['requested_product_data']){
				html += '<input type="hidden" id="groupbyvalue" name="groupbyvalue" value="' + alldata['data']['requested_product_data']['groupbyvalue'] + '" />';
				html += '<input type="hidden" id="groupbyname" name="groupbyname" value="' + alldata['data']['requested_product_data']['groupbyname'] + '" />';
				html += '<input type="hidden" name="groupindicator_id" value="' + alldata['data']['group_indicator_id'] + '" />';
				
				//getGroupcombination();
				setTimeout(getGroupcombination, 1000);
				
			}
			
			
			$('#unit-options').html(html);
			
			
			$('.date').datetimepicker({
				pickTime: false
			});

			$('.datetime').datetimepicker({
				pickDate: true,
				pickTime: true
			});

			$('.time').datetimepicker({
				pickDate: false
			});
		} 
			else {
				$('#option').html('');
				$('#unit-options').html('');
			}
			/*if (json['product_options'] && json['product_options'].length > 0) {
				var trClass = 'even';
				for (var i = 0; i < json['product_options'].length; i++) {
					trClass = (trClass == 'even') ? 'odd' : 'even';
					html += '<tr class="' + trClass + '">';
					var option_value = '';
					var product_option = json['product_options'][i];
					if (product_option['type'] == 'text' ||
						product_option['type'] == 'textarea' ||
						product_option['type'] == 'file' ||
						product_option['type'] == 'date' ||
						product_option['type'] == 'datetime' ||
						product_option['type'] == 'time') {
						option_value = product_option['option_value'];
					} else if (product_option['type'] == 'select' || 
						product_option['type'] == 'radio' || 
						product_option['type'] == 'checkbox' || 
						product_option['type'] == 'image') {
						var product_option_id = parseInt(product_option['option_id']);
						if (json['option_values'][product_option_id]) {
							var option_value_value = json['option_values'][product_option_id];
							for (var k in option_value_value) {
								for (var j in product_option['product_option_value']) {
									var product_option_value = product_option['product_option_value'][j];
									if (product_option_value['option_value_id'] == option_value_value[k]['option_value_id']) {
										option_value += option_value_value[k]['name'] + '<br/>';
									}
								}
							}
						}
					}
					
					html += '<td>' + product_option['name'] + '</td><td>' + option_value + '</td><td>' + (product_option['required'] ? 'yes' : 'no') + '</td></tr>';
				}
			}
			alert(html);
			$('#option').html(html);*/
		}
	});	
	
	
}


 function selectedOption(){
        var that=this;
		$('#cart-button-display').hide();
		$('#loading-display').show();
		
        var selOpt=[];
		var name,value;
        var optionObj=$('#option').find('div');
		
        var i=0;
        optionObj.each(function(){
			if($(this).hasClass('form-group')){
				if(typeof(that.obj)!='undefined'){
					if(that.obj.length>0){
						if($(this).find('select').attr('name')==that.obj.attr('name')){
							return false;
						}
					}
				}
				name=$.trim($(this).find('label').text());
				value=$.trim($(this).find('select option:selected').html());
				if(jQuery.inArray( that.clean(name)+'~'+value, selOpt ) == -1){
						selOpt[i]=that.clean(name)+'~'+value;
					}
				i++;
			}
        });
				
        if(selOpt.length>0){
            return selOpt;
        }
    };
	function clean(v){
        return $.trim(v.replace(':',''));
    };
function getGroupProductId(){
	
		var that=this;
		var unit_conversion = '';
        var unit_conversion_text = '';
     
        var groupbyvalue = $('input[name=groupbyvalue]').val();
		var group_indicator = parseInt($('input[name=groupindicator_id]').val());
		var product_id = parseInt($('input[name=product_id]').val());
		
        var selOpt=that.selectedOption();
        $.ajax({
            url: 'index.php?route=module/pos/getCombinationData&token=<?php echo $token; ?>',
            beforeSend: function() {
            
            },
            complete: function() {
            
            },

            type: 'post',
            dataType: 'json',
            data: {
                'group_indicator': group_indicator,
                'selChoice':selOpt,
                'groupbyvalue':groupbyvalue,
				'product_id':product_id
            },
			success: function(resp){
				$('input[name=product_id]').val(resp['product_id']);
				$('input[name=sku]').val(resp['sku']);
				getoptionsData();
			}
            
        });
    
	
	
}
function getGroupcombination(){
	
		var that=this;
		var unit_conversion = '';
        var unit_conversion_text = '';
     
        var groupbyvalue = $('input[name=groupbyvalue]').val();
		var group_indicator = parseInt($('input[name=groupindicator_id]').val());
		var product_id = parseInt($('input[name=product_id]').val());
		
        var selOpt=that.selectedOption();
        $.ajax({
            url: 'index.php?route=module/pos/getCombinationData&token=<?php echo $token; ?>',
            beforeSend: function() {
            
            },
            complete: function() {
            
            },
            type: 'post',
            dataType: 'json',
            data: {
                'group_indicator': group_indicator,
                'selChoice':selOpt,
                'groupbyvalue':groupbyvalue,
				'product_id':product_id
            },
			success: function(resp){
				$('input[name=product_id]').val(resp['product_id']);
				$('input[name=sku]').val(resp['sku']);
				html = '';
				selectedval = $('#get-unit-data').val();
				if(resp['unit_datas'].length > 0){
					
					if(resp['unit_datas'] !='' && resp['unit_dates_default'] != ''){
						//$("#unit_conversion_values").val(resp['unit_dates_default']['unit_conversion_product_id']);
						//html += '  <input type="hidden" id="unit_conversion_values" name="unit_conversion_values" value="'+resp['unit_dates_default']['unit_conversion_product_id']+'" />';
					}	
									for (j = 0; j < resp['unit_datas'].length; j++) {
											unit_value = resp['unit_datas'][j];                               
											html += '<option data-value ="' + unit_value['unit_conversion_product_id'] + '" value="' + unit_value['convert_price'] + '">' + unit_value['name'];
			
										html += '</option>';
									}
			
									
					
					}
					
					$('#get-unit-data').empty();
					$('#get-unit-data').html(html);
					$("#get-unit-data").val(selectedval);
					$("#get-unit-data option[value='"+selectedval+"']").prop('selected', true);
					$('#get-unit-data').trigger('change');
			}
            
        });
    
	
	
}
function disableaddressandcart() {
  $('#cart').html("");
  $('.cart').html("");
  $('select[name=\'shipping_address\']').prop('disabled', true);
  $('select[name=\'shipping_method\']').prop('disabled', true);
  $('#button-shipping-method').prop('disabled', true);
  $('select[name=\'payment_address\']').prop('disabled', true);
  $('select[name=\'payment_method\']').prop('disabled', true);
  $('#button-payment-method').prop('disabled', true);
  $('#addproductsid').prop('disabled', true);
  $('#addvoucherid').prop('disabled', true);
}

function enableaddressandcart() {
  $('select[name=\'shipping_address\']').prop('disabled', false);
  $('select[name=\'shipping_method\']').prop('disabled', false);
  $('#button-shipping-method').prop('disabled', false);
  $('select[name=\'payment_address\']').prop('disabled', false);
  $('select[name=\'payment_method\']').prop('disabled', false);
  $('#button-payment-method').prop('disabled', false);
  $('#addproductsid').prop('disabled', false);
  $('#addvoucherid').prop('disabled', false);
}

</script>
<script type="text/javascript">
$('#latestorders').on('click', function() {
  $.ajax({
      url: 'index.php?route=sale/orderq/latestorders&token=<?php echo $token; ?>&store_id=' + $('select[name=\'store_id\'] option:selected').val(),
      type: 'post',
      data: $('tr.customer input[type=\'text\'], tr.customer input[type=\'hidden\']'),
      dataType: 'json',
      crossDomain: true,
      success: function(json) {
        html = '<div class="container" style="width:100%;">';
        for(var i in json['orders']) {
        var d = json['orders'][i];
          html += '<div style="page-break-after: always;">';
          html += '<h1><?php echo $text_invoice;?>#'+d['order_id']+'</h1>';
          html += '<table class="table table-bordered"><thead><tr>';
          html += '<td colspan="2"><?php echo $text_order_detail; ?></td>';
          html += '</tr></thead><tbody>';
          html += '<tr><td style="width: 50%;"><address>';
          html += '<strong>'+d['store_name']+'</strong><br />'+d['store_address']+'</address>';
          html += '<b><?php echo $text_telephone; ?></b> '+d['store_telephone']+'<br />';
          if (d['store_fax']) {
           html += '<b><?php echo $text_fax; ?></b> '+d['store_fax']+'<br />';
          } 
          html += '<b><?php echo $text_email; ?></b> '+d['store_email']+'<br />';
          html += '<b><?php echo $text_website;?></b> <a href="'+d['store_url']+'">'+d['store_url']+'</a></td>';
          html += '<td style="width: 50%;"><b><?php echo $text_date_added; ?></b> '+d['date_added']+'<br />';
          if (d['invoice_no']) { 
            html += '<b><?php echo $text_invoice_no; ?></b> '+d['invoice_no']+'<br />';
          }
          html += '<b><?php echo $text_order_id; ?></b> '+d['order_id']+'<br />';
          html += '<b><?php echo $text_payment_method; ?></b> '+d['payment_method']+'<br />';
          if (d['shipping_method']) {
          html += '<b><?php echo $text_shipping_method; ?></b> '+d['shipping_method']+'<br />';
          }
          html += '</td></tr></tbody></table><table class="table table-bordered"><thead><tr>';
          html += '<td style="width: 50%;"><b><?php echo $text_payment_address; ?></b></td>';
          html += '<td style="width: 50%;"><b><?php echo $text_shipping_address; ?></b></td>';
          html += '</tr></thead><tbody><tr><td><address>'+d['payment_address']+'</address></td><td><address>'+d['shipping_address']+'</address>';
          html += '</td></tr></tbody></table><table class="table table-bordered"><thead><tr>';
          html += '<td><b><?php echo $column_product; ?></b></td>';
          html += '<td><b><?php echo $column_model; ?></b></td>';
          html += '<td class="text-right"><b><?php echo $column_quantity; ?></b></td>';
          html += '<td class="text-right"><b><?php echo $column_price; ?></b></td>';
          html += '<td class="text-right"><b><?php echo $column_total; ?></b></td>';
          html += '</tr></thead><tbody>';
          for(var j in d['product']) {
            var p = d['product'][j];
            html += '<tr>';
            html += '<td>'+p['name'];
            for(var o in p['option']) {
              var k = p['option'][o];
              html += '<br />&nbsp;<small> - '+k['name']+': '+k['name']+'</small>';
            }
            html += '</td>';
            html += '<td>'+p['model']+'</td>';
            html += '<td class="text-right">'+p['quantity']+'</td>';
            html += '<td class="text-right">'+p['price']+'</td>';
            html += '<td class="text-right">'+p['total']+'</td>';
            html += '</tr>';
          }
          for(var i in d['voucher']) {
            var v = d['voucher'][i];
            html += '<tr>';
            html += '<td>'+v['description']+'</td><td></td><td class="text-right">1</td>';
            html += '<td class="text-right">'+v['amount']+'</td>';
            html += '<td class="text-right">'+v['amount']+'</td></tr>';
              
          }
          for(var i in d['total']) {
            var t = d['total'][i];
            html += '<tr><td class="text-right" colspan="4"><b>'+t['title']+'</b></td>';
            html += '<td class="text-right">'+t['text']+'</td></tr>';
          }
          html += '</tbody></table>';
          if (d['comment']) {
            html += '<table class="table table-bordered">';
            html += '<thead><tr>';
            html += '<td><b><?php echo $text_comment; ?></b></td>';
            html += '</tr></thead><tbody><tr>';
            html += '<td>'+d['comment']+'</td>';
            html += '</tr></tbody></table>';
          }
        html += '</div>';
        }
      html += '</div>';
      $("#vieworders div.modal-body").html(html);
      $("#vieworders").modal('toggle');
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
  });
});
</script>
<?php if($customtotalstatus) { ?>
      <script type="text/javascript">
$('#button-savecustomtotal').on('click', function() {
  nocallagain = 0;
  $.ajax({
    url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/cart/customTotals&token=' + token2,
    type: 'post',
    data: $('#customtotal input[type=\'text\'],#customtotal select'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-savecustomtotal').button('loading');
    },
    complete: function() {
      $('#button-savecustomtotal').button('reset');
    },
    success: function(json) {

      if (json['success']) {
        // Refresh products, vouchers and totals
        $('#button-refresh').trigger('click');
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
</script>

<script type="text/javascript">

$('#button-savecustomshipping').on('click', function() {
  $('.shippingmethod_success').hide();
  $('.addressmessages').hide();
  var shippingname = $('#shippingname').val();
  nocallagain = 0;
  $.ajax({
    url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/cart/customShipping&token=' + token2,
    type: 'post',
    data: $('#customtotal_shipping input[type=\'text\'],#customtotal_shipping select'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-savecustomshipping').button('loading');
    },
    complete: function() {
      $('#button-savecustomshipping').button('reset');
    },
    success: function(json) {

      if(json['error']) {
        $(".addressmessages").html('<div class="text-danger2">'+json['error']+'</div>').show();
      }

      if (json['success']) {
        // Refresh products, vouchers and totals
        if(shippingname == ""){
          customshipping = 0;
          $('.shippingmethod_success').hide();
        } else {
          customshipping = 1;
          $('.shippingmethod_success').html('<div class="text-success2"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>').show();
        }
         nocallagain = 0;
        $('#button-refresh').trigger('click');
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
</script>
<script type="text/javascript">


$('#button-savecustompayment').on('click', function() {
  $('.paymentmethod_success').hide();
  $('.addressmessages').hide();
   var paymentname = $('#paymentname').val();
  nocallagain = 0;
  $.ajax({
    url: $('select[name=\'store\'] option:selected').val() + 'index.php?route=api/cart/customPayment&token=' + token2,
    type: 'post',
    data: $('#customtotal_payment input[type=\'text\']'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-savecustompayment').button('loading');
    },
    complete: function() {
      $('#button-savecustompayment').button('reset');
    },
    success: function(json) {
      if(json['error']) {
        $(".addressmessages").html('<div class="text-danger2">'+json['error']+'</div>').show();
      }
      if (json['success']) {
        if(paymentname == ""){
          custompayment = 0;
          $('.paymentmethod_success').hide();
        } else {
          custompayment = 1;
          $('.paymentmethod_success').html('<div class="text-success2"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>').show();
        }
        // Refresh products, vouchers and totals
         nocallagain = 0;
        $('#button-refresh').trigger('click');
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
</script>
<?php } ?>
<script type="text/javascript"><!--
function country(element, index, zone_id) {
  $.ajax({
    url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + element.value,
    dataType: 'json',
    beforeSend: function() {
      $('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
    },
    complete: function() {
      $('.fa-spin').remove();
    },
    success: function(json) {
      if (json['postcode_required'] == '1') {
        $('input[name=\'postcode\']').parent().parent().addClass('required');
      } else {
        $('input[name=\'postcode\']').parent().parent().removeClass('required');
      }

      html = '<option value=""><?php echo $text_select; ?></option>';

      if (json['zone'] && json['zone'] != '') {
        for (i = 0; i < json['zone'].length; i++) {
          html += '<option value="' + json['zone'][i]['zone_id'] + '"';

          if (json['zone'][i]['zone_id'] == zone_id) {
            html += ' selected="selected"';
          }

          html += '>' + json['zone'][i]['name'] + '</option>';
        }
      } else {
        html += '<option value="0"><?php echo $text_none; ?></option>';
      }

      $('select[name=\'zone_id\']').html(html);
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
}
//--></script>
<script type="text/javascript">
$(document).delegate('select[name=\'customer_group_id\']', 'change', function() {
  $.ajax({
    url: 'index.php?route=customer/customer/customfield&token=<?php echo $token; ?>&customer_group_id=' + this.value,
    dataType: 'json',
    success: function(json) {
      $('.custom-field').hide();
      $('.custom-field').removeClass('required');

      for (i = 0; i < json.length; i++) {
        custom_field = json[i];

        $('.custom-field' + custom_field['custom_field_id']).show();

        if (custom_field['required']) {
          $('.custom-field' + custom_field['custom_field_id']).addClass('required');
        }
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});


// loading modal dialogue while adding to cart untill success
var waitingDialog = waitingDialog || (function ($) {
    'use strict';

  // Creating modal dialog's DOM
  var $dialog = $(
    '<div class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true" style="padding-top:15%; overflow-y:visible;">' +
    '<div class="modal-dialog modal-m">' +
    '<div class="modal-content">' +
      '<div class="modal-header"><h3 style="margin:0;"></h3></div>' +
      '<div class="modal-body">' +
        '<div class="progress progress-striped active" style="margin-bottom:0;"><div class="progress-bar" style="width: 100%"></div></div>' +
      '</div>' +
    '</div></div></div>');

  return {
    /**
     * Opens our dialog
     * @param message Custom message
     * @param options Custom options:
     *          options.dialogSize - bootstrap postfix for dialog size, e.g. "sm", "m";
     *          options.progressType - bootstrap postfix for progress bar type, e.g. "success", "warning".
     */
    show: function (message, options) {
      // Assigning defaults
      if (typeof options === 'undefined') {
        options = {};
      }
      if (typeof message === 'undefined') {
        message = 'Loading';
      }
      var settings = $.extend({
        dialogSize: 'm',
        progressType: '',
        onHide: null // This callback runs after the dialog was hidden
      }, options);

      // Configuring dialog
      $dialog.find('.modal-dialog').attr('class', 'modal-dialog').addClass('modal-' + settings.dialogSize);
      $dialog.find('.progress-bar').attr('class', 'progress-bar');
      if (settings.progressType) {
        $dialog.find('.progress-bar').addClass('progress-bar-' + settings.progressType);
      }
      $dialog.find('h3').text(message);
      // Adding callbacks
      if (typeof settings.onHide === 'function') {
        $dialog.off('hidden.bs.modal').on('hidden.bs.modal', function (e) {
          settings.onHide.call($dialog);
        });
      }
      // Opening dialog
      $dialog.modal();
    },
    /**
     * Closes dialog
     */
    hide: function () {
      $dialog.modal('hide');
    }
  };

})(jQuery);
</script>
<!-- Product Labels Script -->
<script type="text/javascript">
	var poppro = 0;
	var allproducts = 0;
	
	$(document).on('click','.productlabelpopup',function(e){
    e.preventDefault();
    select_label();
		$('#printModal').modal('show');
		poppro = $(this).attr("data-productid");
		allproducts = $("#prolab_proids").val();
	});
	
	$(document).on('click','.popupprintonelabel',function(e){
		$("#prolab_proids").val(poppro);
		var current_label 			= $("#popupprolabel").val();
		var current_template 		= $("#popupprotemplateid").val();
		var current_orientation 	= $("#popupproorientation").val();
		
		$("#prolab_templateid").val(current_template);
		$("#prolab_labelid").val(current_label);
		$("#prolab_orientation").val(current_orientation);
		$("#prolab_proids").val(poppro);
		$("#product_labels_form").submit();
		//$('#printModal').modal('hide');
	});
	
	$(document).on('click','.popupprintalllabel',function(e){
		$("#prolab_proids").val(poppro);
		var current_label 			= $("#popupprolabel").val();
		var current_template 		= $("#popupprotemplateid").val();
		var current_orientation 	= $("#popupproorientation").val();
		
		$("#prolab_templateid").val(current_template);
		$("#prolab_labelid").val(current_label);
		$("#prolab_orientation").val(current_orientation);
		$("#prolab_proids").val(allproducts);
		
		$("#product_labels_form").submit();
		//$('#printModal').modal('hide');
	});
	

	var token = '<?php echo $token; ?>';
	var label_element_type = ['rect', 'img', 'text', 'barcode'];
	var label_element_name = ['<?php echo $text_rect; ?>','<?php echo $text_img; ?>','<?php echo $text_text; ?>', '<?php echo $text_barcode; ?>'];
	var elements;
	var row = <?php echo $row; ?>;
	var autocomp_label_elements = {
		delay: 0,
		source: ["{Shipping_Address}","{firstname}","{lastname}","{address_1}","{address_2}","{city}","{postcode}","{zone}","{zone_code}","{country}","{iso_code_2}","{iso_code_3}","{company}","{method}","{comment}", "{payment_code}", "{payment_method}", "{shipping_method}", "{tracking_number}", "{order_id}", "{store_name}", "{customer_id}", "{currency_code}","{date_added}", "{date_modified}","{date}", "{kg}", "{gr}", "{lb}", "{oz}"],
		minLength: 0
	};
	var colorpicker_color={
		pickerDefault: "000000",
		colors: ["<?php echo join('","', explode(",",$settings['product_labels_fgcolours'])) ?>"],
		showHexField: false
	};
	var colorpicker_fill={
		pickerDefault: "FFFFFF",
		colors: ["<?php echo join('","', explode(",",$settings['product_labels_bgcolours'])) ?>"],
		showHexField: false
	};
	var error_saveas_template = '<?php echo $error_saveas_template; ?>';
	var error_nopdf = '<?php echo $error_nopdf; ?>';
	var error_pdf = '<?php echo $error_pdf; ?>';
	var error_delete_template = '<?php echo $error_delete_template; ?>';
	var error_delete_label = '<?php echo $error_delete_label; ?>';
	var error_saveas_label = '<?php echo $error_saveas_label; ?>';
	var text_add = '<?php echo $text_add; ?>';
	var text_tip_font_f = '<?php echo $text_tip_font_f; ?>';
	var text_font_f = '<?php echo $text_font_f; ?>';
	var text_tip_font_s = '<?php echo $text_tip_font_s; ?>';
	var text_font_s = '<?php echo $text_font_s; ?>';
	var text_tip_font_a = '<?php echo $text_tip_font_a; ?>';
	var text_font_a = '<?php echo $text_font_a; ?>';
	var text_tip_text = '<?php echo $text_tip_text; ?>';
	var text_text = '<?php echo $text_text; ?>';
	var text_tip_img = '<?php echo $text_tip_img; ?>';
	var text_img = '<?php echo $text_img; ?>';
	var text_tip_xpos = '<?php echo $text_tip_xpos; ?>';
	var text_xpos = '<?php echo $text_xpos; ?>';
	var text_tip_ypos = '<?php echo $text_tip_ypos; ?>';
	var text_ypos = '<?php echo $text_ypos; ?>';
	var text_tip_width = '<?php echo $text_tip_width; ?>';
	var text_width = '<?php echo $text_width; ?>';
	var text_tip_height = '<?php echo $text_tip_height; ?>';
	var text_height = '<?php echo $text_height; ?>';
	var text_tip_color = '<?php echo $text_tip_color; ?>';
	var text_color = '<?php echo $text_color; ?>';
	var text_tip_fill = '<?php echo $text_tip_fill; ?>';
	var text_fill = '<?php echo $text_fill; ?>';
	var text_addnew = '<?php echo $text_addnew; ?>';
	var text_option_delete = '<?php echo $text_option_delete; ?>';
	var text_placeholder_text = '<?php echo $text_placeholder_text; ?>';
	var text_placeholder_img = '<?php echo $text_placeholder_img; ?>';
	var text_placeholder_xpos = '<?php echo $text_placeholder_xpos; ?>';
	var text_placeholder_ypos = '<?php echo $text_placeholder_ypos; ?>';
	var text_placeholder_width = '<?php echo $text_placeholder_width; ?>';
	var text_placeholder_height = '<?php echo $text_placeholder_height; ?>';
	var update_needed = '<?php echo $update_needed; ?>';
	var this_version = '<?php echo $this_version; ?>';
	var new_version = '<?php echo $new_version ?>';
	var please_update = '<?php echo $please_update ?>';
	var settings = {product_labels_default_template:'<?php echo $settings['product_labels_default_template'] ?>',product_labels_default_pagew:'<?php echo $settings['product_labels_default_pagew']; ?>',product_labels_default_pageh:'<?php echo $settings['product_labels_default_pageh']; ?>',product_labels_default_label:'<?php echo $settings['product_labels_default_label'] ?>'}

	$(document).ready(function() {
		$('#pltabs a:first').tab('show');
		preview_template();
		preview_label();
		check_update();
	});
	$('#shipping_title,#shipping_value').on('change', function() {
		$("#input-shipping-method option[value='free.free']").attr('selected', 'selected');
    });
</script>
<!-- Product Labels Script -->

</div>
<?php echo $footer; ?>
