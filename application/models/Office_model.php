<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

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
        $this->db->select("BaseTbl.id, BaseTbl.buzi_id, BaseTbl.email, BaseTbl.phone, BaseTbl.res_prof_reg, BaseTbl.created_at, BaseTbl.status, BaseTbl.filename, User.name, User.email, User.isDeleted");
        $this->db->from("tbl_offices as BaseTbl");
        $this->db->join("tbl_users as User", "User.userId = BaseTbl.created_by", "left");
        $query = $this->db->get();
        return $query->num_rows();
    }

    function officelist($page, $segment)
    {
        $this->db->select("BaseTbl.id, BaseTbl.buzi_id, BaseTbl.email, BaseTbl.phone, BaseTbl.res_prof_reg, BaseTbl.created_at, BaseTbl.status, BaseTbl.filename, User.name, User.email, User.isDeleted");
        $this->db->from("tbl_offices as BaseTbl");
        $this->db->join("tbl_users as User", "User.userId = BaseTbl.created_by", "left");
        $this->db->order_by("BaseTbl.id", "DESC");
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        return $query->result();
    }

    function updateOffice($key, $update)
    {
        log_message("debug", "updateOffice key = : " . json_encode($key));
        log_message("debug", "updateOffice update = : " . json_encode($update));
        $query = $this->db->select("*")->from("tbl_offices")->where($key)->get();
        if (sizeof($query->result()) > 0) {
            $offices = $query->result();
            foreach ($offices as $office) {
                if ($office->is_head == "1") {
                    $sql = $this->db->set($update)->where($key)->get_compiled_update("tbl_offices");
                    $query = $this->db->select("*")->from("tbl_business")->where(array("id" => $office->buzi_id))->get();
                    if (sizeof($query->result()) > 0) {
                        $sql = $this->db->set($update)->where($key)->get_compiled_update("tbl_business");
                        $this->db->simple_query($sql);
                    }
                }
            }
            $sql = $this->db->set($update)->where($key)->get_compiled_update("tbl_offices");
            return $this->db->simple_query($sql);
        } else {
            return false;
        }
    }
}
