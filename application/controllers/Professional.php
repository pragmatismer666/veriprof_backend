<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

include_once(__DIR__ . '/Common.php');

class Professional extends CI_Controller
{
    private static $instance = null;
    public function __construct()
    {
        parent::__construct();
        $this->load->model('profile_model');
        $this->load->model('project_model');
        $this->load->model('plan_model');
        $this->load->model('business_model');
        $this->load->model('report_model');
        $this->load->model('verify_model');
        $this->load->model('support_model');
        $this->load->model('bid_model');
    }
    static public function getInstance()
    {
        if (self::$instance == null) {
            self::$instance = new Professional();
        }
        return self::$instance;
    }

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
    //  -------------------------------------------------------------  Profile -------------------
    public function addProfile()
    {
        $data = $this->jsonInput();
        if ($data == null) {
            return null;
        }
        $input = $data["data"];
        $input["user_id"] = $data["user_id"];
        $input["updated_at"] = date('Y-m-d h:i:s');
        // log_message("debug", json_encode($input));
        if (strpos($input["appointment"], " ")) {
            $input["appointment"] = str_replace(" ", "_", $input["appointment"]);
        }
        if (strpos($input["pratical_certification"], " ")) {
            $input["pratical_certification"] = str_replace(" ", "_", $input["pratical_certification"]);
        }
        if (strpos($input["cv"], " ")) {
            $input["cv"] = str_replace(" ", "_", $input["cv"]);
        }
        $result = $this->profile_model->addNew($input);
        if ($result == 'error') {
            return $this->response(["status" => 'error', 'result' => "false", 'message' => 'Insert Error']);
        } else if ($result == "update") {
            return $this->response(["status" => "success", 'result' => $result, 'message' => 'Successfully Update, Already Registered']);
        } else {
            // $verified = "Your Profile is added as successfully.";
            // $common = new Common();
            // $common->sendEmail($input['email'], $verified);
            return $this->response(["status" => "success", 'result' => $result, 'message' => 'Profile Updated, please check email for verification.']);
        }
        // email. verify number Code ****
        // $send_email = $data['send_mail'];
        // $check_values['name'] = $data['user_name'];
        // $check_values['verify_id'] = $data['check_id'];
        // $check_values['reg_id'] = $data['reg_id'];
        // $check_result = $this->verify_model->checkUser($check_values);
        // if ($check_result == "true") {           
        //     $verification_code = $this->getVerifyNumberCode(); 
        //     $verified = "Your ID is verified ID.  The Verification Code is : ".$verification_code;
        //     $this->sendEmail($send_email,$verified);

        //     $verify_message = 'Your ID is ID is validate, Profile Created please check email for verification.';
        //     $reg_num['reg_number'] = $data['reg_id'];
        //     $this->profile_model->registerProfile($reg_num,$data['user_id']);
        // }
        // else{
        //     $verify_message = 'Profile Created please check email for verification.';
        //     $email_message = 'Thank you '.$data['user_name'].' for creating your VeriProd profile. 
        //     Your details has been sent to the various  governing bodies for further verification. 
        //     In the next 24hours, you will get an update about your profile...';
        //     $this->sendEmail($send_email,$email_message);
        // }  
        // return $this->response(["status" => "success",'file' => $input['file'],'message' => $verify_message]);             
    }

    public function getProfile()
    {
        $data  = $this->jsonInput();
        $objs = $this->profile_model->getProfile(array('user_id' => $data['user_id']));
        // log_message('debug', json_encode($objs));
        if (sizeof($objs) > 0) {
            return $this->response(["status" => "success", "data" => $objs['0']]);
        } else {
            return $this->response(["status" => 'noexist', "data" => $objs]);
        }
    }

    public function updatePay()
    {
        $data = $this->jsonInput();
        $input['account'] = $data['account'];
        $input['account_updated'] = date('Y-m-d');
        $this->profile_model->updateProfile($input, $data['user_id']);
        $created_by['created_by'] = $data['user_id'];
        $objs = $this->profile_model->getByCreatedBy($created_by);
        return $this->response(["status" => "success", 'personal' => $objs]);
    }

    public function checkRegister()
    {
        $data = $this->jsonInput();
        $objs = $this->profile_model->checkProfessRegister($data['user_id']);
        return $this->response(["status" => "success", "data" => $objs, 'message' => 'Successfully']);
    }

