<?php echo $header; ?>
<style type="text/css">

<!--

div.scroll {
  height: 200px;
  width: 100%;
  overflow: auto;
  border: 1px solid black;
  background-color: #ccc;
  padding: 8px;
}

.list td a.link {
  text-decoration: underline;
  color: blue;
}

#import_status {
  color: black;
}

.mark_valid {
	font-size: 24px;
	color: green;
	padding: 8px;
	display:none; 
}

-->
</style>

<?php echo $column_left; ?>
<div id="content">

	<?php if (!empty($is_wrong_db)) { ?>

		<div class="container-fluid">
		  <h1>Database is not compatible with the extension.</h1>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i>
				Please re-install the extension at the 'Ka Extensions' page.</br>
				It means you need to click 'Uninstall' link and after the page refreshes click on the 'Install' link. 
				That should help make the database up to date for the current version of the import extension.
			</div>
  <p>
  </p>
  </br>

  <?php } elseif ($params['step'] == 1) { ?>

		<div class="page-header">  
			<div class="container-fluid">
				<div class="pull-right">
						<button type="submit" form="form-input" data-toggle="tooltip" class="btn btn-primary"><?php echo $this->t('Import'); ?></button>
				</div>
				<h1><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h1>
				<?php echo $ka_breadcrumbs; ?>
			</div>
		</div>

		<div class="container-fluid">
			<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
			<?php } ?>
			<?php if (!$success) { ?>
				<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> Please note model number is required for all products in csv.
					<button type="button" class="close" data-dismiss="alert">&times;</button>
				</div>
			<?php } ?>
			<?php echo $ka_top; ?>

			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-input">
				<input type="hidden" name="mode" value="" />
				
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $this->t('General'); ?></a></li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane active" id="tab-general">
						<table class="table table-condensed table-striped table-hover">
							<tr>
								<td width="25%"><label class="control-label"><span data-toggle="popover" data-content="<b>'Local computer'</b> - you upload a file from your computer.<br /><br /><b>'Server'</b> - file location is on the server where the site is installed. The file on the server should be resided within the store directory.">File Location</span></label></td>
								<td>
										<input type="radio" name="location" value="local" onclick="javascript: activateLocation('local');" <?php if ($params['location'] == 'local') { ?> checked="checked" <?php } ?> /> Local computer
										&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="location" value="server" onclick="javascript: activateLocation('server');" <?php if ($params['location'] == 'server') { ?> checked="checked" <?php } ?> /> Server
								</td>
								<td width="50%">&nbsp;</td>
							</tr>

							<tr id="local_location" <?php if ($params['location'] != 'local') { ?>style="height: 90px; display:none" <?php } ?>>
								<td width="25%"><label class="control-label"><span data-toggle="popover" data-content="A csv file is widely used data format.<br/><br/>For opencart stores we recommend CSV files generated by '<a href=&quot;http://www.opencart.com/index.php?route=extension/extension/info&amp;extension_id=20085&quot; target=&quot;_blank&quot;>CSV Product Export</a>' extension because their structure and columns are fully supported.">File</span></label></td>
								<td>
									<?php if (!empty($params['file_name'])) { ?>
										<div id="file_uploaded">
											<input type="hidden" name="is_file_uploaded" value="Y" />										
											<?php echo $params['file_name']; ?>
											<button type="button" onclick="javascript: resetFile();">Clear</button>
										</div>
									<?php } ?>
									<div id="file_upload" <?php if (!empty($params['file_name'])) { ?> style="display:none" <?php } ?>>
										<input id="input_file" type="file" name="file" /> <br />
										<span class="help-block">Max. file size (server limit): <?php echo $max_file_size; ?></span>
									</div>
								</td>
								<td width="50%">&nbsp;</td>
							</tr>

							<tr id="server_location" <?php if ($params['location'] != 'server') { ?>style="height: 90px; display:none" <?php } ?>>
								<td width="25%"><label class="control-label">File path</label></td>
								<td nowrap="nowrap" colspan="2"><?php echo $store_root_dir . DIRECTORY_SEPARATOR; ?><input type="text" name="file_path" size="50" value="<?php echo $params['file_path']; ?>" />
								<br />
								<input type="checkbox" name="rename_file" value="Y" <?php if (!empty($params['rename_file'])) { ?> checked="checked" <?php } ?> />
								Rename the file after successful import
								</td>
							</tr>
							
							<tr>
								<td width="25%"><label class="control-label">Field Delimiter</label></td>
								<td colspan="2">
									<input type="hidden" id="delimiter_option" name="delimiter_option" value="<?php echo $params['delimiter_option']; ?>" />
									<table width="600px">
									
										<tr id="predefined_delimiter_row" <?php if ($params['delimiter_option'] != 'predefined') { ?> style="display:none" <?php } ?>>
											<td width="280px">
												<?php echo KaElements::showSelector("delimiter", $delimiters, $params['delimiter'], 'onchange="javascript: resetMark(\'delimiter\');" style="width:300px;"'); ?>
												<br /><a href="javascript: void(0);" onclick="javascript: activateDelimiter('custom');">define manually</a>
											</td>
											<td><i <?php if (!empty($delimiter_is_ok)) { ?> style="display: inline" <?php } ?>class="fa fa-check mark_valid"></i></td>
										</tr>

										<tr id="custom_delimiter_row" <?php if ($params['delimiter_option'] == 'predefined') { ?> style="display:none" <?php } ?>>
											<td width="250px">
												<input type="text" style="width: 290px" id="custom_delimiter" name="custom_delimiter" value="<?php echo $params['delimiter']; ?>" />
												<br /><a href="javascript: void(0);" onclick="javascript: activateDelimiter('predefined');">select from predefined values</a>
											</td>
											<td>&nbsp;</td>
										</tr>
									</table>
									<span class="help-block"></span>
								</td>
							</tr>

							<tr>
								<td width="25%"><label class="control-label"><span data-toggle="popover" data-content="You have to be aware of the import file charset. Use ISO-8859-1 if your data consists of Latin characters only.">File Charset</span></label></td>
								<td colspan="2">
									<input type="hidden" id="charset_option" name="charset_option" value="<?php echo $params['charset_option']; ?>" />
									<table width="600px">

										<tr id="predefined_charset_row" <?php if ($params['charset_option'] != 'predefined') { ?> style="display:none" <?php } ?>>
											<td width="280px">
												<?php echo KaElements::showSelector("charset", $charsets, $params['charset'], 'onchange="javascript: resetMark(\'charset\');" style="width:300px;"'); ?>
												<br /><a href="javascript: void(0);" onclick="javascript: activateCharset('custom');">define manually</a>
											</td>
											<td><i <?php if (!empty($charset_is_ok)) { ?> style="display: inline" <?php } ?>class="fa fa-check mark_valid"></i></td>
										</tr>

										<tr id="custom_charset_row" <?php if ($params['charset_option'] == 'predefined') { ?> style="display:none" <?php } ?>>
											<td width="250px">
												<input type="text" style="width: 290px" id="custom_charset" name="custom_charset" value="<?php echo $params['charset']; ?>" />
												<br /><a href="javascript: void(0);" onclick="javascript: activateCharset('predefined');">select from predefined values</a>
											</td>
											<td>&nbsp;</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td width="25%"><label class="control-label"><span data-toggle="popover" data-content="The mode affects only data with multiple records (categories, specials, discounts, etc.).<br/><br/> In the <b>'Add'</b> mode all related information is added to the product.<br /><br />In the <b>'Replace'</b> mode old records related to the product are deleted first. It might be useful for updating special prices, discounts.">Import Mode</span></label></td>
								<td>
									<select name="update_mode" style="width: 300px">
										<option <?php if ($params['update_mode'] == 'add') { ?>selected="selected" <?php } ?>value="add">Add new records (safe) </option>
										<option value="add">Replace old records </option>
									</select>
								</td>
								<td width="50%">&nbsp;</td>
							</tr>
							<tr>
								<td width="25%"><label class="control-label">Language</label></td>
								<td>
									<?php if (count($languages) > 1) { ?>
										<select name="language_id" style="width: 300px">
											<?php foreach ($languages as $language) { ?>
												<option value="<?php echo $language['language_id']; ?>" <?php if ($language['language_id'] == $params['language_id']) { ?>selected="selected"<?php } ?>><?php echo $language['name']; ?></option>
											<?php } ?>
										</select>
									<?php } else { ?>
										<?php $language = reset($languages); echo $language['name']; ?>
										<input type="hidden" name="language_id" value="<?php echo $language['language_id']; ?>" />
									<?php } ?>
								</td>
								<td width="50%">&nbsp;</td>
							</tr>
							<tr>
								<td width="25%"><label class="control-label">Store</label></td>
								<td>
									<?php if (count($stores) > 1) { ?>
										<select name="store_ids[]" multiple="multiple" size="5" style="width: 300px">
											<?php foreach($stores as $store) { ?>
												<option <?php if (in_array($store['store_id'], $params['store_ids'])) { ?>selected="selected" <?php } ?>value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
											<?php } ?>
										</select>
									<?php } else { ?>
										<?php $store = reset($stores); echo $store['name']; ?>
										<input type="hidden" name="store_id" value="<?php echo $store['store_id']; ?>" />
									<?php } ?>
									<div class="arrow bottom"></div>
								</td>
								<td width="50%">&nbsp;</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
		</div>

		
