<?php
class ModelSaleOrder extends Model {
	public function getOrderCustomerId($order_id=0) {
		$cust_id=0;
		$sql1 = "SELECT customer_id FROM `" . DB_PREFIX . "order` WHERE order_id=".$order_id." ";
		$query1 = $this->db->query($sql1);
		$da_orders = $query1->rows;

		$cust_id = 0;

		if (!empty($da_orders)) {
			foreach ($da_orders as $da_order) {
			  $cust_id = $da_order['customer_id'];
			}
		}
		
		return $cust_id;
	}

	public function getTotalOrdersByCustomer($customer_id=0) {
		$sql = "SELECT count(*) as total FROM `" . DB_PREFIX . "order`";
		$sql .= " WHERE order_status_id > '0'";
		$sql .= " AND customer_id=".$customer_id." ";      

		$query = $this->db->query($sql);
		$total = $query->row['total'];

		if (!empty($total)) {
		  return $total;
		} else {
		  return 0;
		}
	}
	
	public function getOrder($order_id) {
		$order_query = $this->db->query("SELECT *, (SELECT CONCAT(c.firstname, ' ', c.lastname) FROM " . DB_PREFIX . "customer c WHERE c.customer_id = o.customer_id) AS customer FROM `" . DB_PREFIX . "order` o WHERE o.order_id = '" . (int)$order_id . "'");

		if ($order_query->num_rows) {
			$reward = 0;

			$order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

			foreach ($order_product_query->rows as $product) {
				$reward += $product['reward'];
			}

			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['payment_country_id'] . "'");

			if ($country_query->num_rows) {
				$payment_iso_code_2 = $country_query->row['iso_code_2'];
				$payment_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$payment_iso_code_2 = '';
				$payment_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['payment_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$payment_zone_code = $zone_query->row['code'];
			} else {
				$payment_zone_code = '';
			}

			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['shipping_country_id'] . "'");

			if ($country_query->num_rows) {
				$shipping_iso_code_2 = $country_query->row['iso_code_2'];
				$shipping_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$shipping_iso_code_2 = '';
				$shipping_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['shipping_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$shipping_zone_code = $zone_query->row['code'];
			} else {
				$shipping_zone_code = '';
			}

			if ($order_query->row['affiliate_id']) {
				$affiliate_id = $order_query->row['affiliate_id'];
			} else {
				$affiliate_id = 0;
			}

			$this->load->model('marketing/affiliate');

			$affiliate_info = $this->model_marketing_affiliate->getAffiliate($affiliate_id);

			if ($affiliate_info) {
				$affiliate_firstname = $affiliate_info['firstname'];
				$affiliate_lastname = $affiliate_info['lastname'];
			} else {
				$affiliate_firstname = '';
				$affiliate_lastname = '';
			}

			$this->load->model('localisation/language');

			$language_info = $this->model_localisation_language->getLanguage($order_query->row['language_id']);

			if ($language_info) {
				$language_code = $language_info['code'];
				$language_directory = $language_info['directory'];
			} else {
				$language_code = '';
				$language_directory = '';
			}

			return array(
				'order_id'                => $order_query->row['order_id'],
				'invoice_no'              => $order_query->row['invoice_no'],
				'invoice_prefix'          => $order_query->row['invoice_prefix'],
				'store_id'                => $order_query->row['store_id'],
				'store_name'              => $order_query->row['store_name'],
				'store_url'               => $order_query->row['store_url'],
				'customer_id'             => $order_query->row['customer_id'],
				'customer'                => $order_query->row['customer'],
				'customer_group_id'       => $order_query->row['customer_group_id'],
				'firstname'               => $order_query->row['firstname'],
				'lastname'                => $order_query->row['lastname'],
				'email'                   => $order_query->row['email'],
				'telephone'               => $order_query->row['telephone'],
				'fax'                     => $order_query->row['fax'],
				'custom_field'            => json_decode($order_query->row['custom_field'], true),
				'payment_firstname'       => $order_query->row['payment_firstname'],
				'payment_lastname'        => $order_query->row['payment_lastname'],
				'payment_company'         => $order_query->row['payment_company'],
				'payment_address_1'       => $order_query->row['payment_address_1'],
				'payment_address_2'       => $order_query->row['payment_address_2'],
				'payment_postcode'        => $order_query->row['payment_postcode'],
				'payment_city'            => $order_query->row['payment_city'],
				'payment_zone_id'         => $order_query->row['payment_zone_id'],
				'payment_zone'            => $order_query->row['payment_zone'],
				'payment_zone_code'       => $payment_zone_code,
				'payment_country_id'      => $order_query->row['payment_country_id'],
				'payment_country'         => $order_query->row['payment_country'],
				'payment_iso_code_2'      => $payment_iso_code_2,
				'payment_iso_code_3'      => $payment_iso_code_3,
				'payment_address_format'  => $order_query->row['payment_address_format'],
				'payment_custom_field'    => json_decode($order_query->row['payment_custom_field'], true),
				'payment_method'          => $order_query->row['payment_method'],

				'shipping_cost'           => $order_query->row['shipping_cost'],
				'payment_cost'            => $order_query->row['payment_cost'],	
				'extra_cost'              => $order_query->row['extra_cost'],				
			
				'payment_code'            => $order_query->row['payment_code'],
				'shipping_firstname'      => $order_query->row['shipping_firstname'],
				'shipping_lastname'       => $order_query->row['shipping_lastname'],
				'shipping_company'        => $order_query->row['shipping_company'],
				'shipping_address_1'      => $order_query->row['shipping_address_1'],
				'shipping_address_2'      => $order_query->row['shipping_address_2'],
				'shipping_postcode'       => $order_query->row['shipping_postcode'],
				'shipping_city'           => $order_query->row['shipping_city'],
				'shipping_zone_id'        => $order_query->row['shipping_zone_id'],
				'shipping_zone'           => $order_query->row['shipping_zone'],
				'shipping_zone_code'      => $shipping_zone_code,
				'shipping_country_id'     => $order_query->row['shipping_country_id'],
				'shipping_country'        => $order_query->row['shipping_country'],
				'shipping_iso_code_2'     => $shipping_iso_code_2,
				'shipping_iso_code_3'     => $shipping_iso_code_3,
				'shipping_address_format' => $order_query->row['shipping_address_format'],
				'shipping_custom_field'   => json_decode($order_query->row['shipping_custom_field'], true),
				'shipping_method'         => $order_query->row['shipping_method'],
				'shipping_code'           => $order_query->row['shipping_code'],
				'comment'                 => $order_query->row['comment'],
				'total'                   => $order_query->row['total'],
				'additional_cost'                   => $order_query->row['additional_cost'],
				'reward'                  => $reward,
				'order_status_id'         => $order_query->row['order_status_id'],
				'affiliate_id'            => $order_query->row['affiliate_id'],
				'affiliate_firstname'     => $affiliate_firstname,
				'affiliate_lastname'      => $affiliate_lastname,
				'commission'              => $order_query->row['commission'],
				'language_id'             => $order_query->row['language_id'],
				'language_code'           => $language_code,
				'language_directory'      => $language_directory,
				'currency_id'             => $order_query->row['currency_id'],
				'currency_code'           => $order_query->row['currency_code'],
				'currency_value'          => $order_query->row['currency_value'],
				'ip'                      => $order_query->row['ip'],
				'forwarded_ip'            => $order_query->row['forwarded_ip'],
				'user_agent'              => $order_query->row['user_agent'],
				'accept_language'         => $order_query->row['accept_language'],
				'date_added'              => $order_query->row['date_added'],
				'date_modified'           => $order_query->row['date_modified'],
				'authorization_amount'    => $order_query->row['authorization_amount']
			);
		} else {
			return;
		}
	}
	public function getOrderguest($order_id) {
		$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "' AND order_status_id > '0'");

