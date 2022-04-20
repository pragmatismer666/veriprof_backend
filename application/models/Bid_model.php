<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Bid_model extends CI_Model
{
    function addNewBid($data)
    {
        // // $plans = $this->db->select("*")->from('tbl_plans')->where('project_plan_no',$data['project_plan_no'])->get()->result();
        $sql = $this->db->set($data)->get_compiled_insert('tbl_bids');
        $res = $this->db->simple_query($sql);
        if($res) { return true; }
        return false;
    }

    function getBid($data) {
        return $this->db->select("*")->from('tbl_bids')->where('created_by',$data)->get()->result();
    }
}

  