<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

include_once(__DIR__ . '/pdf/fpdf.php');
include_once(__DIR__ . '/Common.php');

class Accessor extends CI_Controller
{
    // private static $instance = null;
    public function __construct()
    {
        parent::__construct();
        $this->load->model('project_model');
        $this->load->model('user_model');
        $this->load->model('business_model');
        $this->load->model('schedule_model');
        $this->load->model('login_model');
        $this->load->model('report_model');
        $this->load->model('profile_model');
        $this->load->model('support_model');
        $this->load->model('plan_model');
    }
    // static public function getInstance() {
    //     if (self::$instance == null)
    //     {
    //         self::$instance = new Accessor();
    //     }    
    //     return self::$instance;
    // }
    public function response($data)
    {
        echo json_encode($data);
        return;
    }

    public function jsonInput()
    {
        $json = file_get_contents('php://input');
        return json_decode($json, true);
    }

    public function actionPendingPlan()
    {
        $data = $this->jsonInput();
        $objs = $this->user_model->verficationProf($data['user_id'], $data['verified']);
        return $this->response(['status' => 'success', 'data' => $objs]);
    }

    //  user get and update -----------------------------------------------------------------------------------------------
    public function upUser()
    {
        $data = $this->jsonInput();
        if (isset($data['pass'])) {
            $passcheck = $this->user_model->checkPassword($data['user_id'], $data['pass']);
            if ($passcheck) {
                if ($data['key'] == 'delete') {
                    try {
                        $userInfo = array('isDeleted' => 1, 'updatedDtm' => date('Y-m-d H:i:s'));
                        $result = $this->user_model->deleteUser($data['user_id'], $userInfo);
                        return $this->response(['status' => 'success', 'data' => 'Delete as perfectly.']);
                    } catch (\Throwable $th) {
                        return $this->response(['status' => 'error', 'data' => 'Get Problem in remove.']);
                    }
                } else if ($data['key'] == 'update') {
                    $userInfo = array(
                        'password' => getHashedPassword($data['data']['newpass']),
                        'name' => ucwords($data['data']['name']), 'updatedDtm' => date('Y-m-d H:i:s')
                    );
                    $result = $this->user_model->editUser($userInfo, $data['user_id']);
                    if ($result) {
                        $objs = $this->user_model->getUserInfo($data['user_id']);
                        return $this->response(['status' => 'success', 'data' => $objs]);
                    } else {
                        return $this->response(['status' => 'error', 'data' => 'Please input correct Old password']);
                    }
                }
                return $this->response(['status' => 'error', 'data' => 'Problem in editUser.']);
            } else {
                return $this->response(['status' => 'error', 'data' => 'Please input correct Old password']);
            }
        } else {
            $name = $this->user_model->upUserAvatur($data);
            if ($name == false) {
                return $this->response(['status' => 'error', 'data' => 'Have problem in save Image.']);
            }
            return $this->response(['status' => 'success', 'data' => $name]);
        }
    }
    // plan 
    public function getEplans()
    {
        $objs = $this->plan_model->getplans(array());
        return $this->response(['status' => 'success', 'data' => $objs]);
    }
    // project step
    public function getProjects()
    {
        $projects = $this->project_model->getProjects();
        return $this->response(['status' => 'success', 'data' => $projects]);
    }
    // ------------------------------------------------------------------------------------------------ updated use function ------------------

    public function getVerifiedProf()
    {
        $objs = $this->user_model->getVerifiedProf();
        return $this->response(['status' => 'success', 'data' => $objs]);
    }

    public function getUnverifyProfiles()
    {
        $objs = $this->profile_model->getProfile(array('status' => 'Unverified'));
        return $this->response(['status' => 'success', 'data' => $objs]);
    }

    public function getProf()
    {
        $objs = $this->profile_model->getProfile(array());
        for ($i = 0; $i < sizeof($objs); $i++) {
            $email = $this->db->select('email')->from('tbl_users')->where('userId', (int)($objs[$i]->user_id))->get()->result();
            $objs[$i]->email = $email[0]->email;
        }
        return $this->response(['status' => 'success', 'data' => $objs]);
    }

