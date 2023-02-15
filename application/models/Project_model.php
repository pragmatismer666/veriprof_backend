<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

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
        $query = $this->db->select("*")->from("tbl_projects")->order_by("id", "desc")->get();
        return $query->result();
    }

    function addNew($data)
    {
        if (isset($data["id"]) && !empty($data["id"])) {
            $this->db->where(array("id" => $data["id"]));
            $this->db->update("tbl_projects", $data);
            return $data["id"];
        } else {
            $query = $this->db->select("*")->from("tbl_projects")->where(array("title" => $data["title"], "type" => $data["type"]))->order_by("id", "desc")->get();
            if (sizeof($query->result()) > 0) {
                $id = ($query->result())[0]->id;
                return "exist";
            } else {
                $sql = $this->db->set($data)->get_compiled_insert("tbl_projects");
                $res = $this->db->simple_query($sql);
                if ($res) {
                    return $this->db->insert_id();
                }
                return false;
            }
        }
    }

    function getProjectBy($data)
    {
        $query = $this->db->select("*")->from("tbl_projects")->where($data)->order_by("id", "desc")->get();
        $data = [];
        foreach ($query->result() as $row) {
            $data[] = $row;
        }
        return $data;
    }

    function getProjectsInfo($data) {
        $projects = $this->db->select("*")->from("tbl_projects")->where($data)->get()->result();
        log_message("debug", json_encode($projects));
        for ($i = 0; $i < sizeof($projects); $i++) {
            $schedules = $this->db->select("*")->from("tbl_schedule")->where(array("verify_target" => "project", "verify_content_id" => $projects[$i]->id, "verify_user_id" => $projects[$i]->created_by))->get()->result();
            if ($schedules && sizeof($schedules) > 0) {
                $projects[$i]->schedule_data = $schedules[0]->date;
                $projects[$i]->schedule_status = $schedules[0]->is_done;
            } else {
                $projects[$i]->schedule_data = "";
                $projects[$i]->schedule_status = "0";
            }
        }
        return $projects;
    }

    function changeProjectStatus($data)
    {
        $verified = $data["verified"];
        $final_cost = $data["final_cost"];
        $completed_at = $data["completed_at"];
        $user_id = $data["user_id"];
        $title = $data["title"];
        // log_message("debug", json_encode($data));
        if ($verified == "Completed" || $verified == "Cancelled") {
            $query = $this->db->select("*")->from("tbl_projects")->where(array("created_by" => $user_id, "title" => $title))->order_by("id", "desc")->get();
            foreach ($query->result() as $row) {
                $variable = number_format((float)((floatval($row->const_cost) - floatval($final_cost)) / floatval($final_cost) * 100), 2, ".", "");
                $this->db->where("created_by", $user_id);
                $this->db->where("title", $title);
                $this->db->update("tbl_projects", ["status" => $verified, "final_cost" => strval($final_cost), "completed_at" => $completed_at, "variable" => $variable, "pratical_certification" => $data["pratical_certification"], "final_certification" => $data["final_certification"], "final_account" => $data["final_account"]]);
                break;
            }
        } else {
            $this->db->where("created_by", $user_id);
            $this->db->where("title", $title);
            $this->db->update("tbl_projects", ["status" => $verified, "completed_at" => $completed_at]);
        }
        return $this->db->affected_rows();
    }

    function updateProject($project_id, $update_data)
    {
        $query = $this->db->select("*")->from("tbl_projects")->where(array("id" => $project_id))->order_by("id", "desc")->get();
        if (sizeof($query->result()) > 0) {
            $this->db->where("id", $project_id);
            $this->db->update("tbl_projects", $update_data);
            return $this->db->affected_rows();
        } else {
            return false;
        }
    }

    function projectlistCount()
    {
        $this->db->select("BaseTbl.id, BaseTbl.title, BaseTbl.prof_type, BaseTbl.year, BaseTbl.client_name, BaseTbl.pl_name, BaseTbl.pl_email, BaseTbl.pl_phone, BaseTbl.proj_street1, BaseTbl.proj_street2, BaseTbl.proj_street3, BaseTbl.proj_city, BaseTbl.proj_state, BaseTbl.proj_zip, BaseTbl.status, BaseTbl.file, User.name, User.email, User.isDeleted");
        $this->db->from("tbl_projects as BaseTbl");
        $this->db->join("tbl_users as User", "User.userId = BaseTbl.created_by", "left");
        $query = $this->db->get();
        return $query->num_rows();
    }

    function projectlist($page, $segment)
    {
        $this->db->select("BaseTbl.id, BaseTbl.title, BaseTbl.prof_type, BaseTbl.year, BaseTbl.client_name, BaseTbl.pl_name, BaseTbl.pl_email, BaseTbl.pl_phone, BaseTbl.proj_street1, BaseTbl.proj_street2, BaseTbl.proj_street3, BaseTbl.proj_city, BaseTbl.proj_state, BaseTbl.proj_zip, BaseTbl.status, BaseTbl.file, User.name, User.email, User.isDeleted");
        $this->db->from("tbl_projects as BaseTbl");
        $this->db->join("tbl_users as User", "User.userId = BaseTbl.created_by", "left");
        $this->db->order_by("BaseTbl.id", "DESC");
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        return $query->result();
    }
}
