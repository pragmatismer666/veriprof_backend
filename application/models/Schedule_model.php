<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Schedule_model extends CI_Model
{
    function addNew($data)
    {
        $sql = $this->db->set($data)->get_compiled_insert('tbl_schedule');
        $res = $this->db->simple_query($sql);
        if($res) { return $this->db->select("*")->from('tbl_schedule')->get()->result(); }        
        return false;
    }

    function getSchedule(){
        return $this->db->select("*")->from('tbl_schedule')->get()->result();
    }
}

  