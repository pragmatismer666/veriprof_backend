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
class Report extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('report_model');
        $this->load->library('session');
        $this->isLoggedIn();   
    }
    function index()
    {          			
		$this->load->library('pagination');
		$result = $this->report_model->reportlistCount();
		$pageData = $this->paginationCompress ( "report/", $result["count"], 10 );
        $data['reportRecords'] = $this->report_model->reportlist($pageData["page"], $pageData["segment"]);
		$this->global['pageTitle'] = 'VeriProf : Report List';
		$this->loadViews("viewReport", $this->global, $data, NULL);       
    }
}
?>