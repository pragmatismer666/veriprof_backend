<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Report_model extends CI_Model
{

    function addNew($data)
    {    
        $sql = $this->db->set($data)->get_compiled_insert('tbl_reports');
        $res = $this->db->simple_query($sql);
        if($res) {
            $insert_id = $this->db->insert_id(); 
            return $insert_id;
        } 
        
        return false;
    }

    function getReportByName($data) {
        
        $query = $this->db->select("*")->from('tbl_reports')->where($data)->get();
        $data = [];
        foreach ($query->result() as $row)
        {
            $data[] = $row;
        }
        return $data;
    }

    function reportlistCount()
    {
        $this->db->select('BaseTbl.id, BaseTbl.accessor, BaseTbl.report_type, BaseTbl.created_at, BaseTbl.filename, User.name, User.email, User.isDeleted');
        $this->db->from('tbl_reports as BaseTbl');
        $this->db->join('tbl_users as User', 'User.userId = BaseTbl.created_by','left');
        $query = $this->db->get();
        return $query->num_rows();
    }

    function reportlist($page, $segment)
    {
        $this->db->select('BaseTbl.id, BaseTbl.accessor, BaseTbl.report_type, BaseTbl.created_at, BaseTbl.filename, User.name, User.email, User.isDeleted');
        $this->db->from('tbl_reports as BaseTbl');
        $this->db->join('tbl_users as User', 'User.userId = BaseTbl.created_by','left');
        $this->db->order_by('BaseTbl.id', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        return $query->result();
    }
}

  