<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class User_model extends CI_Model
{
    public $session_tbl = "tbl_session";
    public $user_tbl = "tbl_users";
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
     * This function is used to get the user listing count
     * @param string $searchText : This is optional search text
     * @return number $count : This is row count
     */
    function userListingCount($searchText = '')
    {
        $this->db->select('BaseTbl.userId, BaseTbl.email, BaseTbl.name, BaseTbl.mobile, BaseTbl.createdDtm, BaseTbl.updatedDtm, Role.role');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->join('tbl_roles as Role', 'Role.roleId = BaseTbl.roleId', 'left');
        if (!empty($searchText)) {
            $likeCriteria = "(BaseTbl.email  LIKE '%" . $searchText . "%'
                            OR  BaseTbl.name  LIKE '%" . $searchText . "%'
                            OR  BaseTbl.mobile  LIKE '%" . $searchText . "%')";
            $this->db->where($likeCriteria);
        }
        $this->db->where('BaseTbl.isDeleted', 0);
        $this->db->where('BaseTbl.roleId !=', 1);
        $query = $this->db->get();

        return $query->num_rows();
    }

    /**
     * This function is used to get the user listing count
     * @param string $searchText : This is optional search text
     * @param number $page : This is pagination offset
     * @param number $segment : This is pagination limit
     * @return array $result : This is result
     */
    function userListing($searchText = '', $page, $segment, $roleId = '')
    {
        $this->db->select('BaseTbl.userId, BaseTbl.email, BaseTbl.name, BaseTbl.mobile, BaseTbl.createdDtm, BaseTbl.updatedDtm, Role.role');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->join('tbl_roles as Role', 'Role.roleId = BaseTbl.roleId', 'left');
        if (!empty($searchText)) {
            $likeCriteria = "(BaseTbl.email  LIKE '%" . $searchText . "%'
                            OR  BaseTbl.name  LIKE '%" . $searchText . "%'
                            OR  BaseTbl.mobile  LIKE '%" . $searchText . "%')";
            $this->db->where($likeCriteria);
        }
        $this->db->where('BaseTbl.isDeleted', 0);
        $this->db->where('BaseTbl.roleId !=', 1);
        if (!empty($roleId)) {
            $this->db->where('BaseTbl.roleId =', $roleId);
        }
        $this->db->order_by('BaseTbl.userId', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();

        $result = $query->result();
        return $result;
    }

    /**
     * This function is used to get the user roles information
     * @return array $result : This is result of the query
     */
    function getUserRoles()
    {
        $this->db->select('roleId, role');
        $this->db->from('tbl_roles');
        $this->db->where('roleId !=', 1);
        $query = $this->db->get();

        return $query->result();
    }

    /**
     * This function is used to check whether email id is already exist or not
     * @param {string} $email : This is email id
     * @param {number} $userId : This is user id
     * @return {mixed} $result : This is searched result
     */
    function checkEmailExists($email, $userId = 0)
    {
        $this->db->select("email");
        $this->db->from("tbl_users");
        $this->db->where("email", $email);
        $this->db->where("isDeleted", 0);
        if ($userId != 0) {
            $this->db->where("userId !=", $userId);
        }
        $query = $this->db->get();

        return $query->result();
    }


    /**
     * This function is used to add new user to system
     * @return number $insert_id : This is last inserted id
     */
    function addNewUser($userInfo)
    {
        $this->db->trans_start();
        $this->db->insert('tbl_users', $userInfo);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        return $insert_id;
    }

    /**
     * This function used to get user information by id
     * @param number $userId : This is user id
     * @return array $result : This is user information
     */
    function getUserInfo($userId)
    {
        $this->db->select('userId, name, email, mobile, roleId, picpath');
        $this->db->from('tbl_users');
        $this->db->where('isDeleted', 0);
        $this->db->where('roleId !=', 1);
        $this->db->where('userId', $userId);
        $query = $this->db->get();
        $rows = $query->result();
        log_message('debug', $userId . " -------- " . json_encode($rows));
        if ($rows != null && $rows != []) {
            return ($rows)['0'];
        } else {
            return $rows;
        }
    }


    /**
     * This function is used to update the user information
     * @param array $userInfo : This is users updated information
     * @param number $userId : This is user id
     */
    function editUser($userInfo, $userId)
    {
        $this->db->where('userId', $userId);
        $this->db->update('tbl_users', $userInfo);
        return true;
    }

    function upUserAvatur($avatur)
    {
        try {
            if ($avatur['user_id'] == '') {
                return true;
            }
            $name = '/assets/profile/' . '_' . Strval($avatur['user_id']);
            // $name = '\\assets\\profile\\'.time().'_'.Strval($avatur['user_id']);
            if (strpos($avatur["type"], "png") !== false) {
                $name = $name . '.png';
            } else {
                $name = $name . '.jpeg';
            }
            $ifp = fopen(getcwd() . $name, 'wb');
            $data = explode(',', $avatur['data']);
            fwrite($ifp, base64_decode($data[1]));
            fclose($ifp);
            $this->db->where('userId', $avatur['user_id']);
            $this->db->update('tbl_users', ['picpath' => $name, 'updatedDtm' => date('Y-m-d h:i:s')]);
            return $name;
        } catch (\Throwable $th) {
            return false;
        }
    }

    /**
     * This function is used to delete the user information
     * @param number $userId : This is user id
     * @return boolean $result : TRUE / FALSE
     */
    function deleteUser($userId, $userInfo)
    {
        $this->db->where('userId', $userId);
        $this->db->update('tbl_users', $userInfo);
        return $this->db->affected_rows();
    }


    /**
     * This function is used to match users password for change password
     * @param number $userId : This is user id
     */
    function matchOldPassword($userId, $password)
    {
        $this->db->select('BaseTbl.userId, BaseTbl.password');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->where('BaseTbl.userId', $userId);
        $this->db->where('BaseTbl.isDeleted', 0);
        $query = $this->db->get();
        $user = $query->row();
        if (!empty($user)) {
            if (verifyHashedPassword($password, $user->password)) {
                return $user;
            } else {
                return array();
            }
        } else {
            return array();
        }
    }

    /**
     * This function is used to change users password
     * @param number $userId : This is user id
     * @param array $userInfo : This is user updation info
     */
    function changePassword($userId, $userInfo)
    {
        $this->db->where('userId', $userId);
        $this->db->where('isDeleted', 0);
        $this->db->update('tbl_users', $userInfo);
        return $this->db->affected_rows();
    }


    /**
     * This function is used to get user login history
     * @param number $userId : This is user id
     */
    function loginHistoryCount($userId, $searchText, $fromDate, $toDate)
    {
        $this->db->select('BaseTbl.userId, BaseTbl.sessionData, BaseTbl.machineIp, BaseTbl.userAgent, BaseTbl.agentString, BaseTbl.platform, BaseTbl.createdDtm');
        if (!empty($searchText)) {
            $likeCriteria = "(BaseTbl.sessionData LIKE '%" . $searchText . "%')";
            $this->db->where($likeCriteria);
        }
        if (!empty($fromDate)) {
            $likeCriteria = "DATE_FORMAT(BaseTbl.createdDtm, '%Y-%m-%d' ) >= '" . date('Y-m-d', strtotime($fromDate)) . "'";
            $this->db->where($likeCriteria);
        }
        if (!empty($toDate)) {
            $likeCriteria = "DATE_FORMAT(BaseTbl.createdDtm, '%Y-%m-%d' ) <= '" . date('Y-m-d', strtotime($toDate)) . "'";
            $this->db->where($likeCriteria);
        }
        if ($userId >= 1) {
            $this->db->where('BaseTbl.userId', $userId);
        }
        $this->db->from('tbl_last_login as BaseTbl');
        $query = $this->db->get();
        return $query->num_rows();
    }

    /**
     * This function is used to get user login history
     * @param number $userId : This is user id
     * @param number $page : This is pagination offset
     * @param number $segment : This is pagination limit
     * @return array $result : This is result
     */
    function loginHistory($userId, $searchText, $fromDate, $toDate, $page, $segment)
    {
        $this->db->select('BaseTbl.userId, BaseTbl.sessionData, BaseTbl.machineIp, BaseTbl.userAgent, BaseTbl.agentString, BaseTbl.platform, BaseTbl.createdDtm');
        $this->db->from('tbl_last_login as BaseTbl');
        if (!empty($searchText)) {
            $likeCriteria = "(BaseTbl.sessionData  LIKE '%" . $searchText . "%')";
            $this->db->where($likeCriteria);
        }
        if (!empty($fromDate)) {
            $likeCriteria = "DATE_FORMAT(BaseTbl.createdDtm, '%Y-%m-%d' ) >= '" . date('Y-m-d', strtotime($fromDate)) . "'";
            $this->db->where($likeCriteria);
        }
        if (!empty($toDate)) {
            $likeCriteria = "DATE_FORMAT(BaseTbl.createdDtm, '%Y-%m-%d' ) <= '" . date('Y-m-d', strtotime($toDate)) . "'";
            $this->db->where($likeCriteria);
        }
        if ($userId >= 1) {
            $this->db->where('BaseTbl.userId', $userId);
        }
        $this->db->order_by('BaseTbl.id', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();

        $result = $query->result();
        return $result;
    }

    /**
     * This function used to get user information by id
     * @param number $userId : This is user id
     * @return array $result : This is user information
     */
    function getUserInfoById($userId)
    {
        $this->db->select('userId, name, email, mobile, roleId');
        $this->db->from('tbl_users');
        $this->db->where('isDeleted', 0);
        $this->db->where('userId', $userId);
        $query = $this->db->get();

        return $query->row();
    }

    /**
     * This function used to get user information by id with role
     * @param number $userId : This is user id
     */
    function getUserInfoWithRole($userId)
    {
        $this->db->select('BaseTbl.userId, BaseTbl.email, BaseTbl.name, BaseTbl.mobile, BaseTbl.roleId, Roles.role');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->join('tbl_roles as Roles', 'Roles.roleId = BaseTbl.roleId');
        $this->db->where('BaseTbl.userId', $userId);
        $this->db->where('BaseTbl.isDeleted', 0);
        $query = $this->db->get();
        return $query->row();
    }

    //  ------------------------------------- check functions --------------------------
    function getPendingProf()
    {
        return $this->db->select('*')->from('tbl_users')->where('tbl_users.roleId', 3)->where('tbl_users.isDeleted', 0)->where('verified', 1)->get()->result();
    }

    function verficationProf($user_id, $verified)
    {
        $this->db->where('userId', $user_id);
        $this->db->update('tbl_users', ['verified' => $verified]);
        return $this->db->affected_rows();
    }

    function getVerifiedProf()
    {
        return $this->db->select('*')->from('tbl_users')->where('tbl_users.roleId', 3)->where('tbl_users.isDeleted', 0)->where('verified', 2)->get()->result();
    }

    function getProfessEmail($username)
    {
        $profess = $this->db->select('user_id')->from('tbl_profile')->where(array('name' => $username))->get()->result();
        $email = $this->db->select('email')->from('tbl_users')->where(array('userId' => $profess['0']->user_id))->get()->result();
        return $email['0']->email;
    }

    function checkPassword($user_id, $password)
    {
        $this->db->select('BaseTbl.userId, BaseTbl.password');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->where('BaseTbl.userId', $user_id);
        $this->db->where('BaseTbl.isDeleted', 0);
        $query = $this->db->get();
        $user = $query->row();
        if (!empty($user)) {
            if (verifyHashedPassword($password, $user->password)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    // ---------------------------- login controller functions in model --------------------------------------------------
    function loginMe($email, $password, $role = "administrator")
    {
        $this->db->select('BaseTbl.userId, BaseTbl.password, BaseTbl.email, BaseTbl.name, BaseTbl.mobile, BaseTbl.picpath, BaseTbl.roleId, BaseTbl.account_type, Roles.role');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->join('tbl_roles as Roles', 'Roles.roleId = BaseTbl.roleId');
        $this->db->where('BaseTbl.email', $email);
        $this->db->where('BaseTbl.isDeleted', 0);
        $this->db->where('BaseTbl.roleId', $this->roles_reverse[$role]);
        $query = $this->db->get();
        $user = $query->row();
        if (!empty($user)) {
            if (verifyHashedPassword($password, $user->password)) {
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
        if ($query->num_rows() > 0) {
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

        if ($result) {
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
        $this->db->update('tbl_users', array('password' => getHashedPassword($password)));
        $this->db->delete('tbl_reset_password', array('email' => $email));
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
    function lastLoginInfo($value, $keyword)
    {
        if ($keyword == "userId") {
            $this->db->select('BaseTbl.createdDtm');
            $this->db->where('BaseTbl.userId', $value);
        } else if ($keyword == "token") {
            $this->db->select('*');
            $this->db->where('BaseTbl.token', $value);
        }
        $this->db->order_by('BaseTbl.id', 'DESC');
        $this->db->limit(1);
        $query = $this->db->get('tbl_last_login as BaseTbl');
        return $query->row();
    }

    ///////////////////
    function registerMe($name, $phone, $email, $password, $role)
    {
        $this->db->select('BaseTbl.userId');
        $this->db->from('tbl_users as BaseTbl');
        $this->db->where('BaseTbl.email', $email);
        $this->db->where('BaseTbl.isDeleted', 0);
        $query = $this->db->get();
        $user = $query->row();
        if (!empty($user)) {
            return ['status' => 'error', 'message' => 'Email already register with us'];
        } else {
            $userInfo = ['name' => ucfirst($name), 'mobile' => $phone, 'email' => $email, 'password' => getHashedPassword($password), 'roleId' => $this->roles_reverse[$role], 'createdDtm' => date('Y-m-d H:i:s'), 'updatedDtm' => date('Y-m-d H:i:s')];
            $this->db->insert('tbl_users', $userInfo);
            $insert_id = $this->db->insert_id();
            return ['status' => 'success', 'message' => 'Register Successfully', 'data' => ['email' => $email, 'id' => $insert_id]];
        }
    }

    function updateUser($filter, $content)
    {
        $sql = $this->db->set($content)->where($filter)->get_compiled_update('tbl_users');
        $this->db->simple_query($sql);
        return null;
    }
}