<script type="text/javascript"><!--

function activateLocation(id) {
  if (id == 'server') {
    $('#local_location').hide();
    $('#server_location').fadeIn(500);
  } else if (id == 'local') {
    $('#server_location').hide();
    $('#local_location').fadeIn(500);
  }
}


function activateCharset(id) {
  if (id == 'predefined') {
    $('#custom_charset_row').hide();
    $('#predefined_charset_row').show();
    $('#charset_option').val('predefined');

  } else if (id == 'custom') {
    $('#predefined_charset_row').hide();
    $('#custom_charset_row').show();
    $('#charset_option').val('custom');
  }
}

function activateDelimiter(id) {
  if (id == 'predefined') {
    $('#custom_delimiter_row').hide();
    $('#predefined_delimiter_row').show();
    $('#delimiter_option').val('predefined');

  } else if (id == 'custom') {
    $('#predefined_delimiter_row').hide();
    $('#custom_delimiter_row').show();
    $('#delimiter_option').val('custom');
  }
}


function loadProfile() {

  $("#form-input input[name='mode']").prop('value', 'load_profile');
  $("#form-input").submit();
}


function deleteProfile() {

  $("#form-input input[name='mode']").prop('value', 'delete_profile');
  $("#form-input").submit();
}

$('input[name=\'tpl_product\']').autocomplete({
  delay: 0,
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=tool/ka_product_import/completeTpl&token=<?php echo $token; ?>',
      type: 'POST',
      dataType: 'json',
      data: 'filter_name=' + encodeURIComponent(request),
      success: function(data) {
        response($.map(data, function(item) {
          return {
            label: item.name,
            value: item.product_id
          }
        }));
      }
    });

  },
  select: function(item) {

    $("input[name='tpl_product']").prop('value', item.label).prop('disabled', 'disabled');
    $("input[name='tpl_product_id']").prop('value', item.value);
    $("#view_tpl_product").prop('href', '<?php echo $product_url; ?>' + '&product_id=' + item.value);
    $("#tpl_product_actions").css('display', 'inline');

    return false;
  }
});


