<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *  Post Controller
 */
class Virement extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
		$this->load->model('crud');
	}

	public function index()
	{
		if($this->session->userdata['email'] != null) {
			$data['data'] = $this->crud->get_records('virement');
			$this->load->view('virement/list', $data);		
		}  else{
			redirect('/');
		}
		
	}


	public function create()
	{
		$this->load->view('virement/create');
	}


	public function store()
	{
		$data['id_client'] = $this->input->post('id_client');
		$data['montant'] = $this->input->post('montant');
		$data['utilisateur'] = $this->session->userdata['email'];

		$this->crud->insert('virement', $data);
		$this->session->set_flashdata('message', '<div class="alert alert-success">Ajout Resussit !!!</div>'); 
		redirect(base_url('virement'));
	}

	public function edit($id)
	{
		$data['data'] = $this->crud->find_record_by_id('virement', ['id_vir' => $id]);
		$this->load->view('virement/edit', $data);
	}

	public function update($id)
	{
		$data['id_client'] = $this->input->post('id_client');
		$data['montant'] = $this->input->post('montant');
		$data['utilisateur'] = $this->session->userdata['email'];

		$this->crud->update('virement', $data, ['id_vir' =>$id]);
		$this->session->set_flashdata('message', '<div class="alert alert-success">Modification reussit !!!</div>');
		redirect(base_url('virement'));
	}

	public function delete($id)
	{
		$this->crud->delete('virement', ['id_vir' => $id]);
		$this->session->set_flashdata('message', '<div class="alert alert-success">Suppression reussit !!!</div>');
		redirect(base_url('virement'));
	}
}
