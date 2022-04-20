<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Verify_model extends CI_Model
{

    function checkUser($basedata) {

        $query = $this->db->select("name")->from('verify_zone_tbl')->get();
        foreach ($query->result() as $row)
        {
            if ($basedata["name"] == $row->name){
                $query = $this->db->select("*")->from('verify_zone_tbl')->where('name', $basedata["name"])->get();
                $data = $query->result()['0'];
                if ( $data->SACAP_ID ==  $basedata['reg_id']){
                    if ($data->SA_ID == $basedata['verify_id']){
                        return "true";
                    }
                    if ($data->passport_ID == $basedata['verify_id']){
                        return "true";
                    }
                }
                break;
            }
        }  
        return "false";
    }
}

  