    public function getVerified()
    {
        $data = $this->jsonInput();
        $input = array('verified_by' => $data['verified_by'], 'status' => $data['status']);
        $verified_business = $this->business_model->getBusiness($input);
        $verified_profile = $this->profile_model->getProfile($input);
        return $this->response(['status' => 'success', 'data' => [sizeof($verified_business), sizeof($verified_profile)]]);
    }

    public function verifyProf()
    {
        $data = $this->jsonInput();
        $key = array('id' => (int)($data['profile_id']));
        $update = array('verified_by' => $data['user_id'], 'verified_at' => date('Y-m-d h:i:s'), 'status' => 'Verified');
        $result = $this->profile_model->updateProfile_accessor($key, $update);
        if ($result) {
            return $this->response(['status' => 'success', 'data' => 'Verified as successfully.']);
        } else {
            return $this->response(['status' => 'error', 'data' => 'Get problem in verify.']);
        }
    }

    public function getUnverifyBusiness()
    {
        $business = $this->business_model->getBusiness(array('status' => 'Unverified'));
        $objs = [];
        for ($i = 0; $i < sizeof($business); $i++) {
            $key = array('buzi_id' => (int)($business[$i]->id), 'status' => 'Unverified');
            $offices = $this->support_model->getOffices($key);
            for ($j = 0; $j < sizeof($offices); $j++) {
                $offices[$j]->pname = $business[$i]->pname;
                $offices[$j]->pcouncil = $business[$i]->pcouncil;
                $offices[$j]->pcipc_reg_no = $business[$i]->pcipc_reg_no;
                $offices[$j]->director = $business[$i]->director;
                $offices[$j]->dir_prof_regno = $business[$i]->dir_prof_regno;
                $offices[$j]->owned = $business[$i]->owned;
                $offices[$j]->ptype = $business[$i]->ptype;
                array_push($objs, $offices[$j]);
            }
        }
        return $this->response(['status' => 'success', 'data' => $objs]);
    }

    public function verifyBusiness()
    {
        $data = $this->jsonInput();
        $key = array('id' => (int)($data['office_id']), 'buzi_id' => (int)($data['business_id']));
        $update = array('verify_by' => $data['user_id'], 'verify_at' => date('Y-m-d h:i:s'), 'status' => 'Verified');
        $result = $this->support_model->updateOffices($key, $update);
        if ($result) {
            return $this->response(['status' => 'success', 'data' => 'Verified as successfully.']);
        } else {
            return $this->response(['status' => 'error', 'data' => 'Get problem in verify.']);
        }
    }

    // ------------------------------------------- Schedule
    public function getSchedule()
    {
        $result = $this->db->select('*')->from('tbl_schedule')->get()->result();
        $this->response(['status' => 'success', 'data' => $result]);
    }

    public function putSchedule()
    {
        $data = $this->jsonInput();
        $key = $data['data'];
        $key['created_by'] = $data['user_id'];
        $schedules = $this->schedule_model->addNew($key);
        return $this->response(['status' => 'success', 'data' => $schedules, 'message' => 'Invite Shared Successfully']);
    }
    //  ------------------------------------------------------------------------------------------------ Business Part ------------------

    public function addReport()
    {
        $input             = $this->jsonInput();
        if ($input == null) {
            return null;
        }
        $input['created_at'] = date('Y-m-d h:i:s');
        $common = new Common();
        $input['filename'] = $common->createReportPDF($input);
        // return $this->response(['status' => 'success', 'data' => $input ]);
        $input['data'] = json_encode($input['data']);
        $id = $this->report_model->addNew($input);
        if ($id == "false") {
            return $this->response(['status' => 'error', 'data' => $input]);
        } else {
            return $this->response(['status' => 'success', 'data' => $input]);
        }

        // $professEmail = $this->user_model->getProfessEmail($input["profess_name"]);
        // try {
        //     $verified = "Hi ".$input["profess_name"].",  ".$input["accessor"]." is submitted report about you. Title is ".$input["report_title"].".You can check content by downloading report in your report tab.";
        //     $common -> sendEmail($professEmail,$verified);
        //     return $this->response(['status' => 'success', 'data' => $professEmail, 'message' => 'Successfully Inserted']);
        // } catch (\Throwable $th) {
        //     return $this->response(['status' => 'success', 'data' => "limited", 'message' => 'Successfully Inserted']);
        // }
    }
}
