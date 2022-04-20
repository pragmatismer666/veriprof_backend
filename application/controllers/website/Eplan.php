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
class Eplan extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('plan_model');
        $this->load->library('session');
        $this->isLoggedIn();   
    }
    
    function index()
    {          			
		$this->load->library('pagination');
		$result = $this->plan_model->eplanlistCount();
		$pageData = $this->paginationCompress ( "project/", $result["count"], 10 );
        $data['eplanRecords'] = $this->plan_model->eplanlist($pageData["page"], $pageData["segment"]);
		$this->global['pageTitle'] = 'VeriProf : Eplan List';
		$this->loadViews("viewEplan", $this->global, $data, NULL);       
    }
}
?>