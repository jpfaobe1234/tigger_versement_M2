<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->library(['form_validation','session']);
	}

	public function index()
	{
		$this->load->view('login/login_page');
	}

	//verifier login 
	public function login(){
		//load session library
		$this->load->library('session');
 
		$email = $_POST['email'];
		$password = $_POST['password'];
 
        $data = $this->db->get_where('users', array('email'=>$email, 'password'=>$password))->row_array();

		if($data){
			$this->session->set_userdata($data);
            if ($data['role'] == 'admin') {
                redirect('audit');                
            } else {
                redirect('virement');  
            }
		}
		else{
			header('location:'.base_url().$this->index());
			$this->session->set_flashdata('error','Invalid login. User not found');
		} 
	}

    /*deconnection*/
    public function logout(){
		//load session library
		$this->session->sess_destroy();
		redirect('/');
	}
}
