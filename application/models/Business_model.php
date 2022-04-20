<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Business_model extends CI_Model
{
    function getBusiness($basedata) {
        return $this->db->select('*')->from('tbl_business')->where($basedata)->get()->result();
    }

    function addNew($data)
    {
        $query = $this->db->select("*")->from('tbl_business')->where('created_by', $data['created_by'])->get();
        if ( sizeof($query->result()) > 0 ){ 
            $sql = $this->db->set($data)->where('created_by', $data['created_by'])->get_compiled_update('tbl_business');
            $exist = $this->db->simple_query($sql);
            if ($exist) { return (int)(($query->result())[0])->id; }
            return false;
        }
        else {
            $sql = $this->db->set($data)->get_compiled_insert('tbl_business');
            $res = $this->db->simple_query($sql);
            if($res) { return $this->db->insert_id(); } 
            return false;
        }
    }
    
    function getBusinessProfess($basedata) {
        $business = $this->db->select('*')->from('tbl_business')->where('created_by', $basedata)->get()->result();
        $hoffice = $this->db->select('*')->from('tbl_offices')->where(array('created_by'=>$basedata,'is_head'=>'1',))->get()->result();
        return [ $business, $hoffice];
    }

    function getlist(){
        return $this->db->select('pname,status')->from('tbl_business')->get()->result();        
    }

    function updateBusiness($key, $update) {
        $query = $this->db->select("*")->from('tbl_business')->where($update)->get();
        if ( sizeof($query->result()) > 0 ){ return true; }
        else { 
            $sql = $this->db->set($update)->where($key)->get_compiled_update('tbl_business');
            return $this->db->simple_query($sql);
        }
    }
// ---------------- used functions -------------------------------------------
    // function getBusiness($basedata) {
    //     $accessor = $basedata['accessor'];
    //     $biz_num = Strval(count($this->db->select('*')->from('tbl_business')->where('accessor', $accessor)->get()->result()));
    //     $this->db->distinct();
    //     $profess_num = Strval(count($this->db->select('profess')->from('tbl_business')->where('accessor', $accessor)->get()->result()));
    //     return [$biz_num,$profess_num];
    // }  

    function getPendingByCreatedBy($data) {
        $query = $this->db->select("*")->from('tbl_business')->where('created_by', $data['created_by'])->where('status', 'unverified')->get();
        $data = [];
        foreach ($query->result() as $row) {  $data[] = $row; }
        return $data;
    }

    function getPending() {
        $query = $this->db->select("*")->from('tbl_business')->where('status', 'pending')->get();
        $data = [];
        foreach ($query->result() as $row)
        {
            $data[] = $row;
        }
        return $data;
    }

    function verficationBusiness($id, $status) {
        $this->db->set('status', $status);
        $this->db->where('id', $id);
        $data = $this->db->update('tbl_business');
        return $data;
    }

    // @ admin panel -----
    function businesslistCount()
    {
        $this->db->select('BaseTbl.id, BaseTbl.pname, BaseTbl.pcouncil, BaseTbl.ptype, BaseTbl.director, BaseTbl.dir_prof_regno, BaseTbl.status, BaseTbl.verified_by, BaseTbl.verified_at, BaseTbl.updated_at, User.name, User.email, User.isDeleted');
        $this->db->from('tbl_business as BaseTbl');
        $this->db->join('tbl_users as User', 'User.userId = BaseTbl.created_by','left');
        $query = $this->db->get();
        return $query->num_rows();
    }

    function businesslist($page, $segment)
    {
        $this->db->select('BaseTbl.id, BaseTbl.pname, BaseTbl.pcouncil, BaseTbl.ptype, BaseTbl.director, BaseTbl.dir_prof_regno, BaseTbl.status, BaseTbl.verified_by, BaseTbl.verified_at, BaseTbl.updated_at, User.name, User.email, User.isDeleted');
        $this->db->from('tbl_business as BaseTbl');
        $this->db->join('tbl_users as User', 'User.userId = BaseTbl.created_by','left');
        $this->db->order_by('BaseTbl.id', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        return $query->result();
    }
}

  