function clearTplProduct() {

    $("input[name='tpl_product']").prop('value', '').removeAttr('disabled');
    $("input[name='tpl_product_id']").prop('value', '');
    $("#view_tpl_product").removeProp('href');
    $("#tpl_product_actions").hide();
}

function resetFile() {

	$('#file_uploaded').hide();
	$('#file_uploaded > input').prop('disabled', true);
	
	$('#file_upload').show();
}

function resetMark(param) {

	if (param == 'delimiter') {
		$('#predefined_delimiter_row > td > .mark_valid').hide();
	} else {
		$('#predefined_charset_row > td > .mark_valid').hide();
	}
}

function ka_OnBlobLoadEnd(evt) {

	if (evt.target.readyState != FileReader.DONE) {
		return;
	}
	
	var file_data = evt.target.result;
	
  $.ajax({
    url: 'index.php?route=tool/ka_product_import/examineFileData&token=<?php echo $token; ?>',
    type: 'POST',
    dataType: 'json',
    data: 'file_data=' + encodeURIComponent(file_data.match(/,(.*)$/)[1]),
		beforeSend: function() {
		},
		complete: function() {
		},
    success: function(data) {
    
    	if (data.error) {
    		$.ka.alert(data.error, 'E');
    		return;
    	}
    	
    	if (data.delimiter) {
    		$('select[name="delimiter"] option[value="' + data['delimiter'] + '"]').prop('selected', true);
    		
    		if ($('#delimiter_option').val() == 'predefined') {
					$('#predefined_delimiter_row > td > .mark_valid').fadeIn(750);
				}
    	}
    	
    	if (data.charset) {
	    	$('select[name="charset"] option[value="' + data['charset'] + '"]').prop('selected', true);
	    	
	    	if ($('#charset_option').val() == 'predefined') {
					$('#predefined_charset_row > td > .mark_valid').fadeIn(750);
				}
    	}
    }
        
  });
}

