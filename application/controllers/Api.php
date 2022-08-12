<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

include_once(__DIR__.'/Professional.php');
include_once(__DIR__.'/Accessor.php');
include_once(__DIR__.'/User.php');
include_once(__DIR__.'/Login.php');
include_once(__DIR__.'/Common.php');

class Api extends CI_Controller
{

    // private static $instance = null;

    // function __construct()
    // {
    //     parent::__construct();
    //     $this->load->model('project_model');
    //     $this->load->model('user_model');
    //     $this->load->model('business_model');
    //     $this->load->model('schedule_model');
    //     $this->load->model('login_model');
    //     $this->load->model('report_model');
    //     $this->load->model('profile_model');
    //     $this->load->model('support_model');
    // }

    // static public function getInstance() {

    //     if (self::$instance == null)
    //     {
    //         self::$instance = new Api();
    //     }
    
    //     return self::$instance;
    // }

    function response($data) {
        echo json_encode($data);
        return;
    }

    function jsonInput() {
        $json = file_get_contents('php://input');
        return json_decode($json, true);
    }

    // Common APIs
    public function route($functionName) {
        $fn = $this->dashesToCamelCase($functionName);
        if(method_exists($this, $this->dashesToCamelCase($fn))) {
            $this->$fn();
        } else {
            return $this->response(['status' => 'error', 'message' => 'invaild endpoint hit']);
        }
    }

    public function routeController($className, $functionName) {
        $className = ucfirst($className);
        $obj = new $className;
        $fn = $this->dashesToCamelCase($functionName);
        return $obj->$fn($this->input->post());
    }

    function dashesToCamelCase($string, $capitalizeFirstCharacter = false) 
    {
        $str = str_replace(' ', '', ucwords(str_replace('-', ' ', $string)));
        if (!$capitalizeFirstCharacter) {
            $str[0] = strtolower($str[0]);
        }
        return $str;
    }

    function downloadOnAdmin($type, $filename){
        
    }

       
    // special function 
    public function login() {
        $this->load->model('login_model');
        $data = $this->jsonInput();
        extract($data);
        if(!isset($email) || !isset($password)) { return $this->response(['status' => 'error', 'message' => 'Invaild Information']); }
        $email = strtolower($this->security->xss_clean(trim($email)));
        $user = $this->login_model->loginMe(trim($email), $password, $role);
        if($user == []) { return $this->response(['status' => 'error', 'message' => 'Invaild Information']); }
        return $this->response(['status' => 'success', 'message' => 'Login Successfully', 'data' => $user]);
    }

    public function forget()
    {
        $this->load->model('login_model');
        $data = $this->jsonInput();
        $result = $this->login_model->getPassword($data['email']);
        if ($result == null){
            $message = 'This email is not yet registered with VerifProf. Please register and log in';
        }
        else{
            $message = 'Please check email, There will be new password.'; 
            $common = new Common();
            $random_code = $common->getVerifyCode();
            $this->login_model->updateUser(array('email'=>$data['email']), array('password'=>getHashedPassword($random_code)));
            $email_content = 'Verified, Your new passowrd is '.$random_code;
            $common -> sendEmail($data['email'], $email_content);
        }
        return $this->response(['status' => 'success', 'result' => $result,'message' => $message]);
    }

    public function register() {
        $this->load->model('login_model');
        try {
            $data = $this->jsonInput();
            extract($data);
            if(!isset($email) || !isset($password) || !isset($role)) {
                return $this->response(['status' => 'error', 'message' => 'Invaild Information']);
            }
            $email = strtolower($this->security->xss_clean($email));    
            $result = $this->login_model->registerMe($full_name, $mobile, $email, $password, $role);
            if ( $result['status'] == 'success' ) {
                $verified = "Hi ".$full_name.", You are signed up in Veriprof ".$role."successfully.";
                $common = new Common();
                $common->sendEmail($email,$verified);
                return $this->response(['status' => 'success', 'message' => 'Successfully.', 'data'=>$result['data']]);
            } 
            else {
                return $this->response(['status' => 'error', 'message' => 'This Email is existing, try other email.']);
            }
        } 
        catch (\Throwable $th) {
            return $this->response(['status' => 'error', 'message' => 'Invaild Information']);
        }
    }

    // finish login, register , forget
    public function getUsers() {
        $this->load->model('user_model');
        $data = $this->jsonInput();
        $objs = $this->user_model->getUserInfo($data['user_id']);
        return $this->response(['status' => 'success', 'data' => $objs]);
    }

    
    public function uploadFile() {
        $filename = $_FILES['file-to-upload']['tmp_name'];
        $savedName = time().'_'.$_FILES['file-to-upload']['name'];
        // $destination = getcwd().'\\assets\\uploads\\'.$savedName;
        $savedName = str_replace(" ", "_", $savedName);
        $destination = getcwd().'/assets/uploads/'.$savedName;
        move_uploaded_file($filename, $destination);
        return $this->response(['status' => 'success', 'filename' => $savedName]);
    }

    function getDetails(){
        $query = $this->db->select("*")->from('tbl_details')->get();
        $data = [];
        foreach ($query->result() as $row)
        {
            $data[] = $row;
        }        
        return $this->response(['status' => 'success', 'data' =>$data]);
    }

    function search(){
        $data = $this->jsonInput();
        $realname = $data["key"];
        try {
            $users = $this->db->select("userId, roleId")->from('tbl_users')->where('name', $realname)->get()->result();
            if ( empty($users) ) {
                $profiles = $this->db->select("*")->from('tbl_profile')->where('name', $realname)->get()->result();
                if ( empty($profiles) ) {
                    $projects = $this->db->select("*")->from('tbl_projects')->where('title', $realname)->get()->result();
                    if ( empty($projects) ) {
                        $business = $this->db->select("*")->from('tbl_business')->where('pname', $realname)->get()->result();
                        if ( empty($business) ) {
                            $eplans = $this->db->select("*")->from('tbl_plans')->where('project_title', $realname)->get()->result();
                            if ( empty($eplans) ) {
                                return $this->response(['status' => 'no', 'data' =>"false"]);
                            } else {
                                return $this->response(['status' => 'success', 'data' =>$eplans[0] ]);    
                            }
                        } else {
                            return $this->response(['status' => 'success', 'data' =>$business[0] ]);
                        }
                    } else {
                        return $this->response(['status' => 'success', 'data' =>$projects[0] ]);    
                    }
                } else {
                    return $this->response(['status' => 'success', 'data' =>$profiles[0] ]);
                }
            } else {
                if ( $users[0]->roleId == 3 ) {
                    $data = $this->db->select("*")->from('tbl_profile')->where('user_id', $users[0]->userId)->get()->result();
                    return $this->response(['status' => 'success', 'data' =>$data]);
                } else {
                    return $this->response(['status' => 'no', 'data' =>"false"]);
                }
            }
        } catch (\Throwable $th) {
            return $this->response(['status' => 'no', 'data' =>"false"]);
        }
    }
}
