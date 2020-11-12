<?php  
class ControllerQuickCheckoutTerms extends Controller {
  	public function index() {
		$data = $this->load->language('checkout/checkout');
		$data = array_merge($data, $this->load->language('quickcheckout/checkout'));
		
		if ($this->config->get('config_checkout_id')) {
			$this->load->model('catalog/information');
			
			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));
			
			if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_checkout_id'), true), $information_info['title'], $information_info['title']);
			} else {
				$data['text_agree'] = '';
			}
		} else {
			$data['text_agree'] = '';
		}
		
		// All variables
		$data['confirmation_page'] = $this->config->get('quickcheckout_confirmation_page');
		
		$proceed_button_text = $this->config->get('quickcheckout_proceed_button_text');
		
		if (!empty($proceed_button_text[$this->config->get('config_language_id')])) {
			$data['button_continue'] = $proceed_button_text[$this->config->get('config_language_id')];
		}
		
		if (version_compare(VERSION, '2.2.0.0', '<')) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/quickcheckout/terms.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/quickcheckout/terms.tpl', $data);
			} else {
				return $this->load->view('default/template/quickcheckout/terms.tpl', $data);
			}
		} else {
			return $this->load->view('quickcheckout/terms', $data);
		}
	}
	
	public function validate() {
		$this->load->language('checkout/checkout');
		$this->load->language('quickcheckout/checkout');
		
		$json = array();
		
		if ($this->config->get('config_checkout_id')) {
			$this->load->model('catalog/information');
				
			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));
				
			if ($information_info && !isset($this->request->post['agree'])) {
				$json['error']['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
			}
		}
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}