		if ($order_query->num_rows) {
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['payment_country_id'] . "'");

			if ($country_query->num_rows) {
				$payment_iso_code_2 = $country_query->row['iso_code_2'];
				$payment_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$payment_iso_code_2 = '';
				$payment_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['payment_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$payment_zone_code = $zone_query->row['code'];
			} else {
				$payment_zone_code = '';
			}

			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$order_query->row['shipping_country_id'] . "'");

			if ($country_query->num_rows) {
				$shipping_iso_code_2 = $country_query->row['iso_code_2'];
				$shipping_iso_code_3 = $country_query->row['iso_code_3'];
			} else {
				$shipping_iso_code_2 = '';
				$shipping_iso_code_3 = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$order_query->row['shipping_zone_id'] . "'");

			if ($zone_query->num_rows) {
				$shipping_zone_code = $zone_query->row['code'];
			} else {
				$shipping_zone_code = '';
			}

			return array(
				'order_id'                => $order_query->row['order_id'],
				'invoice_no'              => $order_query->row['invoice_no'],
				'invoice_prefix'          => $order_query->row['invoice_prefix'],
				'store_id'                => $order_query->row['store_id'],
				'store_name'              => $order_query->row['store_name'],
				'store_url'               => $order_query->row['store_url'],
				'customer_id'             => $order_query->row['customer_id'],
				 'customer_group_id'	  => $order_query->row['customer_group_id'],
				'firstname'               => $order_query->row['firstname'],
				'lastname'                => $order_query->row['lastname'],
				'telephone'               => $order_query->row['telephone'],
				'fax'                     => $order_query->row['fax'],
				'email'                   => $order_query->row['email'],
				'payment_firstname'       => $order_query->row['payment_firstname'],
				'payment_lastname'        => $order_query->row['payment_lastname'],
				'payment_company'         => $order_query->row['payment_company'],
				'payment_address_1'       => $order_query->row['payment_address_1'],
				'payment_address_2'       => $order_query->row['payment_address_2'],
				'payment_postcode'        => $order_query->row['payment_postcode'],
				'payment_city'            => $order_query->row['payment_city'],
				'payment_zone_id'         => $order_query->row['payment_zone_id'],
				'payment_zone'            => $order_query->row['payment_zone'],
				'payment_zone_code'       => $payment_zone_code,
				'payment_country_id'      => $order_query->row['payment_country_id'],
				'payment_country'         => $order_query->row['payment_country'],
				'payment_iso_code_2'      => $payment_iso_code_2,
				'payment_iso_code_3'      => $payment_iso_code_3,
				'payment_address_format'  => $order_query->row['payment_address_format'],
				'payment_method'          => $order_query->row['payment_method'],

				'shipping_cost'           => $order_query->row['shipping_cost'],
				'payment_cost'            => $order_query->row['payment_cost'],	
				'extra_cost'              => $order_query->row['extra_cost'],				
			
				'shipping_firstname'      => $order_query->row['shipping_firstname'],
				'shipping_lastname'       => $order_query->row['shipping_lastname'],
				'shipping_company'        => $order_query->row['shipping_company'],
				'shipping_address_1'      => $order_query->row['shipping_address_1'],
				'shipping_address_2'      => $order_query->row['shipping_address_2'],
				'shipping_postcode'       => $order_query->row['shipping_postcode'],
				'shipping_city'           => $order_query->row['shipping_city'],
				'shipping_zone_id'        => $order_query->row['shipping_zone_id'],
				'shipping_zone'           => $order_query->row['shipping_zone'],
				'shipping_zone_code'      => $shipping_zone_code,
				'shipping_country_id'     => $order_query->row['shipping_country_id'],
				'shipping_country'        => $order_query->row['shipping_country'],
				'shipping_iso_code_2'     => $shipping_iso_code_2,
				'shipping_iso_code_3'     => $shipping_iso_code_3,
				'shipping_address_format' => $order_query->row['shipping_address_format'],
				'shipping_method'         => $order_query->row['shipping_method'],
				'comment'                 => $order_query->row['comment'],
				'total'                   => $order_query->row['total'],
				'order_status_id'         => $order_query->row['order_status_id'],
				'language_id'             => $order_query->row['language_id'],
				'currency_id'             => $order_query->row['currency_id'],
				'currency_code'           => $order_query->row['currency_code'],
				'currency_value'          => $order_query->row['currency_value'],
				'date_modified'           => $order_query->row['date_modified'],
				'date_added'              => $order_query->row['date_added'],
				'ip'                      => $order_query->row['ip']
			);
		} else {
			return false;
		}
	}
	public function getOrders($data = array()) {
		$sql = "SELECT o.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS status, o.shipping_code, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified FROM `" . DB_PREFIX . "order` o";

		if (!empty($data['filter_model'])) {
				$sql .= " LEFT JOIN `" . DB_PREFIX . "order_product` op  ON op.order_id = o.order_id";
			
		} 

		if (isset($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (isset($data['filter_payment_status'])) {
			if($data['filter_payment_status'] == 'nc'){
				$sql .= " AND payment_code = 'pp_express' AND o.payment_background = ''";
			}else{
				$sql .= " AND o.payment_background LIKE '" . $this->db->escape($data['filter_payment_status']) . "%'";
			}
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND o.order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_model'])) {
			
			$sql .= " AND op.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(o.firstname, ' ', o.lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_date_added_from']) ) {
			$sql .= " AND DATE(o.date_added) >= DATE('" . $this->db->escape($data['filter_date_added_from']) . "')";
		}
		 
			if (!empty($data['filter_date_added'])) {
			$temp=explode("-",$data['filter_date_added']);
			$sql .= " AND DATE(o.date_added) >= DATE('" . $this->db->escape(date ("Y-m-d",strtotime($temp[0]))) . "') AND DATE(o.date_added) <= DATE('" . $this->db->escape(date ("Y-m-d",strtotime($temp[1]))) . "')";
		}
		if (!empty($data['filter_date_modified'])) {
				$temp=explode("-",$data['filter_date_modified']);
			$sql .= " AND DATE(o.date_modified) >= DATE('" . $this->db->escape(date ("Y-m-d",strtotime($temp[0]))) . "') AND DATE(o.date_modified) <= DATE('" . $this->db->escape(date ("Y-m-d",strtotime($temp[1]))) . "')";
		}
	
		
		if (isset($data['filter_payment_method'])) {
			$implode = array();

			$payment_methods = explode(',', $data['filter_payment_method']);

			foreach ($payment_methods as $payment_method) {
				$implode[] = "o.payment_code = '" . $this->db->escape($payment_method) . "'";
			}

			if ($implode) {
				$sql .= " AND (" . implode(" OR ", $implode) . ")";
			}
		}
		
		if (isset($data['filter_sales_person'])) {
			$implode = array();

			$sales_persons = explode(',', $data['filter_sales_person']);

			foreach ($sales_persons as $sales_person) {
				$implode[] = "o.sales_person = '" . (int)$sales_person . "'";
			}

			if ($implode) {
				$sql .= " AND (" . implode(" OR ", $implode) . ")";
			}
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND o.total = '" . (float)$data['filter_total'] . "'";
		}
		
		if ( !isset($data['filter_order_type']) ) {
			$sql .=" AND o.order_type = 0 ";
		}
		
		if (isset($data['filter_order_type']) && $data['filter_order_type'] !== '*' ) {
			$sql .=" AND o.order_type = '" . (int)$data['filter_order_type'] . "'";
		}  
		
		//$sql .=" AND is_pos!=1 ";

		$sort_data = array(
			'o.order_id',
			'customer',
			'status',
			'o.date_added',
			'o.date_modified',
			'o.total'
		);

		$sql .= " GROUP BY o.order_id";

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY o.order_id";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getOrderProducts($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "'");

		return $query->rows;
	}

	public function getOrderOptions($order_id, $order_product_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_id . "' AND order_product_id = '" . (int)$order_product_id . "'");

		return $query->rows;
	}

	public function getOrderVouchers($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_id . "'");

		return $query->rows;
	}

	public function getOrderVoucherByVoucherId($voucher_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_voucher` WHERE voucher_id = '" . (int)$voucher_id . "'");

		return $query->row;
	}

	public function getOrderTotals($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$order_id . "' ORDER BY sort_order");

		return $query->rows;
	}


    public function saveCost($order_product_id, $cost) {
        $this->db->query("UPDATE " . DB_PREFIX . "order_product SET cost = '" . (float)$cost . "' WHERE order_product_id = '". $order_product_id . "'");

        $query = $this->db->query("SELECT cost FROM " . DB_PREFIX . "order_product WHERE order_product_id = '". $order_product_id . "'");
        $row = $query->row;

        return $row['cost'];
    }
	
    public function savePaymentCost($order_id, $payment_cost) {
        $this->db->query("UPDATE `" . DB_PREFIX . "order` SET payment_cost = '" . (float)$payment_cost . "' WHERE order_id = '" . (int)$order_id . "'");

        $query = $this->db->query("SELECT payment_cost FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "'");
        $row = $query->row;

        return $row['payment_cost'];
    }
	
    public function saveShippingCost($order_id, $shipping_cost) {
        $this->db->query("UPDATE `" . DB_PREFIX . "order` SET shipping_cost = '" . (float)$shipping_cost . "' WHERE order_id = '" . (int)$order_id . "'");

        $query = $this->db->query("SELECT shipping_cost FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "'");
        $row = $query->row;

        return $row['shipping_cost'];
    }
	
    public function saveExtraCost($order_id, $extra_cost) {
        $this->db->query("UPDATE `" . DB_PREFIX . "order` SET extra_cost = '" . (float)$extra_cost . "' WHERE order_id = '" . (int)$order_id . "'");

        $query = $this->db->query("SELECT extra_cost FROM `" . DB_PREFIX . "order` WHERE order_id = '" . (int)$order_id . "'");
        $row = $query->row;

        return $row['extra_cost'];
    }			
            
	public function getTotalOrders($data = array()) {
		$sql = "SELECT COUNT(*) AS total";

		if (!empty($data['filter_model'])) {
				
			$sql .= " FROM " . DB_PREFIX . "order_product op";
			$sql .= " INNER JOIN " . DB_PREFIX . "order o ON (op.order_id = o.order_id)";
		
		} else {
			$sql .= " FROM " . DB_PREFIX . "order o";
		}

		if (isset($data['filter_order_status'])) {
			$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}
		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}

		if (isset($data['filter_payment_status'])) {
			if($data['filter_payment_status'] == 'nc'){
				$sql .= " AND payment_code = 'pp_express' AND o.payment_background = ''";
			}else{
				$sql .= " AND o.payment_background LIKE '" . $this->db->escape($data['filter_payment_status']) . "%'";
			}
		}

		if (!empty($data['filter_order_id'])) {
			$sql .= " AND o.order_id = '" . (int)$data['filter_order_id'] . "'";
		}

		if (!empty($data['filter_model'])) {
			
			$sql .= " AND op.model LIKE '" . $this->db->escape($data['filter_model']) . "%'";
		}

		if (!empty($data['filter_customer'])) {
			$sql .= " AND CONCAT(o.firstname, ' ', o.lastname) LIKE '%" . $this->db->escape($data['filter_customer']) . "%'";
		}

		if (!empty($data['filter_date_added_from']) ) {
			$sql .= " AND DATE(o.date_added) >= DATE('" . $this->db->escape($data['filter_date_added_from']) . "')";
		}
		
			if (!empty($data['filter_date_added'])) {
			$temp=explode("-",$data['filter_date_added']);
			$sql .= " AND DATE(o.date_added) >= DATE('" . $this->db->escape(date ("Y-m-d",strtotime($temp[0]))) . "') AND DATE(o.date_added) <= DATE('" . $this->db->escape(date ("Y-m-d",strtotime($temp[1]))) . "')";
		}
		if (!empty($data['filter_date_modified'])) {
				$temp=explode("-",$data['filter_date_modified']);
			$sql .= " AND DATE(o.date_modified) >= DATE('" . $this->db->escape(date ("Y-m-d",strtotime($temp[0]))) . "') AND DATE(o.date_modified) <= DATE('" . $this->db->escape(date ("Y-m-d",strtotime($temp[1]))) . "')";
		}
		
		if (isset($data['filter_payment_method'])) {
			$implode = array();

			$payment_methods = explode(',', $data['filter_payment_method']);

			foreach ($payment_methods as $payment_method) {
				$implode[] = "o.payment_code = '" . $this->db->escape($payment_method) . "'";
			}

			if ($implode) {
				$sql .= " AND (" . implode(" OR ", $implode) . ")";
			}
		}
		
		if (isset($data['filter_sales_person'])) {
			$implode = array();

			$sales_persons = explode(',', $data['filter_sales_person']);

			foreach ($sales_persons as $sales_person) {
				$implode[] = "o.sales_person = '" . (int)$sales_person . "'";
			}

			if ($implode) {
				$sql .= " AND (" . implode(" OR ", $implode) . ")";
			}
		}

		if (!empty($data['filter_total'])) {
			$sql .= " AND o.total = '" . (float)$data['filter_total'] . "'";
		}
		
		if ( !isset($data['filter_order_type']) ) {
			$sql .=" AND o.order_type = 0 ";
		}
		
		if ( isset($data['filter_order_type']) && $data['filter_order_type'] !== '*' ) {
			$sql .=" AND o.order_type = '" . (int)$data['filter_order_type'] . "'";
		}
		
		//$sql .=" AND is_pos!=1 ";
//var_dump($sql);

		$sql .= " GROUP BY o.order_id";

		$query = $this->db->query($sql);

		return $query->num_rows;

		//return $query->row['total'];
	}

	public function getTotalOrdersByStoreId($store_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE store_id = '" . (int)$store_id . "'");

		return $query->row['total'];
	}

	public function getTotalOrdersByOrderStatusId($order_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE order_status_id = '" . (int)$order_status_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalOrdersByProcessingStatus() {
		$implode = array();

		$order_statuses = $this->config->get('config_processing_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE " . implode(" OR ", $implode));

			return $query->row['total'];
		} else {
			return 0;
		}
	}

	public function getTotalOrdersByCompleteStatus() {
		$implode = array();

		$order_statuses = $this->config->get('config_complete_status');

		foreach ($order_statuses as $order_status_id) {
			$implode[] = "order_status_id = '" . (int)$order_status_id . "'";
		}

		if ($implode) {
			$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE " . implode(" OR ", $implode) . "");

			return $query->row['total'];
		} else {
			return 0;
		}
	}

	public function getTotalOrdersByLanguageId($language_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE language_id = '" . (int)$language_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function getTotalOrdersByCurrencyId($currency_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "order` WHERE currency_id = '" . (int)$currency_id . "' AND order_status_id > '0'");

		return $query->row['total'];
	}

	public function createInvoiceNo($order_id) {
		$order_info = $this->getOrder($order_id);

		if ($order_info && !$order_info['invoice_no']) {
			$query = $this->db->query("SELECT MAX(invoice_no) AS invoice_no FROM `" . DB_PREFIX . "order` WHERE invoice_prefix = '" . $this->db->escape($order_info['invoice_prefix']) . "'");

			if ($query->row['invoice_no']) {
				$invoice_no = $query->row['invoice_no'] + 1;
			} else {
				$invoice_no = 1;
			}

			$this->db->query("UPDATE `" . DB_PREFIX . "order` SET invoice_no = '" . (int)$invoice_no . "', invoice_prefix = '" . $this->db->escape($order_info['invoice_prefix']) . "' WHERE order_id = '" . (int)$order_id . "'");

			return $order_info['invoice_prefix'] . $invoice_no;
		}
	}

	public function getOrderHistories($order_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT oh.date_added, os.name AS status, oh.comment, oh.notify FROM " . DB_PREFIX . "order_history oh LEFT JOIN " . DB_PREFIX . "order_status os ON oh.order_status_id = os.order_status_id WHERE oh.order_id = '" . (int)$order_id . "' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY oh.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalOrderHistories($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}

	public function getTotalOrderHistoriesByOrderStatusId($order_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order_history WHERE order_status_id = '" . (int)$order_status_id . "'");

		return $query->row['total'];
	}

	public function getEmailsByProductsOrdered($products, $start, $end) {
		$implode = array();

		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . (int)$product_id . "'";
		}

		$query = $this->db->query("SELECT DISTINCT email FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op ON (o.order_id = op.order_id) WHERE (" . implode(" OR ", $implode) . ") AND o.order_status_id <> '0' LIMIT " . (int)$start . "," . (int)$end);

		return $query->rows;
	}

	public function getTotalEmailsByProductsOrdered($products) {
		$implode = array();

		foreach ($products as $product_id) {
			$implode[] = "op.product_id = '" . (int)$product_id . "'";
		}

		$query = $this->db->query("SELECT DISTINCT email FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op ON (o.order_id = op.order_id) WHERE (" . implode(" OR ", $implode) . ") AND o.order_status_id <> '0'");

		return $query->row['total'];
	}
	public function getunitdataname($products_id){
		//echo "SELECT unit_singular,unit_plural FROM `" . DB_PREFIX . "product` WHERE products_id = '$products_id'";
		$query = $this->db->query("SELECT unit_singular,unit_plural FROM `" . DB_PREFIX . "product` WHERE product_id = '$products_id'");

        return $query->row;
	 }
	 
	 public function getDefaultUnitDetails($product_id){
		  $query = "SELECT ucv.name,ucp.convert_price,ucp.sort_order,ucp.unit_conversion_product_id
				  FROM ". DB_PREFIX ."unit_conversion_product ucp 
				  LEFT JOIN ". DB_PREFIX ."unit_conversion_value ucv on ucp.unit_value_id=ucv.unit_value_id 
				  WHERE ucp.convert_price = 1 AND product_id = '$product_id' order by sort_order LIMIT 0,1";
		  $query2 = $this->db->query($query);
		  return $query2->row;
    }
	
	public function orderHasImage($order_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_images WHERE order_id = '" . (int)$order_id . "' LIMIT 1");

		return $query->row ? true : false;
	}
	
	public function getSalesPerson($order_id) {
		$query = $this->db->query("SELECT sales_person FROM " . DB_PREFIX . "order WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['sales_person'];
	}
	
	public function getSalesPersons($usergroupid) {
		//echo print_r($usergroupid);exit;
		if(!empty($usergroupid)){
			$usergroupid = implode(',',$usergroupid);
		}else{
			$usergroupid = 0;
		}
		//echo $usergroupid;exit;
		$query = $this->db->query("SELECT user_id, username, CONCAT(firstname, ' ', lastname) as name FROM " . DB_PREFIX . "user WHERE user_group_id IN (".$usergroupid.")");
		return $query->rows;
	}
	
	public function getSalesPersonById($user_id) {
		$query = $this->db->query("SELECT CONCAT(firstname, ' ', lastname) as name FROM " . DB_PREFIX . "user WHERE user_id = '" . (int)$user_id . "'");

		return $query->row['name'];
	}
	
	public function addOrderHistory($order_id,$order_status_id, $comment)
	{
		$date_added = date("Y-m-d h:i:s");
		$this->db->query("INSERT INTO ".DB_PREFIX."order_history SET order_id='".(int)$order_id."',order_status_id='".(int)$order_status_id."',comment='".$comment."',date_added='".$date_added."'");
		
	}
	
	public function assignSalesPersontoOrder($order_id, $sales_person)
	{
		$this->db->query("UPDATE `" . DB_PREFIX . "order` SET sales_person = '" . (int)$sales_person . "' WHERE order_id = '" . (int)$order_id . "'");
	}
	
	public function getLatestOrderStatusId($order_id)
	{
		$query = $this->db->query("SELECT order_status_id FROM " . DB_PREFIX . "order_history WHERE order_id = '" . (int)$order_id . "' ORDER BY order_history_id DESC LIMIT 1");

		return $query->row['order_status_id'];
	}
	
	public function getOrderProduct($order_id,$product_id)
	{
		$qry = "SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_id . "' AND product_id = '".(int)$product_id."'";
		$query = $this->db->query($qry);
		return $query->row;
	}

}
