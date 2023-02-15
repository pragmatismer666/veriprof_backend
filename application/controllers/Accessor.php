<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

include_once(__DIR__ . "/pdf/fpdf.php");
include_once(__DIR__ . "/Common.php");

class Accessor extends CI_Controller
{
    // private static $instance = null;
    public function __construct()
    {
        parent::__construct();
        $this->load->model("user_model");
        $this->load->model("business_model");
        $this->load->model("login_model");
        $this->load->model("report_model");
        $this->load->model("project_model");
        $this->load->model("profile_model");
        $this->load->model("office_model");
        $this->load->model("support_model");
        $this->load->model("plan_model");
    }
    // static public function getInstance() {
    //     if (self::$instance == null)
    //     {
    //         self::$instance = new Accessor();
    //     }    
    //     return self::$instance;
    // }
    public function response($data): void
    {
        echo json_encode($data);
    }

    public function jsonInput()
    {
        $json = file_get_contents("php://input");
        // log_message("debug", "json input" . $json);
        return json_decode($json, true);
    }

    public function actionPendingPlan()
    {
        $data = $this->jsonInput();
        $objs = $this->user_model->verficationProf($data["user_id"], $data["verified"]);
        return $this->response(["status" => "success", "data" => $objs]);
    }

    //  user get and update -----------------------------------------------------------------------------------------------
    public function upUser()
    {
        $data = $this->jsonInput();
        if (isset($data["pass"])) {
            $passcheck = $this->user_model->checkPassword($data["user_id"], $data["pass"]);
            if ($passcheck) {
                if ($data["key"] == "delete") {
                    try {
                        $userInfo = array("isDeleted" => 1, "updatedDtm" => date("Y-m-d H:i:s"));
                        $result = $this->user_model->deleteUser($data["user_id"], $userInfo);
                        return $this->response(["status" => "success", "data" => "Delete as perfectly."]);
                    } catch (\Throwable $th) {
                        return $this->response(["status" => "error", "data" => "Get Problem in remove."]);
                    }
                } else if ($data["key"] == "update") {
                    $userInfo = array(
                        "password" => getHashedPassword($data["data"]["newpass"]),
                        "name" => ucwords($data["data"]["name"]), "updatedDtm" => date("Y-m-d H:i:s")
                    );
                    $result = $this->user_model->editUser($userInfo, $data["user_id"]);
                    if ($result) {
                        $objs = $this->user_model->getUserInfo($data["user_id"]);
                        return $this->response(["status" => "success", "data" => $objs]);
                    } else {
                        return $this->response(["status" => "error", "data" => "Please input correct Old password"]);
                    }
                }
                return $this->response(["status" => "error", "data" => "Problem in editUser."]);
            } else {
                return $this->response(["status" => "error", "data" => "Please input correct Old password"]);
            }
        } else {
            $name = $this->user_model->upUserAvatur($data);
            if ($name == false) {
                return $this->response(["status" => "error", "data" => "Have problem in save Image."]);
            }
            return $this->response(["status" => "success", "data" => $name]);
        }
    }
    // plan 
    public function getEplans()
    {
        $objs = $this->plan_model->getplans(array());
        return $this->response(["status" => "success", "data" => $objs]);
    }
    // ------------------------------------------- project step
    public function getProjects()
    {
        $projects = $this->project_model->getProjects();
        return $this->response(["status" => "success", "data" => $projects]);
    }

    public function getUnverifiedProject()
    {
        $unverifiedProject = $this->project_model->getProjectsInfo(array("status_verified" => "Unverified", "status_verify"=>"1"));
        return $this->response(["status" => "success", "data" => $unverifiedProject]);
    }

    public function getVerifiedProject()
    {
        $verifiedProject = $this->project_model->getProjectsInfo(array("status_verified" => "Verified", "status_verify"=>"1"));
        return $this->response(["status" => "success", "data" => $verifiedProject]);
    }

    // ------------------------------------------- professional ------------------
    public function getVerifiedProf()
    {
        $verifiedProf = $this->profile_model->getProfInfo(array("status" => "Verified"));
        return $this->response(["status" => "success", "data" => $verifiedProf]);
    }

    public function getUnverifiedProf()
    {
        $unVerifiedProf = $this->profile_model->getProfInfo(array("status" => "Unverified"));
        return $this->response(["status" => "success", "data" => $unVerifiedProf]);
    }

    public function getUnverifyProfiles()
    {
        $objs = $this->profile_model->getProfile(array("status" => "Unverified"));
        return $this->response(["status" => "success", "data" => $objs]);
    }

    public function getProf()
    {
        $objs = $this->profile_model->getProfile(array());
        for ($i = 0; $i < sizeof($objs); $i++) {
            $email = $this->db->select("email")->from("tbl_users")->where("userId", (int)($objs[$i]->user_id))->get()->result();
            $objs[$i]->email = $email[0]->email;
        }
        return $this->response(["status" => "success", "data" => $objs]);
    }

    public function getVerified()
    {
        $data = $this->jsonInput();
        $reports = $this->db->select("*")->from("tbl_reports")->where(array("created_by" => $data["created_by"]))->get()->result();
        $projectNum = 0;
        $OfficeNum = 0;
        $profileNum = 0;
        foreach( $reports as $report ) {
            if ($report->report_type == "office") {
                $OfficeNum++;
            } else if ($report->report_type == "project") {
                $projectNum++;
            } else if ($report->report_type == "profile") {
                $profileNum++;
            }
        }
        return $this->response(["status" => true, "office" => $OfficeNum, "project" => $projectNum, "profile" => $profileNum]);
    }