var max_server_file_size = <?php echo $max_server_file_size; ?>;

function ka_InputFileHandler(evt) {

  var files = evt.target.files;
	if (!files.length) {
		return;
	}

	resetMark('delimiter');
	resetMark('charset');
	
	if (files[0].size > max_server_file_size) {
		$.ka.alert('The file size exceeds limits defined by the server. File content might be truncated. You should upload the file to the server manually through ftp/scp protocol and specify <b>"File Location"</b> as <b>"Server"</b>', 
			'E'
		);
	}

	var xls_pattern = new RegExp("\.[xml]$", "i");
	if (xls_pattern.test(files[0].name)) {
		$.ka.alert('Be careful. The file has xml extension. The import works with CSV files only.', 'E');
	}
		
	var xls_pattern = new RegExp("\.[xls|xlsx]$", "i");
	if (xls_pattern.test(files[0].name)) {
		$.ka.alert('Be careful. The file has MS Excel file extension. The import works with CSV files only. You can save the XLS file as a CSV file in MS Excel.', 'E');
	}

	var xls_pattern = new RegExp("\.[zip|arj|rar]$", "i");
	if (xls_pattern.test(files[0].name)) {
		$.ka.alert('Be careful. The file has an archive extension. The import works with CSV files only.', 'E');
	}
	
	var blob = files[0].slice(0, 1024 * 4);
	var reader = new FileReader();
	reader.onloadend  = ka_OnBlobLoadEnd;
	reader.readAsDataURL(blob);
	
}

$(document).ready(function() {

	if (window.File && window.FileReader && window.FileList && window.Blob) {
		$('#input_file').on('change', ka_InputFileHandler);
	}

	$('[data-toggle=\'popover\']').popover({
			html: true,
			trigger:'click hover focus',
			delay: {show:"300", "hide": 1500}
	});

	$().alert();
	
	$('#backup_warning').on('closed.bs.alert', function () {

		$.ajax({
			url: 'index.php?route=tool/ka_product_import/saveWarning&token=<?php echo $token; ?>',
			type: 'POST',
			data: 'warning_closed=' + encodeURIComponent('1'),
			dataType: 'json'
		});

	})

			
});

//--></script>

  <?php }  ?>

	
</div>

<?php echo $footer; ?>