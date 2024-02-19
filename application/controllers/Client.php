<?php
defined('BASEPATH') or exit('No direct script access allowed');

/**
 *  Post Controller
 */
class Client extends CI_Controller
{

	function __construct()
	{
		parent::__construct();
		$this->load->model('crud');
	}

	public function index()
	{
		$data['data'] = $this->crud->get_records('client');
		$this->load->view('client/list', $data);
	}


	public function create()
	{
		$this->load->view('client/create');
	}


	public function store()
	{
		$data['nom_client'] = $this->input->post('nom_client');
		$data['solde'] = $this->input->post('solde');

		$this->crud->insert('client', $data);
		$this->session->set_flashdata('message', '<div class="alert alert-success">Ajout Resussit !!!</div>'); 
		redirect(base_url('client'));
	}

	public function edit($id)
	{
		$data['data'] = $this->crud->find_record_by_id('client', ['id_client' => $id]);
		$this->load->view('client/edit', $data);
	}

	public function update($id)
	{
		$data['nom_client'] = $this->input->post('nom_client');
		$data['solde'] = $this->input->post('solde');

		$this->crud->update('client', $data, ['id_client' =>$id]);
		$this->session->set_flashdata('message', '<div class="alert alert-success">Modification reussit !!!</div>');
		redirect(base_url('client'));
	}

	public function delete($id)
	{
		$this->crud->delete('client', ['id_client' => $id]);
		$this->session->set_flashdata('message', '<div class="alert alert-success">Suppression reussit !!!</div>');
		redirect(base_url('client'));
	}
}
