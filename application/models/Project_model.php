<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Project_model extends CI_Model
{

    function getProjects()
    {
        $query = $this->db->select("*")->from('tbl_projects')->order_by('id', 'desc')->get();
        return $query->result();
    }
    
    function addNew($data)
    {    
        $query = $this->db->select("*")->from('tbl_projects')->where(array('title'=>$data['title'],'type'=>$data['type']))->order_by('id', 'desc')->get();
        if (sizeof($query->result()) > 0){ return "exist";}
        $sql = $this->db->set($data)->get_compiled_insert('tbl_projects');
        $res = $this->db->simple_query($sql);
        if($res) { return $this->db->insert_id(); }
        return false;
    }

    function getByCreatedBy($data) {
        $query = $this->db->select("*")->from('tbl_projects')->where('created_by', $data['created_by'])->order_by('id', 'desc')->get();
        $data = [];
        foreach ($query->result() as $row)
        {
            $data[] = $row;
        }        
        return $data;
    }
        
    function changeProjectStatus($title, $user_id, $verified) {
        if ( $verified == "Completed" ) {
            $query = $this->db->select("*")->from('tbl_projects')->where(array('created_by'=>$user_id, 'title'=>$title))->order_by('id', 'desc')->get();
            foreach ($query->result() as $row)
            {
                $final_cost = floatval($row->prof_cost) + floatval($row->const_cost);
                $this->db->where('created_by', $user_id);
                $this->db->where('title', $title);
                $this->db->update('tbl_projects', ['status' => $verified, 'final_cost'=>strval($final_cost), 'completed_at'=>date('Y-m-d h:i:s')]);
                break;
            }
        } else {
            $this->db->where('created_by', $user_id);
            $this->db->where('title', $title);
            $this->db->update('tbl_projects', ['status' => $verified, 'completed_at'=>date('Y-m-d h:i:s')]);
        }
        return $this->db->affected_rows();
    }

    function projectlistCount()
    {
        $this->db->select('BaseTbl.id, BaseTbl.title, BaseTbl.prof_type, BaseTbl.year, BaseTbl.client_name, BaseTbl.pl_name, BaseTbl.pl_email, BaseTbl.pl_phone, BaseTbl.proj_street1, BaseTbl.proj_street2, BaseTbl.proj_street3, BaseTbl.proj_city, BaseTbl.proj_state, BaseTbl.proj_zip, BaseTbl.status, BaseTbl.file, User.name, User.email, User.isDeleted');
        $this->db->from('tbl_projects as BaseTbl');
        $this->db->join('tbl_users as User', 'User.userId = BaseTbl.created_by','left');
        $query = $this->db->get();
        return $query->num_rows();
    }

    function projectlist($page, $segment)
    {
        $this->db->select('BaseTbl.id, BaseTbl.title, BaseTbl.prof_type, BaseTbl.year, BaseTbl.client_name, BaseTbl.pl_name, BaseTbl.pl_email, BaseTbl.pl_phone, BaseTbl.proj_street1, BaseTbl.proj_street2, BaseTbl.proj_street3, BaseTbl.proj_city, BaseTbl.proj_state, BaseTbl.proj_zip, BaseTbl.status, BaseTbl.file, User.name, User.email, User.isDeleted');
        $this->db->from('tbl_projects as BaseTbl');
        $this->db->join('tbl_users as User', 'User.userId = BaseTbl.created_by','left');
        $this->db->order_by('BaseTbl.id', 'DESC');
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        return $query->result();
    }

}

  