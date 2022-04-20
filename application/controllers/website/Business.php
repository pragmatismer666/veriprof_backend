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
class Business extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('business_model');
        $this->load->library('session');
        $this->isLoggedIn();   
    }
    function index()
    {          			
		$this->load->library('pagination');
		$result = $this->business_model->businesslistCount();
		$pageData = $this->paginationCompress ( "business/", $result["count"], 10 );
        $data['businessRecords'] = $this->business_model->businesslist($pageData["page"], $pageData["segment"]);
		$this->global['pageTitle'] = 'VeriProf : Business List';
		$this->loadViews("viewBusiness", $this->global, $data, NULL);       
    }

}
?>