    public function getProfess()
    {
        $result = $this->profile_model->getallProfiles();
        return $this->response(["status" => "success", "data" => $result, 'message' => 'Successfully']);
    }
    //  ========================================================================================= Project Part ==================
    public function addProject()
    {
        $data = $this->jsonInput();
        $input = $data["data"];
        $input['created_by'] = $data['user_id'];
        $input['completed_at'] = "";
        $id = $this->project_model->addNew($input);
        if ($id == false) {
            return $this->response(["status" => 'error', 'message' => 'Insert Error']);
        } else if ($id == "exist") {
            return $this->response(["status" => "success", 'id' => $id, 'message' => 'Project Name and Type is same with Old project.']);
        }
        return $this->response(["status" => "success", 'id' => $id, 'message' => 'Successfully Inserted']);
    }

    public function getProject()
    {
        $data = $this->jsonInput();
        $input['created_by'] = $data['user_id'];
        $objs = $this->project_model->getByCreatedBy($input);
        return $this->response(["status" => "success", "data" => $objs]);
    }

    public function actionProject()
    {
        $data = $this->jsonInput();
        $objs = $this->project_model->changeProjectstatus($data);
        return $this->response(["status" => "success", "data" => $objs]);
    }

    public function requestVerificationProject(){
        $data = $this->jsonInput();
        log_message("debug", json_encode($data));
        $result = $this->project_model->updateProject($data["user_id"], $data["project_id"], ["status_verify" => "1"]);
        if ( $result != false ) {
            return $this->response(["status" => "success", "data" => $result, "message" => "Request Verification as Successfully"]);
        } else {
            return $this->response(["status" => "false", "data" => $result, "message" => "There is no current project!"]);
        }
    }
    //  ========================================================================================= Eplan Part ==================
    public function addPlan()
    {
        $data = $this->jsonInput();
        if ($data == null) {
            return null;
        }
        $input = $data["data"];
        $common = new Common();
        $verification_code = $common->getVerifyNumberCode();
        $resultCertificate = $common->createEplanPdf($input);
        if ($resultCertificate == "false") {
            return $this->response(["status" => 'error', 'message' => 'Insert Error']);
        }
        $input['verify_code'] = $verification_code;
        $input['created_by'] = $data['user_id'];
        $input['created_at'] = date('Y-m-d h:i:s');
        $input['certificate'] = $resultCertificate;
        $id = $this->plan_model->addNew($input);
        if ($id == false) {
            return $this->response(["status" => 'error', 'message' => 'Insert Error']);
        } else {
            $email_text = 'Your plan is submitted as successefully, Submission Confirmation Code is ' . $verification_code;
            // $mailResult = $common->sendEmail($input['contact_email'], $email_text);
            $objs = $this->plan_model->getplans(array('created_by' => $data['user_id']));
            return $this->response(["status" => "success", "data" => $objs, 'message' => 'Successfully Inserted']);
        }
    }

