<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Plan_model extends CI_Model
{
    function addNew($data)
    {
        // $plans = $this->db->select("*")->from('tbl_plans')->where('project_plan_no',$data['project_plan_no'])->get()->result();
        $sql = $this->db->set($data)->get_compiled_insert('tbl_plans');
        $res = $this->db->simple_query($sql);
        if($res) { return true; }
        return false;
    }

    function getplans($data) {
        return $this->db->select("*")->from('tbl_plans')->where($data)->get()->result();
    }
    
    // @ admin panel -----
    function eplanlistCount()
    {
        $this->db->select('BaseTbl.id, BaseTbl.project_title, BaseTbl.project_area, BaseTbl.project_cost, BaseTbl.project_plan_no, BaseTbl.client_name, BaseTbl.verify_code, BaseTbl.created_at, BaseTbl.file, BaseTbl.certificate, User.name, User.email, User.isDeleted');
        $this->db->from('tbl_plans as BaseTbl');
        $this->db->join('tbl_users as User', 'User.userId = BaseTbl.created_by','left');
        $query = $this->db->get();
        return $query->num_rows();
    }

    function eplanlist($page, $segment)
    {
        $this->db->select('BaseTbl.id, BaseTbl.project_title, BaseTbl.project_area, BaseTbl.project_cost, BaseTbl.project_plan_no, BaseTbl.client_name, BaseTbl.verify_code, BaseTbl.created_at, BaseTbl.file, BaseTbl.certificate, User.name, User.email, User.isDeleted');
        $this->db->from('tbl_plans as BaseTbl');
        $this->db->join('tbl_users as User', 'User.userId = BaseTbl.created_by','left');
        $this->db->order_by('BaseTbl.id', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        return $query->result();
    }
}

  