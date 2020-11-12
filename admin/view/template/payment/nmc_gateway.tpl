<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-nmc-gateway" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-nmc-gateway" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-login"><?php echo $entry_login; ?></label>
            <div class="col-sm-10">
              <input type="text" name="nmc_gateway_login" value="<?php echo $nmc_gateway_login; ?>" placeholder="<?php echo $entry_login; ?>" id="input-login" class="form-control" />
              <?php if ($error_login) { ?>
              <div class="text-danger"><?php echo $error_login; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-key"><?php echo $entry_key; ?></label>
            <div class="col-sm-10">
              <input type="text" name="nmc_gateway_key" value="<?php echo $nmc_gateway_key; ?>" placeholder="<?php echo $entry_key; ?>" id="input-key" class="form-control" />
              <?php if ($error_key) { ?>
              <div class="text-danger"><?php echo $error_key; ?></div>
              <?php } ?>
            </div>
          </div>
          <!--
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-hash"><?php //echo $entry_hash; ?></label>
            <div class="col-sm-10">
              <input type="text" name="nmc_gateway_hash" value="<?php echo $nmc_gateway_hash; ?>" placeholder="<?php //echo $entry_hash; ?>" id="input-hash" class="form-control" />
            </div>
          </div>
          -->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-server"><?php echo $entry_server; ?></label>
            <div class="col-sm-10">
              <select name="nmc_gateway_server" id="input-server" class="form-control">
                <?php if ($nmc_gateway_server == 'live') { ?>
                <option value="live" selected="selected"><?php echo $text_live; ?></option>
                <?php } else { ?>
                <option value="live"><?php echo $text_live; ?></option>
                <?php } ?>
                <?php if ($nmc_gateway_server == 'test') { ?>
                <option value="test" selected="selected"><?php echo $text_test; ?></option>
                <?php } else { ?>
                <option value="test"><?php echo $text_test; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <!--
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-mode"><?php //echo $entry_mode; ?></label>
            <div class="col-sm-10">
              <select name="nmc_gateway_mode" id="input-mode" class="form-control">
                <?php if ($nmc_gateway_mode == 'live') { ?>
                <option value="live" selected="selected"><?php echo $text_live; ?></option>
                <?php } else { ?>
                <option value="live"><?php echo $text_live; ?></option>
                <?php } ?>
                <?php if ($nmc_gateway_mode == 'test') { ?>
                <option value="test" selected="selected"><?php echo $text_test; ?></option>
                <?php } else { ?>
                <option value="test"><?php echo $text_test; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          -->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-method"><?php echo $entry_method; ?></label>
            <div class="col-sm-10">
              <select name="nmc_gateway_method" id="input-method" class="form-control">
                <?php if ($nmc_gateway_method == 'authorization') { ?>
                <option value="authorization" selected="selected"><?php echo $text_authorization; ?></option>
                <?php } else { ?>
                <option value="authorization"><?php echo $text_authorization; ?></option>
                <?php } ?>
                <!--
                <?php if ($nmc_gateway_method == 'capture') { ?>
                <option value="capture" selected="selected"><?php echo $text_capture; ?></option>
                <?php } else { ?>
                <option value="capture"><?php //echo $text_capture; ?></option>
                <?php } ?>
                -->
                <?php if ($nmc_gateway_method == 'sale') { ?>
                <option value="sale" selected="selected"><?php echo $text_sale; ?></option>
                <?php } else { ?>
                <option value="sale"><?php echo $text_sale; ?></option>
                <?php } ?>                
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="<?php echo $help_total; ?>"><?php echo $entry_total; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="nmc_gateway_total" value="<?php echo $nmc_gateway_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
            <div class="col-sm-10">
              <select name="nmc_gateway_order_status_id" id="input-order-status" class="form-control">
                <?php foreach ($order_statuses as $order_status) { ?>
                <?php if ($order_status['order_status_id'] == $nmc_gateway_order_status_id) { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <!--
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-geo-zone"><?php //echo $entry_geo_zone; ?></label>
            <div class="col-sm-10">
              <select name="nmc_gateway_geo_zone_id" id="input-geo-zone" class="form-control">
                <option value="0"><?php echo $text_all_zones; ?></option>
                <?php foreach ($geo_zones as $geo_zone) { ?>
                <?php if ($geo_zone['geo_zone_id'] == $nmc_gateway_geo_zone_id) { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          -->
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="nmc_gateway_status" id="input-status" class="form-control">
                <?php if ($nmc_gateway_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-title-usa"><?php echo $entry_title_usa; ?></label>
            <div class="col-sm-10">
              <input type="text" name="nmc_gateway_title_usa" value="<?php echo $nmc_gateway_title_usa; ?>" placeholder="<?php echo $entry_title_usa; ?>" id="input-title-usa" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-title-nonusa"><?php echo $entry_title_nonusa; ?></label>
            <div class="col-sm-10">
              <input type="text" name="nmc_gateway_title_nonusa" value="<?php echo $nmc_gateway_title_nonusa; ?>" placeholder="<?php echo $entry_title_nonusa; ?>" id="input-title-nonusa" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="nmc_gateway_sort_order" value="<?php echo $nmc_gateway_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 