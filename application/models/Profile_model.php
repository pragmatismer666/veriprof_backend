<?php if(!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Profile_model extends CI_Model
{

    function addNew($data)
    {
        $query = $this->db->select("*")->from("tbl_profile")->where("user_id", $data["user_id"])->get();
        if( sizeof($query->result()) > 0 ){
            $sql = $this->db->set($data)->where("user_id", $data["user_id"])->get_compiled_update("tbl_profile");
            $this->db->simple_query($sql);
            return "exist";
        } 
        else if ( sizeof($query->result()) == 0 ){
            $sql = $this->db->set($data)->get_compiled_insert("tbl_profile");
            $res = $this->db->simple_query($sql);
            if($res) {
                $query_again = $this->db->select("*")->from("tbl_profile")->where("user_id", $data["user_id"])->order_by("id", "desc")->get(); 
                return  ($query_again->result())["0"]->reg_n0;
            }
            else{
                return "error";
            }
        }
    }

    function updateProfile($update,$user_id){
        $sql = $this->db->set($update)->where("user_id", $user_id)->get_compiled_update("tbl_profile");
        $this->db->simple_query($sql);
        return null;
    }

    function getallProfiles(){
        $query = $this->db->select("*")->from("tbl_profile")->order_by("id", "desc")->get();
        $data = [];
        foreach ($query->result() as $row)
        {
            $data[] = $row;
        } 
        return $data;
    }

    function getProfile($data){
        // $res = $this->db->select("*")->from("tbl_profile")->get();
        // log_message('debug', json_encode($res->result()));
        return $this->db->select("*")->from("tbl_profile")->where($data)->get()->result();
    }

    function updateProfile_accessor($key, $update){
        $query = $this->db->select("*")->from("tbl_profile")->where($update)->get();
        if ( sizeof($query->result()) > 0 ){ return true; }
        else { 
            $sql = $this->db->set($update)->where($key)->get_compiled_update("tbl_profile");
            return $this->db->simple_query($sql);
        }
    }
// ---------------- used functions -------------------------------------------
    function registerProfile($reg_num,$user_id){
        $sql = $this->db->set($reg_num)->where("user_id", $user_id)->get_compiled_update("tbl_profile");
        $this->db->simple_query($sql);
        return 0;
    }

    function checkProfessRegister($user_id){
        $query = $this->db->select("*")->from("tbl_profile")->where("user_id", $user_id)->order_by("id", "desc")->get();
        $data = [];
        foreach ($query->result() as $row)
        {
            $data[] = $row;
        }       
        if (empty($data)){
            return "You need to register.";
        }
        if ($data["0"]->reg_number != ""){
            return "Registered Professional";
        }
    }
}

  