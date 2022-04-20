<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Office_model extends CI_Model
{
    // @ admin panel -----
    function officelistCount()
    {
        $this->db->select('BaseTbl.id, BaseTbl.buzi_id, BaseTbl.email, BaseTbl.phone, BaseTbl.res_prof_reg, BaseTbl.created_at, BaseTbl.status, BaseTbl.filename, User.name, User.email, User.isDeleted');
        $this->db->from('tbl_offices as BaseTbl');
        $this->db->join('tbl_users as User', 'User.userId = BaseTbl.created_by','left');
        $query = $this->db->get();
        return $query->num_rows();
    }

    function officelist($page, $segment)
    {
        $this->db->select('BaseTbl.id, BaseTbl.buzi_id, BaseTbl.email, BaseTbl.phone, BaseTbl.res_prof_reg, BaseTbl.created_at, BaseTbl.status, BaseTbl.filename, User.name, User.email, User.isDeleted');
        $this->db->from('tbl_offices as BaseTbl');
        $this->db->join('tbl_users as User', 'User.userId = BaseTbl.created_by','left');
        $this->db->order_by('BaseTbl.id', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        return $query->result();
    }
}

  