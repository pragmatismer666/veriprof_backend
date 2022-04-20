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
class Office extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('office_model');
        $this->load->library('session');
        $this->isLoggedIn();   
    }
    
    function index()
    {          			
		$this->load->library('pagination');
		$result = $this->office_model->officelistCount();
		$pageData = $this->paginationCompress ( "office/", $result["count"], 10 );
        $data['officeRecords'] = $this->office_model->officelist($pageData["page"], $pageData["segment"]);
		$this->global['pageTitle'] = 'VeriProf : Office List';
		$this->loadViews("viewOffice", $this->global, $data, NULL);
    }
}
?>