    public function verifyProf()
    {
        $data = $this->jsonInput();
        $key = array("id" => (int)($data["profile_id"]));
        $update = array("verified_by" => $data["user_id"], "verified_at" => date("Y-m-d h:i:s"), "status" => "Verified");
        $result = $this->profile_model->updateProfile_accessor($key, $update);
        if ($result) {
            return $this->response(["status" => "success", "data" => "Verified as successfully."]);
        } else {
            return $this->response(["status" => "error", "data" => "Get problem in verify."]);
        }
    }
    // ------------------------------------------- Business
    public function getBusiness()
    {
        $result = $this->db->select("*")->from("tbl_business")->get()->result();
        $this->response(["status" => "success", "data" => $result]);
    }

    // public function getUnverifyBusiness()
    // {
    //     $business1 = $this->business_model->getBusiness(array("status" => "Unverified"));
    //     return $this->response(["status" => "success", "data" => $business1]);
    // }

    // public function getVerifiedBusiness()
    // {
    //     $business = $this->business_model->getBusiness(array("status" => "Verified"));
    //     return $this->response(["status" => "success", "data" => $business]);
    // }

    // ------------------------------------------- Office
    public function getUnverifiedOffice()
    {
        $unverifiedOfficesInfo = $this->support_model->getOfficesInfo(array("BaseTbl.status" => "Unverified"));
        return $this->response(["status" => "success", "data" => $unverifiedOfficesInfo]);
    }

    public function getVerifiedOffice()
    {
        $verifiedOfficesInfo = $this->support_model->getOfficesInfo(array("BaseTbl.status" => "Verified"));
        return $this->response(["status" => "success", "data" => $verifiedOfficesInfo]);
    }
    // ------------------------------------------- Schedule
    public function getSchedule()
    {
        $data = $this->jsonInput();
        $result = $this->support_model->getSchedules(array("BaseTbl.created_by" => $data["created_by"]));
        $this->response(["status" => true, "data" => $result]);
    }

    public function addSchedule()
    {
        $data = $this->jsonInput();
        if ($data == null) {
            return null;
        }
        $result = $this->support_model->addSchedule($data);
        if ($result == "0") {
            $this->response(["status" => false, "data" => "Connection Error!"]);
        } else {
            $this->response(["status" => true, "data" => $result]);
        }
    }
    //  ---------------------------------------------------- Report Part ------------------

    public function addReport()
    {
        $input             = $this->jsonInput();
        if ($input == null) {
            return null;
        }
        $common = new Common();
        $input["created_at"] = date("Y-m-d h:i:s");
        $input["data"] = json_encode($input["data"]);
        $input["score"] = $input["score"];
        $input["filename"] = $common->createReportPDF($input);
        // log_message("debug", json_encode($input));
        $id = $this->report_model->addNew($input);
        // log_message("debug", $id);
        if ($id == false) {
            return $this->response(["status" => false, "data" => "Error - create new report"]);
        } else {
            $result = $this->support_model->updateSchedule(array("verify_content_id" => $input["content_id"], "created_by" => $input["created_by"], "verify_target" => $input["report_type"]), array("is_done" => "1"));
            log_message("debug", "updateSchedule = : exist " . $result);
            $key = array("id" => (int)($input["content_id"]));
            if ($input["report_type"] == "office") {
                $update = array("verified_by" => $input["created_by"], "verified_at" => date("Y-m-d h:i:s"), "status" => "Verified");
                $result = $this->office_model->updateOffice($key, $update);
                if ($result != false) {
                    return $this->response(["status" => true, "data" => $input]);
                }
            } else if ($input["report_type"] == "project") {
                $update = array("verified_by" => $input["created_by"], "verified_at" => date("Y-m-d h:i:s"), "status_verified" => "Verified");
                $result = $this->project_model->updateProject((int)($input["content_id"]), $update);
                if ($result != false) {
                    return $this->response(["status" => true, "data" => $input]);
                }
            } else if ($input["report_type"] == "profile") {
                $update = array("verified_by" => $input["created_by"], "verified_at" => date("Y-m-d h:i:s"), "status" => "Verified");
                $result = $this->profile_model->updateProfile_accessor($key, $update);
                if ($result != false) {
                    return $this->response(["status" => true, "data" => $input]);
                }
            }
            return $this->response(["status" => false, "data" => "Error - update content status"]);
        }
        // $professEmail = $this->user_model->getProfessEmail($input["profess_name"]);
        // try {
        //     $verified = "Hi ".$input["profess_name"].",  ".$input["accessor"]." is submitted report about you. Title is ".$input["report_title"].".You can check content by downloading report in your report tab.";
        //     $common -> sendEmail($professEmail,$verified);
        //     return $this->response(["status" => "success", "data" => $professEmail, "message" => "Successfully Inserted"]);
        // } catch (\Throwable $th) {
        //     return $this->response(["status" => "success", "data" => "limited", "message" => "Successfully Inserted"]);
        // }
    }

    public function getReport()
    {
        // $data = $this->jsonInput();
        $reports = $this->db->select("*")->from("tbl_reports")->get()->result();
        $projects = array();
        $offices = array();
        $profiles = array();
        foreach ($reports as $report) {
            if ($report->report_type == "office") {
                array_push($offices, $report);
            } else if ($report->report_type == "project") {
                array_push($projects, $report);
            } else if ($report->report_type == "profile") {
                array_push($profiles, $report);
            }
        }
        $this->response(["status" => true, "projects" => $projects, "profiles" => $profiles, "offices" => $offices]);
    }
}
