<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

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
        // log_message("debug", json_encode($data));
        $key = array("content_id" => $data["content_id"], "report_type" => $data["report_type"], "created_by" => $data["created_by"], "profess" => $data["profess"]);
        $result = $this->db->select("*")->from("tbl_reports")->where($key)->order_by("id", "desc")->get();
        if (sizeof($result->result()) > 0) {
            $sql = $this->db->set($data)->where($key)->get_compiled_update("tbl_reports");
            return $this->db->simple_query($sql);
        } else {
            $sql = $this->db->set($data)->get_compiled_insert("tbl_reports");
            $res = $this->db->simple_query($sql);
            if ($res) {
                return $this->db->insert_id();
            } else {
                return false;
            }
        }
    }

    function getReport($user)
    {
        // log_message("debug", "professional getReport data = : " . $user->account_type);
        if (strval($user->account_type) == "pro") {
            return $this->db->select("*")->from("tbl_reports")->get()->result();
        } else {
            return $this->db->select("*")->from("tbl_reports")->where("profess", strval($user->userId))->get()->result();
        }
    }

    function reportlistCount()
    {
        $this->db->select("BaseTbl.id, BaseTbl.accessor, BaseTbl.report_type, BaseTbl.created_at, BaseTbl.filename, User.name, User.email, User.isDeleted");
        $this->db->from("tbl_reports as BaseTbl");
        $this->db->join("tbl_users as User", "User.userId = BaseTbl.created_by", "left");
        $query = $this->db->get();
        return $query->num_rows();
    }

    function reportlist($page, $segment)
    {
        $this->db->select("BaseTbl.id, BaseTbl.accessor, BaseTbl.report_type, BaseTbl.created_at, BaseTbl.filename, User.name, User.email, User.isDeleted");
        $this->db->from("tbl_reports as BaseTbl");
        $this->db->join("tbl_users as User", "User.userId = BaseTbl.created_by", "left");
        $this->db->order_by("BaseTbl.id", "DESC");
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        return $query->result();
    }
}
