<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *  Post Controller
 */
class Audit extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
		$this->load->model('crud');
	}

	public function index()
	{
		if($this->session->userdata['email'] != null) {
			$data['data'] = $this->crud->get_records('audit');
			$this->load->view('audit/list', $data);			
		}  else{
			redirect('/');
		}
	}


	public function create()
	{
		$this->load->view('audit/create');
	}

}
