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
class Project extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('project_model');
        $this->load->library('session');
        $this->isLoggedIn();   
    }
    
    function index()
    {          			
		$this->load->library('pagination');
		$result = $this->project_model->projectlistCount();
		$pageData = $this->paginationCompress ( "project/", $result["count"], 10 );
        $data['projectRecords'] = $this->project_model->projectlist($pageData["page"], $pageData["segment"]);
		$this->global['pageTitle'] = 'VeriProf : Project List';
		$this->loadViews("viewProject", $this->global, $data, NULL);       
    }
}
?>