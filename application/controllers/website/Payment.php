<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';
// include_once(__DIR__.'/Common.php');
/**
 * Class : User (UserController)
 * User Class to control all user related operations.
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Payment extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('common_model');
        $this->load->library('session');
        $this->isLoggedIn();   
    }
    
    /**
     * This function used to load the first screen of the user
     */
    public function index()
    {
        $this->global['pageTitle'] = 'VeriProf : Payment';
        $this->load->library('pagination');
		$count = $this->common_model->countRow("payment", array());
		$returns = $this->paginationCompress ( "payment/", $count, 15 );
		$roleId = $this->session->userdata('role');		
		$data['paymentRecords'] = $this->common_model->findAll("payment", "id", "asc");
        $this->loadViews("viewPayment", $this->global, $data , NULL);
    }

    function paymentList()
    {          			
		$searchText = $this->security->xss_clean($this->input->post('searchText'));
		$data['searchText'] = $searchText;		
		$this->global['pageTitle'] = 'VeriProf : User Listing';
		$this->loadViews("users", $this->global, $data, NULL);       
    }
}
?>