    public function getPlan()
    {
        $data = $this->jsonInput();
        $objs = $this->plan_model->getplans(array('created_by' => $data['user_id']));
        return $this->response(["status" => "success", "data" => $objs]);
    }
    //  ====================================================================================== Business Part =================
    public function addBusiness()
    {
        $data  = $this->jsonInput();
        $input = $data["data"];
        $head = $data['hoffice'];
        $directors = $data['directors'];
        $branchs = $data['branchs'];
        $staffs = $data["staffs"];
        $softs = $data["softs"];
        $hards = $data["hards"];
        $input['created_by'] = $data['user_id'];
        $input['updated_at'] = date('Y-m-d h:i:s');
        $input['verified_by'] = '';
        $input['verified_at'] = '';
        $id = $this->business_model->addNew($input);
        if ($id == false) {
            return $this->response(["status" => 'error', 'message' => 'Insert Error']);
        } else {
            if (sizeof($branchs) > 0) {
                // log_message("debug", json_encode($branchs));
                $result0 = $this->support_model->addOffice($head, $branchs, $id, $data['user_id']);
                if ($result0 == false) {
                    return $this->response(["status" => 'error', 'message' => 'Insert Error, saved only business']);
                }
            }
            if (sizeof($directors) > 0) {
                // log_message("debug", json_encode($branchs));
                $result01 = $this->support_model->addDirectors($directors, $id, $data['user_id']);
                if ($result01 == false) {
                    return $this->response(["status" => 'error', 'message' => 'Insert Error, saved only branchs']);
                }
            }
            if (sizeof($staffs) > 0) {
                $result1 = $this->support_model->addStaff($staffs, $id, $data['user_id'], $result0);
                if ($result1 == false) {
                    return $this->response(["status" => 'error', 'message' => 'Saved Offices and Directors.']);
                } else {
                    return $this->response(["status" => "success", 'message' => 'Saved everything as successfully.']);
                }
            }
            // return $this->response(["status" => "success",'id' =>$result0, 'message' => 'Saved everything as successfully.']);
            // if (sizeof($softs) == 0) {
            //     return $this->response(["status" => "success", 'message' => 'Updated successfully.']);
            // }
            if (sizeof($softs) > 0) {
                $result2 = $this->support_model->addEquip($softs, $id, $data['user_id'], 'soft');
                if ($result2 == false) {
                    return $this->response(["status" => 'error', 'message' => 'Insert Error, saved offices, Directors, Staffs']);
                }
            }
            // if (sizeof($hards) == 0) {
            //     return $this->response(["status" => "success", 'message' => 'Updated successfully.']);
            // }
            if (sizeof($hards) > 0) {
                $result3 = $this->support_model->addEquip($hards, $id, $data['user_id'], 'hard');
                if ($result3 == false) {
                    return $this->response(["status" => 'error', 'message' => 'Insert Error, saved offices']);
                }
            }
            // $this->profile_model->updateProfile(array('buzi_id'=>$id, 'office_id'=>$result0), $data['user_id'] );
            // if (sizeof($staffs) == 0) {
            //     return $this->response(["status" => "success", 'message' => 'Updated successfully.']);
            // }            
            return $this->response(["status" => "success", 'message' => 'Saved everything as successfully.']);
        }
    }

    public function getBusiness()
    {
        $data = $this->jsonInput();
        $objs = $this->business_model->getBusinessProfess($data['user_id']);
        return $this->response(["status" => "success", "data" => $objs]);
    }

    public function getBranchs()
    {
        $data = $this->jsonInput();
        $objs = $this->support_model->mybranchs($data['user_id']);
        return $this->response(["status" => "success", "data" => $objs]);
    }

    public function addBstaffs()
    {
        $data = $this->jsonInput();
        $staffs = $data['staffs'];
        $offices = $data['offices'];
        $created_by = $data['user_id'];
        $num = $data['all'];
        $bstaffs = 0;
        for ($i = 0; $i < sizeof($offices); $i++) {
            try {
                if (sizeof($staffs[$i]) > 0) {
                    $result_offices = $this->support_model->getOffices(["address" => $offices[$i]["address"], "phone" => $offices[$i]["phone"], "email" => $offices[$i]["email"]]);
                    if (sizeof($result_offices) > 0) {
                        $result = $this->support_model->addStaff($staffs[$i], (int)($result_offices[0]->buzi_id), $created_by, $result_offices[0]->id);
                        if ($result == true) {
                            $bstaffs++;
                        }
                    }
                }
            } catch (\Throwable $th) {
                return $this->response(["status" => "success", "data" => $th]);
            }
        }
        if ($bstaffs == $num) {
            return $this->response(["status" => "success", "data" => " Saved Branch staffs as successfully."]);
        } else {
            return $this->response(["status" => 'error', "data" => "Please input correct data."]);
        }
    }

    public function getList()
    {
        $data = $this->jsonInput();
        $blist = $this->business_model->getlist();
        $olist = $this->support_model->getlist();
        $value = $this->support_model->getId($data['user_id']);
        return $this->response(["status" => "success", "data" => [$blist, $olist, $value]]);
    }

    public function saveId()
    {
        $data = $this->jsonInput();
        $result = $this->support_model->ids($data['buzi_id'], $data['office_id'], $data['user_id']);
        if ($result) {
            return $this->response(["status" => "success", "data" => "Saved as successfully."]);
        }
    }

    public function getPendingBusiness()
    {
        $data = $this->jsonInput();
        $input['created_by'] = $data['user_id'];
        $objs = $this->business_model->getPendingByCreatedBy($input);
        return $this->response(["status" => "success", "data" => $objs]);
    }

