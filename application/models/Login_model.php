<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : Login_model (Login Model)
 * Login model class to get to authenticate user credentials 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Login_model extends CI_Model
{
    public $roles = [
        '1' => 'administrator',
        '2' => 'accessor',
        '3' => 'professional',
        '4' => 'public_user'
    ];

    public $roles_reverse = [
        'administrator' => '1',
        'assessor'      => '2',
        'professional'  => '3'
    ];
    
    /**
     * This function used to check the login credentials of the user
     * @param string $email : This is email of the user
     * @param string $password : This is encrypted password of the user
     */
    // function loginMe($email, $password, $role = "public_user")
    function loginMe($email, $password, $role = "administrator")
    {
        $this->db->select('BaseTbl.userId, BaseTbl.password, BaseTbl.email, BaseTbl.name, BaseTbl.mobile, BaseTbl.picpath, BaseTbl.roleId, BaseTbl.account_type, Roles.role');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->join('tbl_roles as Roles','Roles.roleId = BaseTbl.roleId');
        $this->db->where('BaseTbl.email', $email);
        $this->db->where('BaseTbl.isDeleted', 0);
        $this->db->where('BaseTbl.roleId', $this->roles_reverse[$role]);
        $query = $this->db->get();
        $user = $query->row();
        if(!empty($user)){
            if(verifyHashedPassword($password, $user->password)){
                return $user;
            } else {
                return array();
            }
        } else {
            return array();
        }
    }
    /**
     * This function used to check email exists or not
     * @param {string} $email : This is users email id
     * @return {boolean} $result : TRUE/FALSE
     */
    function checkEmailExist($email)
    {
        $this->db->select('userId');
        $this->db->where('email', $email);
        $this->db->where('isDeleted', 0);
        $query = $this->db->get('tbl_users');
        if ($query->num_rows() > 0){
            return true;
        } else {
            return false;
        }
    }

    /**
     * This function used to insert reset password data
     * @param {array} $data : This is reset password data
     * @return {boolean} $result : TRUE/FALSE
     */
    function resetPasswordUser($data)
    {
        $result = $this->db->insert('tbl_reset_password', $data);

        if($result) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    /**
     * This function is used to get customer information by email-id for forget password email
     * @param string $email : Email id of customer
     * @return object $result : Information of customer
     */
    function getCustomerInfoByEmail($email)
    {
        $this->db->select('userId, email, name');
        $this->db->from('tbl_users');
        $this->db->where('isDeleted', 0);
        $this->db->where('email', $email);
        $query = $this->db->get();

        return $query->row();
    }

    function getPassword($email)
    {
        $this->db->select('email, password');
        $this->db->from('tbl_users');
        $this->db->where('email', $email);
        $query = $this->db->get();
        return $query->row();
    }

    /**
     * This function used to check correct activation deatails for forget password.
     * @param string $email : Email id of user
     * @param string $activation_id : This is activation string
     */
    function checkActivationDetails($email, $activation_id)
    {
        $this->db->select('id');
        $this->db->from('tbl_reset_password');
        $this->db->where('email', $email);
        $this->db->where('activation_id', $activation_id);
        $query = $this->db->get();
        return $query->num_rows();
    }

    // This function used to create new password by reset link
    function createPasswordUser($email, $password)
    {
        $this->db->where('email', $email);
        $this->db->where('isDeleted', 0);
        $this->db->update('tbl_users', array('password'=>getHashedPassword($password)));
        $this->db->delete('tbl_reset_password', array('email'=>$email));
    }

    /**
     * This function used to save login information of user
     * @param array $loginInfo : This is users login information
     */
    function lastLogin($loginInfo)
    {
        $this->db->trans_start();
        $this->db->insert('tbl_last_login', $loginInfo);
        $this->db->trans_complete();
    }

    /**
     * This function is used to get last login info by user id
     * @param number $userId : This is user id
     * @return number $result : This is query result
     */
    function lastLoginInfo($userId)
    {
        $this->db->select('BaseTbl.createdDtm');
        $this->db->where('BaseTbl.userId', $userId);
        $this->db->order_by('BaseTbl.id', 'DESC');
        $this->db->limit(1);
        $query = $this->db->get('tbl_last_login as BaseTbl');

        return $query->row();
    }

    ///////////////////
    function registerMe($name, $phone, $email, $password, $role) {
        $this->db->select('BaseTbl.userId');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->where('BaseTbl.email', $email);
        $this->db->where('BaseTbl.isDeleted', 0);
        $query = $this->db->get();
        $user = $query->row();
        if(!empty($user)){
            return ['status' => 'error', 'message' => 'Email already register with us'];
        } 
        else {
            $userInfo = ['name'=>ucfirst($name), 'mobile'=>$phone, 'email' => $email, 'password' => getHashedPassword($password), 'roleId' => $this->roles_reverse[$role], 'createdDtm' => date('Y-m-d H:i:s'), 'updatedDtm' => date('Y-m-d H:i:s')];
            $this->db->insert('tbl_users', $userInfo);
            $insert_id = $this->db->insert_id();
            return ['status' => 'success', 'message' => 'Register Successfully', 'data' => ['email' => $email, 'id' => $insert_id]];
        }
    }

    function updateUser($filter,$content){
        $sql = $this->db->set($content)->where($filter)->get_compiled_update('tbl_users');
        $this->db->simple_query($sql);
        return null;
    }
}
?>