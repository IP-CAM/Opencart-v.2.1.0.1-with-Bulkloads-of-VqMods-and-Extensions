<?php
class ControllerAdvancedMenuSeoSupercategoryMenuAdvancedSeo extends Controller { private $error = array(); private $all_links = false; private $BASE_URL = "http://support.ocmodules.com/register/?"; private $GETACCOUNTDETAILS_URL = "http://support.ocmodules.com/getAccountDetails/"; private $GETVERSION_URL = "http://support.ocmodules.com/getCurrentVersion2/"; private $EXTENSION=16; private $VERSIONINSTALLED="2.5"; public function index() { $this->load->language('advancedmenuseo/supercategorymenuadvanced_seo'); $this->load->model('advancedmenuseo/supercategorymenuadvancedseo'); $this->document->addScript('view/javascript/jquery/fancybox2/source/jquery.fancybox.pack.js'); $this->document->addStyle('view/javascript/jquery/fancybox2/source/jquery.fancybox.css'); $this->model_advancedmenuseo_supercategorymenuadvancedseo->CreateSeo(); if (($this->request->server['REQUEST_METHOD'] == 'POST')) { $this->load->model('module/supercategorymenuadvanced'); $this->model_module_supercategorymenuadvanced->editOneSetting('supercategorymenuadvanced', 'supercategorymenuadvanced_code',$this->request->post['supercategorymenuadvanced_code']); $this->session->data['success'] = $this->language->get('text_success'); } $data['breadcrumbs'] = array(); $data['breadcrumbs'][] = array( 'text' => $this->language->get('text_home'), 'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'), 'separator' => false ); $data['breadcrumbs'][] = array( 'text' => $this->language->get('heading_title'), 'href' => $this->url->link('advancedmenuseo/supercategorymenuadvancedseo', 'token=' . $this->session->data['token'], 'SSL'), 'separator' => ' :: ' ); $data['action'] = $this->url->link('advancedmenuseo/supercategorymenuadvancedseo', 'token=' . $this->session->data['token'], 'SSL'); $data['cancel'] = $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'); $data['success']=0; if (isset($this->error['warning'])) { $data['error_warning'] = $this->error['warning']; } else { $data['error_warning'] = ''; } $data['heading_title'] = $this->language->get('heading_title'); $data['text_edit'] = $this->language->get('text_edit'); $data['button_save'] = $this->language->get('button_save'); $data['button_exit'] = $this->language->get('button_exit'); $data['tab_categories'] = $this->language->get('tab_categories'); $data['tab_manufacturer'] = $this->language->get('tab_manufacturer'); $data['tab_attributes'] = $this->language->get('tab_attributes'); $data['tab_options'] = $this->language->get('tab_options'); $data['tab_product_infos'] = $this->language->get('tab_product_infos'); $data['tab_review'] = $this->language->get('tab_review'); $data['tab_stocks'] = $this->language->get('tab_stocks'); $data['tab_price'] = $this->language->get('tab_price'); $data['column_name'] = $this->language->get('column_name'); $data['path_name'] = $this->language->get('path_name'); $data['suggest'] = $this->language->get('suggest '); $data['seo_word'] = $this->language->get('seo_word'); $data['seo_explanation'] = $this->language->get('seo_explanation'); $data['tab_register'] = $this->language->get('tab_register'); $data['tab_contact'] = $this->language->get('tab_contact'); $data['register_status'] = $this->language->get('register_status'); $data[''] = $this->language->get(''); $data[''] = $this->language->get(''); $data[''] = $this->language->get(''); $data['current_version']=$this->VERSIONINSTALLED; $data['rg']=false; if (isset($this->request->post['supercategorymenuadvanced_code'])){ $data['settings_code']=$this->request->post['supercategorymenuadvanced_code']; }elseif ($this->config->get('supercategorymenuadvanced_code')) { $data['settings_code'] = $this->config->get('supercategorymenuadvanced_code'); }else{ $data['settings_code']="u"; } if ($data['settings_code']=="u"){ $data['supercategorymenuadvanced_accountDetails'] = "Extension not registered, please register to get support. <a class=\"register\" href=\"".$this->BASE_URL."&extension=".urlencode($this->EXTENSION)."&domain=".urlencode($_SERVER['SERVER_NAME'])."\"> Register</a>"; $this->error['warning'] = "<h4><i class=\"fa fa-exclamation-triangle\"></i> Warning! Unlicensed version of the module!</h4><p>You are running an unlicensed version of this module! You need to enter your license code to ensure proper functioning, access to support and updates.</p><div style=\"height:5px;\"></div><a class=\"btn btn-danger\" onclick=\"$('a[href=#tab-seo-register]').trigger('click')\" href=\"javascript:void(0)\">Register extension</a>"; }else{ $accountDetails = $this->get_accountDetails($this->config->get('supercategorymenuadvanced_code')); if(!isset($accountDetails) || ($accountDetails->error)){ $this->all_links = false; }else{ $this->all_links = true; } if ($this->all_links) { $data['supercategorymenuadvanced_accountDetails'] = "Thanks for register this extension, {$accountDetails->extension} for {$accountDetails->domain} , now you have full support on support.ocmodules.com"; $data['rg']=true; if(!$accountDetails->approved){ $this->error['warning'] = "<h4><i class=\"fa fa-exclamation-triangle\"></i> We are checking your license!</h4><p>Extension registered, waiting to be approved.</p><div style=\"height:5px;\"></div>"; } }else{ $data['supercategorymenuadvanced_accountDetails'] = "Extension not registered, please register to get support. <a class=\"register\" href=\"".$this->BASE_URL."&extension=".urlencode($this->EXTENSION)."&domain=".urlencode($_SERVER['SERVER_NAME'])."\"> Register</a>"; $this->error['warning'] = "Extension not registered, please register to get support."; } } if (isset($this->error['warning'])) { $data['error_warning'] = $this->error['warning']; } else { $data['error_warning'] = ''; } $data['token'] =$this->session->data['token']; $version_data = array(); $extensionDetails = $this->get_currentVersion(); if(isset($extensionDetails) && (!$extensionDetails->error)){ $data['version']['name']=$extensionDetails->extension_name; $data['version']['extension_opencart_url']=$extensionDetails->extension_opencart_url; $data['version']['current_version']=$extensionDetails->extension_current_version; $data['version']['whats_new']=addslashes($extensionDetails->extension_last_update); foreach($extensionDetails->other_modules as $other_modules){ $data['version']['modules'][]=array( 'name' =>$other_modules->extension_name, 'version' =>$other_modules->extension_current_version, 'extension_opencart_url' =>$other_modules->extension_opencart_url, 'resume' =>$other_modules->extension_description, 'video' =>$other_modules->extension_video, ); } } $page=1; $filter_data = array( 'sort' => 'name', 'order' => 'ASC', 'start' => ($page - 1) * $this->config->get('config_limit_admin'), 'limit' => $this->config->get('config_limit_admin') ); $data['product_infos']=array( array('productinfo_id'=>1,'name'=>"Width",'seo_word'=>$this->config->get('filter_width'), 'path'=> "filter_width=@value@",'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_width'))), array('productinfo_id'=>2,'name'=>"Height",'seo_word'=>$this->config->get('filter_height'), 'path'=> "filter_height=@value@",'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_height'))), array('productinfo_id'=>3,'name'=>"Length",'seo_word'=>$this->config->get('filter_length'), 'path'=> "filter_length=@value@", 'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_length'))), array('productinfo_id'=>4,'name'=>"Model",'seo_word'=>$this->config->get('filter_model'), 'path'=> "filter_model=@value@", 'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_model'))), array('productinfo_id'=>5,'name'=>"sku",'seo_word'=>$this->config->get('filter_sku'), 'path'=> "filter_sku=@value@",'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_sku'))), array('productinfo_id'=>6,'name'=>"UPC",'seo_word'=>$this->config->get('filter_upc'), 'path'=> "filter_upc=@value@",'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_upc'))), array('productinfo_id'=>7,'name'=>"Location",'seo_word'=>$this->config->get('filter_location'), 'path'=> "filter_location=@value@", 'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_location'))), array('productinfo_id'=>8,'name'=>"Weight",'seo_word'=>$this->config->get('filter_weight'), 'path'=> "filter_weight=@value@", 'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_weight'))), array('productinfo_id'=>9,'name'=>"EAN",'seo_word'=>$this->config->get('filter_ean'), 'path'=> "filter_ean=@value@", 'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_ean'))), array('productinfo_id'=>10,'name'=>"ISBN",'seo_word'=>$this->config->get('filter_isbn'), 'path'=> "filter_isbn=@value@", 'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_isbn'))), array('productinfo_id'=>11,'name'=>"MPN",'seo_word'=>$this->config->get('filter_mpn'), 'path'=> "filter_mpn=@value@", 'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_mpn'))), array('productinfo_id'=>12,'name'=>"Jan",'seo_word'=>$this->config->get('filter_jan'), 'path'=> "filter_jan=@value@", 'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_jan'))) ); $data['stock_reviews']=array( array('stock_review_id'=>1,'name'=>"New Arrivals",'seo_word'=>$this->config->get('filter_arrivals'), 'path'=> "filter_arrivals=yes",'suggest' => $this->SuggestSeoWordStock($this->language->get('entry_arrivals'))), array('stock_review_id'=>2,'name'=>"Special Price",'seo_word'=>$this->config->get('filter_special'), 'path'=> "filter_special=yes",'suggest' => $this->SuggestSeoWordStock($this->language->get('entry_special'))), array('stock_review_id'=>3,'name'=>"Clearance",'seo_word'=>$this->config->get('filter_clearance'), 'path'=> "filter_clearance=yes", 'suggest' => $this->SuggestSeoWordStock($this->language->get('entry_clearance'))), array('stock_review_id'=>4,'name'=>"With Stock",'seo_word'=>$this->config->get('filter_stock'), 'path'=> "filter_stock=yes", 'suggest' => $this->SuggestSeoWordStock($this->language->get('entry_stock'))), array('stock_review_id'=>5,'name'=>"Review",'seo_word'=>$this->config->get('filter_rating'), 'path'=> "filter_rating=@value@",'suggest' => $this->SuggestSeoWordPI($this->language->get('entry_review'))), ); $this->load->model('catalog/category'); $category_total = $this->model_catalog_category->getTotalCategories(); $results = $this->model_catalog_category->getCategories($filter_data); foreach ($results as $result) { $extradata=$this->model_catalog_category->getCategory($result['category_id']); $data['categories'][] = array( 'category_id' => $result['category_id'], 'name' => $result['name'], 'seo_word' => $extradata['keyword'], 'path' => "category_id=".$result['category_id'], 'suggest' => $this->SuggestSeoWord($result['category_id'],$result['name']) ); } $url = ''; $pagination = new Pagination(); $pagination->total = $category_total; $pagination->page = 1; $pagination->limit = $this->config->get('config_limit_admin'); $pagination->url = $this->url->link('advancedmenuseo/supercategorymenuadvancedseo/paginationcat', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL'); $data['pagination_cat'] = $pagination->render(); $data['results_cat'] = sprintf($this->language->get('text_pagination'), ($category_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($category_total - $this->config->get('config_limit_admin'))) ? $category_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $category_total, ceil($category_total / $this->config->get('config_limit_admin'))); $this->load->model('catalog/attribute'); $data['attributes'] = array(); $attribute_total = $this->model_catalog_attribute->getTotalAttributes(); $results = $this->model_catalog_attribute->getAttributes($filter_data); foreach ($results as $result) { $data['attributes'][] = array( 'attribute_id' => $result['attribute_id'], 'name' => $result['attribute_group'] . " - " . $result['name'], 'seo_word' => $this->config->get("filter_att[".$result['attribute_id']."]"), 'path' => "filter_att[".$result['attribute_id']."]=@value@", 'suggest' => $this->SuggestSeoWordatt($result['attribute_id'],$result['name']) ); } $url = ''; $pagination = new Pagination(); $pagination->total = $attribute_total; $pagination->page = 1; $pagination->limit = $this->config->get('config_limit_admin'); $pagination->url = $this->url->link('advancedmenuseo/supercategorymenuadvancedseo/paginationatt', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL'); $data['pagination_att'] = $pagination->render(); $data['results_att'] = sprintf($this->language->get('text_pagination'), ($attribute_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($attribute_total - $this->config->get('config_limit_admin'))) ? $attribute_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $attribute_total, ceil($attribute_total / $this->config->get('config_limit_admin'))); $data['options'] = array(); $option_total = count($this->model_advancedmenuseo_supercategorymenuadvancedseo->getTotalOptionsDescriptions()); $results = $this->model_advancedmenuseo_supercategorymenuadvancedseo->getOptionDescriptions($filter_data); foreach ($results as $result) { $option_name=$this->model_advancedmenuseo_supercategorymenuadvancedseo->getOptionName($result['option_id']); $data['options'][] = array( 'option_id' => $result['option_id'], 'name' => $option_name , 'seo_word' => $this->config->get("filter_opt[".$result['option_id']."]"), 'path' => "filter_opt[".$result['option_id']."]=@value@", 'suggest' => $this->SuggestSeoWordatt($result['option_id'],$option_name) ); } $url = ''; $pagination = new Pagination(); $pagination->total = $option_total; $pagination->page = 1; $pagination->limit = $this->config->get('config_limit_admin'); $pagination->url = $this->url->link('advancedmenuseo/supercategorymenuadvancedseo/paginationopt', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL'); $data['pagination_opt'] = $pagination->render(); $data['results_opt'] = sprintf($this->language->get('text_pagination'), ($option_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($option_total - $this->config->get('config_limit_admin'))) ? $option_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $option_total, ceil($option_total / $this->config->get('config_limit_admin'))); $this->load->model('catalog/manufacturer'); $manufacturer_total = $this->model_catalog_manufacturer->getTotalManufacturers(); $results = $this->model_catalog_manufacturer->getManufacturers($filter_data); foreach ($results as $result) { $extradata=$this->model_catalog_manufacturer->getManufacturer($result['manufacturer_id']); $data['manufacturers'][] = array( 'manufacturer_id' => $result['manufacturer_id'], 'name' => $result['name'], 'seo_word' => $extradata['keyword'], 'path' => "manufacturer_id=".$result['manufacturer_id'], 'suggest' => $this->SuggestSeoWord($result['manufacturer_id'],$result['name']) ); } $url = ''; $pagination = new Pagination(); $pagination->total = $manufacturer_total; $pagination->page = 1; $pagination->limit = $this->config->get('config_limit_admin'); $pagination->url = $this->url->link('advancedmenuseo/supercategorymenuadvancedseo/paginationman', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL'); $data['pagination_man'] = $pagination->render(); $data['results_man'] = sprintf($this->language->get('text_pagination'), ($manufacturer_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($manufacturer_total - $this->config->get('config_limit_admin'))) ? $manufacturer_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $manufacturer_total, ceil($manufacturer_total / $this->config->get('config_limit_admin'))); $data['header'] = $this->load->controller('common/header'); $data['column_left'] = $this->load->controller('common/column_left'); $data['footer'] = $this->load->controller('common/footer'); $this->response->setOutput($this->load->view('advancedmenuseo/supercategorymenuadvanced_seo.tpl', $data)); } public function paginationman (){ $this->load->language('advancedmenuseo/supercategorymenuadvanced_seo'); $data['column_name'] = $this->language->get('column_name'); $data['path_name'] = $this->language->get('path_name'); $data['suggest'] = $this->language->get('suggest '); $data['seo_word'] = $this->language->get('seo_word'); if (isset($this->request->get['page'])) { $page = $this->request->get['page']; } else { $page = 1; } $filter_data = array( 'sort' => 'name', 'order' => 'ASC', 'start' => ($page - 1) * $this->config->get('config_limit_admin'), 'limit' => $this->config->get('config_limit_admin') ); $this->load->model('catalog/manufacturer'); $manufacturer_total = $this->model_catalog_manufacturer->getTotalManufacturers(); $results = $this->model_catalog_manufacturer->getManufacturers($filter_data); foreach ($results as $result) { $extradata=$this->model_catalog_manufacturer->getManufacturer($result['manufacturer_id']); $data['manufacturers'][] = array( 'manufacturer_id' => $result['manufacturer_id'], 'name' => $result['name'], 'seo_word' => $extradata['keyword'], 'path' => "manufacturer_id=".$result['manufacturer_id'], 'suggest' => $this->SuggestSeoWord($result['manufacturer_id'],$result['name']) ); } $url = ''; $pagination = new Pagination(); $pagination->total = $manufacturer_total; $pagination->page = $page; $pagination->limit = $this->config->get('config_limit_admin'); $pagination->url = $this->url->link('advancedmenuseo/supercategorymenuadvancedseo/paginationman', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL'); $data['pagination_man'] = $pagination->render(); $data['results_man'] = sprintf($this->language->get('text_pagination'), ($manufacturer_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($manufacturer_total - $this->config->get('config_limit_admin'))) ? $manufacturer_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $manufacturer_total, ceil($manufacturer_total / $this->config->get('config_limit_admin'))); $this->response->setOutput($this->load->view('advancedmenuseo/supercategorymenuadvanced_man.tpl', $data)); } public function paginationcat (){ $this->load->language('advancedmenuseo/supercategorymenuadvanced_seo'); $data['column_name'] = $this->language->get('column_name'); $data['path_name'] = $this->language->get('path_name'); $data['suggest'] = $this->language->get('suggest '); $data['seo_word'] = $this->language->get('seo_word'); if (isset($this->request->get['page'])) { $page = $this->request->get['page']; } else { $page = 1; } $filter_data = array( 'sort' => 'name', 'order' => 'ASC', 'start' => ($page - 1) * $this->config->get('config_limit_admin'), 'limit' => $this->config->get('config_limit_admin') ); $this->load->model('catalog/category'); $category_total = $this->model_catalog_category->getTotalCategories(); $results = $this->model_catalog_category->getCategories($filter_data); foreach ($results as $result) { $extradata=$this->model_catalog_category->getCategory($result['category_id']); $data['categories'][] = array( 'category_id' => $result['category_id'], 'name' => $result['name'], 'seo_word' => $extradata['keyword'], 'path' => "category_id=".$result['category_id'], 'suggest' => $this->SuggestSeoWord($result['category_id'],$result['name']) ); } $url = ''; $pagination = new Pagination(); $pagination->total = $category_total; $pagination->page = $page; $pagination->limit = $this->config->get('config_limit_admin'); $pagination->url = $this->url->link('advancedmenuseo/supercategorymenuadvancedseo/paginationcat', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL'); $data['pagination_cat'] = $pagination->render(); $data['results_cat'] = sprintf($this->language->get('text_pagination'), ($category_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($category_total - $this->config->get('config_limit_admin'))) ? $category_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $category_total, ceil($category_total / $this->config->get('config_limit_admin'))); $data['token'] = $this->session->data['token']; $this->response->setOutput($this->load->view('advancedmenuseo/supercategorymenuadvanced_cat.tpl', $data)); } public function paginationatt (){ $this->load->language('advancedmenuseo/supercategorymenuadvanced_seo'); $data['column_name'] = $this->language->get('column_name'); $data['path_name'] = $this->language->get('path_name'); $data['suggest'] = $this->language->get('suggest '); $data['seo_word'] = $this->language->get('seo_word'); if (isset($this->request->get['page'])) { $page = $this->request->get['page']; } else { $page = 1; } $filter_data = array( 'sort' => 'name', 'order' => 'ASC', 'start' => ($page - 1) * $this->config->get('config_limit_admin'), 'limit' => $this->config->get('config_limit_admin') ); $this->load->model('catalog/attribute'); $this->load->model('advancedmenuseo/supercategorymenuadvancedseo'); $data['attributes'] = array(); $attribute_total = $this->model_catalog_attribute->getTotalAttributes(); $results = $this->model_catalog_attribute->getAttributes($filter_data); foreach ($results as $result) { $data['attributes'][] = array( 'attribute_id' => $result['attribute_id'], 'name' => $result['attribute_group'] . " - " .$result['name'], 'seo_word' => $this->config->get("filter_att[".$result['attribute_id']."]"), 'path' => "filter_att[".$result['attribute_id']."]=@value@", 'suggest' => $this->SuggestSeoWordatt($result['attribute_id'],$result['name']) ); } $url = ''; $pagination = new Pagination(); $pagination->total = $attribute_total; $pagination->page = $page; $pagination->limit = $this->config->get('config_limit_admin'); $pagination->url = $this->url->link('advancedmenuseo/supercategorymenuadvancedseo/paginationatt', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL'); $data['pagination_att'] = $pagination->render(); $data['results_att'] = sprintf($this->language->get('text_pagination'), ($attribute_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($attribute_total - $this->config->get('config_limit_admin'))) ? $attribute_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $attribute_total, ceil($attribute_total / $this->config->get('config_limit_admin'))); $data['token'] = $this->session->data['token']; $this->response->setOutput($this->load->view('advancedmenuseo/supercategorymenuadvanced_att.tpl', $data)); } public function paginationopt (){ $this->load->language('advancedmenuseo/supercategorymenuadvanced_seo'); $data['column_name'] = $this->language->get('column_name'); $data['path_name'] = $this->language->get('path_name'); $data['suggest'] = $this->language->get('suggest '); $data['seo_word'] = $this->language->get('seo_word'); if (isset($this->request->get['page'])) { $page = $this->request->get['page']; } else { $page = 1; } $filter_data = array( 'sort' => 'name', 'order' => 'ASC', 'start' => ($page - 1) * $this->config->get('config_limit_admin'), 'limit' => $this->config->get('config_limit_admin') ); $this->load->model('advancedmenuseo/supercategorymenuadvancedseo'); $data['options'] = array(); $option_total = count($this->model_advancedmenuseo_supercategorymenuadvancedseo->getTotalOptionsDescriptions()); $results = $this->model_advancedmenuseo_supercategorymenuadvancedseo->getOptionDescriptions($filter_data); foreach ($results as $result) { $option_name=$this->model_advancedmenuseo_supercategorymenuadvancedseo->getOptionName($result['option_id']); $data['options'][] = array( 'option_id' => $result['option_id'], 'name' => $option_name , 'seo_word' => $this->config->get("filter_opt[".$result['option_id']."]"), 'path' => "filter_opt[".$result['option_id']."]=@value@", 'suggest' => $this->SuggestSeoWordatt($result['option_id'],$option_name) ); } $url = ''; $pagination = new Pagination(); $pagination->total = $option_total; $pagination->page = $page; $pagination->limit = $this->config->get('config_limit_admin'); $pagination->url = $this->url->link('advancedmenuseo/supercategorymenuadvancedseo/paginationopt', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL'); $data['pagination_opt'] = $pagination->render(); $data['results_opt'] = sprintf($this->language->get('text_pagination'), ($option_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($option_total - $this->config->get('config_limit_admin'))) ? $option_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $option_total, ceil($option_total / $this->config->get('config_limit_admin'))); $data['token'] = $this->session->data['token']; $this->response->setOutput($this->load->view('advancedmenuseo/supercategorymenuadvanced_opt.tpl', $data)); } public function SuggestSeoWordStock($str){ $this->load->model('advancedmenuseo/supercategorymenuadvancedseo'); $suggest = array(); $slug= $this->model_advancedmenuseo_supercategorymenuadvancedseo->url_slug($str); $suggest[]= $slug; return $suggest; } public function SuggestSeoWordatt($id,$str){ $this->load->model('advancedmenuseo/supercategorymenuadvancedseo'); $suggest = array(); $slug= $this->model_advancedmenuseo_supercategorymenuadvancedseo->url_slug($str); $suggest[]="@value@"; $suggest[]= $slug."-@value@"; $suggest[]= "@value@-".$slug; $suggest[]=$id."-@value@"; $suggest[]="@value@-".$id; $suggest[]= $id.$slug."-@value@"; $suggest[]= $slug."-@value@-".$id; $suggest[]= $id."-@value@-".$slug; $suggest[]= "@value@-".$slug.$id; return $suggest; } public function SuggestSeoWord($id,$str){ $this->load->model('advancedmenuseo/supercategorymenuadvancedseo'); $suggest = array(); $names = explode("&nbsp;&nbsp;&gt;&nbsp;&nbsp;", $str); $name =end($names); $slug= $this->model_advancedmenuseo_supercategorymenuadvancedseo->url_slug($name); $suggest[]=$slug; $suggest[]= $id."-".$slug; if(count($names)>1){; $slug= $this->model_advancedmenuseo_supercategorymenuadvancedseo->url_slug(implode("-",$names)); $suggest[]=$slug; $suggest[]= $id."-".$slug; } return $suggest; } public function SuggestSeoWordPI($str){ $this->load->model('advancedmenuseo/supercategorymenuadvancedseo'); $suggest = array(); $slug= $this->model_advancedmenuseo_supercategorymenuadvancedseo->url_slug($str); $suggest[]="@value@"; $suggest[]= $slug."-@value@"; $suggest[]= "@value@-".$slug; return $suggest; } private function get_accountDetails($salt) { $detailurl = $this->GETACCOUNTDETAILS_URL; return json_decode($this->do_post_request($detailurl, array("salt" => $salt,"server"=>$_SERVER['SERVER_NAME'], "extension"=>$this->EXTENSION))); } private function get_currentVersion() { $detailurl = $this->GETVERSION_URL; return json_decode($this->do_post_request($detailurl, array("version_installed" => $this->VERSIONINSTALLED,"extension"=>$this->EXTENSION))); } public function save() { $this->load->language('advancedmenuseo/supercategorymenuadvanced_seo'); $json = array(); $this->load->model('advancedmenuseo/supercategorymenuadvancedseo'); if (empty($this->request->get['seo_word'])) { $json['error']['warning'] = $this->language->get('seo_word_empty'); } if (!$json) { $this->model_advancedmenuseo_supercategorymenuadvancedseo->KeywordUpdate($this->request->get['seo_word'],$this->request->get['path']); $json['success']=$this->language->get('seo_word_edit'); } $this->response->addHeader('Content-Type: application/json'); $this->response->setOutput(json_encode($json)); } private function do_post_request($url, $_data, $optional_headers = null) { $data = array(); while(list($n,$v) = each($_data)){ $data[] = urlencode($n)."=".urlencode($v); } $data = implode('&', $data); $ch = curl_init(); curl_setopt($ch, CURLOPT_URL, $url); curl_setopt($ch, CURLOPT_POST, true); curl_setopt($ch, CURLOPT_REFERER,$_SERVER['SERVER_NAME']); curl_setopt($ch, CURLOPT_POSTFIELDS, $data); curl_setopt($ch, CURLOPT_HEADER, false); curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); $response = curl_exec($ch); curl_close($ch); return $response; }  public function SetAllValues() { $this->load->model('module/supercategorymenuadvanced'); if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) { $this->model_module_supercategorymenuadvanced->editOneSetting('supercategorymenuadvanced', $this->request->post['dnd'],$this->request->post,$this->request->post['store_id']); $this->model_module_supercategorymenuadvanced->DeleteCacheValues($this->request->post['category_id'],$this->request->post['store_id']); } } private function validate() { if (!$this->user->hasPermission('modify', 'module/supercategorymenuadvanced')) { $this->error['warning'] = $this->language->get('error_permission'); } if (!$this->error) { return true; } else { return false; } } } ?>