    public function checkStaff()
    {
        // log_message("debug", " === --------------------");
        $data = $this->jsonInput();
        if (isset($data['email'])) {
            $objs = $this->support_model->getStaff(array('email' => $data['email']));
            // log_message("debug", json_encode($objs));
            if ($objs == false) {
                return $this->response(["status" => "success", "data" => 'no']);
            }
        }
        return $this->response(["status" => "success", "data" => 'no']);
    }

    public function verifyStaff()
    {
        $data = $this->jsonInput();
        $objs = $this->support_model->upStaff($data['email'], $data['key']);
        if ($objs == false) {
            return $this->response(["status" => "success", "data" => 'no']);
        }
        return $this->response(["status" => "success", "data" => '']);
    }
    //  ====================================================================================== Business End ==================

    //  ====================================================================================== Report ==========================
    public function getReport()
    {
        $data = $this->jsonInput();
        $objs = $this->report_model->getReport();
        return $this->response(["status" => "success", "data" => $objs]);
    }

    public function getMyReport()
    {
        $data = $this->jsonInput();
        $response_data = array();
        $objs_bid = $this->bid_model->getBid($data['user_id']);
        for ($i = 0; $i < sizeof($objs_bid); $i++) {
            $each_data = array("type" => "Bid", "client_name" => $objs_bid[$i]->client_department, "file" => "bid/" . $objs_bid[$i]->file, "created_at" => strval($objs_bid[$i]->created_at));
            array_push($response_data, $each_data);
        }
        $objs_plan = $this->plan_model->getplans(array('created_by' => $data['user_id']));
        for ($i = 0; $i < sizeof($objs_plan); $i++) {
            $each_data = array("type" => "Plan", "client_name" => $objs_plan[$i]->client_name, "file" => "certificate/".$objs_plan[$i]->certificate, "created_at" => strval($objs_plan[$i]->created_at));
            array_push($response_data, $each_data);
        }
        return $this->response(["status" => "success", "data" => $response_data]);
    }

    //  ====================================================================================== bids ==========================

    public function addBid()
    {
        $data = $this->jsonInput();
        if ($data == null) {
            return null;
        }
        $input = $data["data"];
        $input['created_by'] = $data['user_id'];
        $input['created_at'] = date('Y-m-d h:i:s');
        $common = new Common();
        $result = $common->createBidPDF($input);
        if ($result == "false") {
            return $this->response(["status" => 'error', 'message' => 'Insert Error']);
        }
        $input['file'] = $result;
        $id = $this->bid_model->addNewBid($input);
        if ($id == false) {
            return $this->response(["status" => 'error', 'message' => 'Insert Error']);
        } else {
            $objs = $this->bid_model->getBid($data['user_id']);
            return $this->response(["status" => "success", "data" => $objs, 'message' => 'Successfully Inserted']);
        }
    }

    public function getBids()
    {
        $data = $this->jsonInput();
        $objs = $this->bid_model->getBid($data['user_id']);
        return $this->response(["status" => "success", "data" => $objs]);
    }


    function checkExist()
    {
        $realname = "";
        $data = $this->jsonInput();
        try {
            $names = $this->db->select("name")->from('tbl_profile')->where('name', $data["key"])->get()->result();
            return $this->response(["status" => "success", "data" => $names, 'profile' => $names]);
            if (empty($names)) {
                $names = $this->db->select("name")->from('tbl_profile')->where('reg_number', $data["key"])->get()->result();
                if (empty($names)) {
                    $names = $this->db->select("profess")->from('tbl_business')->where('pname', $data["key"])->get()->result();
                    if (empty($names)) {
                        return $this->response(["status" => "success", "data" => "false", 'profile' => "false"]);
                    } else {
                        $realname = $names[0]->profess;
                    }
                } else {
                    $realname = $names[0]->name;
                }
            } else {
                $realname = $names[0]->name;
            }
            $keyword = array('name' => $realname);
            $created_by = $this->profile_model->getProfile($keyword);
            $detail_id['created_by'] = $created_by['0']->created_by;
            $details = $this->project_model->getByCreatedBy($detail_id);
            return $this->response(["status" => "success", "data" => $details, 'profile' => $created_by]);
        } catch (\Throwable $th) {
            return $this->response(["status" => "success", "data" => "false", 'profile' => "false"]);
        }
    }

    public function getPay()
    {
        $query = $this->db->select("*")->from('tbl_pay')->get();
        $data = [];
        foreach ($query->result() as $row) {
            $data[] = $row;
        }
        return $this->response(["status" => "success", "data" => $data]);
    }
}
