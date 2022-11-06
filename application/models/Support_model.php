<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

/**
 * Class : User_model (User Model)
 * User model class to get to handle user related data 
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Support_model extends CI_Model
{
    function addStaff($data, $buzi_id, $user_id, $office_id)
    {
        $staffNum = 0;
        // log_message("debug", "==================================");
        for ($i = 0; $i < sizeof($data); $i++) {
            $query = $this->db->select("*")->from("tbl_staffs")->where(array("buzi_id" => $buzi_id, "created_by" => $user_id, "email" => $data[$i]["email"], "name" => $data[$i]["name"], "phone" => $data[$i]["phone"]))->get();
            if (sizeof($query->result()) > 0) {
                $staffNum++;
                continue;
            }
            $data[$i]["buzi_id"] = $buzi_id;
            $data[$i]["created_by"] = strval($user_id);
            $data[$i]["created_at"] = date("Y-m-d h:i:s");
            $data[$i]["office_id"] = strval($office_id);
            $data[$i]["status"] = "Unverified";
            // log_message("debug", json_encode($data[$i]));
            $sql = $this->db->set($data[$i])->get_compiled_insert("tbl_staffs");
            $res = $this->db->simple_query($sql);
            if ($res) {
                $staffNum++;
                // $common = new Common();
                // $email_message = "Hello, ".$data[$i]["name"].", Just listed you as a staff member of current business by your director. \nKindly send your response to info@veriprof.co.za within the next 24hours to verify this information.";
                // $common->sendEmail($data[$i]["email"], $email_message);
            }
        }
        if (sizeof($data) > $staffNum) {
            return false;
        }
        return true;
    }

    function addEquip($equips, $buzi_id, $created_by, $equipflag)
    {
        $equipNum = 0;
        for ($i = 0; $i < sizeof($equips); $i++) {
            $query = $this->db->select("*")->from("tbl_equips")->where(array("buzi_id" => $buzi_id, "created_by" => $created_by, "flag" => $equipflag, "name" => $equips[$i]["name"], "filename" => $equips[$i]["filename"]))->get();
            if (sizeof($query->result()) > 0) {
                $equipNum++;
                continue;
            }
            $each = array();
            $each["name"] = $equips[$i]["name"];
            $each["filename"] = $equips[$i]["filename"];
            $each["buzi_id"] = $buzi_id;
            $each["created_by"] = strval($created_by);
            $each["flag"] = $equipflag;
            $each["updated_at"] = date("Y-m-d h:i:s");
            // log_message("debug", json_encode($each));
            $sql = $this->db->set($each)->get_compiled_insert("tbl_equips");
            $res = $this->db->simple_query($sql);
            if ($res) {
                $equipNum++;
            }
        }
        if (sizeof($equips) > $equipNum) {
            return false;
        }
        return true;
    }

    function addOffice($head, $branchs, $buzi_id, $created_by)
    {
        // $headers = 0;
        $branchsNum = 0;
        $head["buzi_id"] = $buzi_id;
        $head["created_by"] = strval($created_by);
        $head["created_at"] = date("Y-m-d h:i:s");
        $head["is_head"] = "1";
        $head["verify_at"] = "";
        $head["verify_by"] = "";
        $query = $this->db->select("*")->from("tbl_offices")->where(array("buzi_id" => $buzi_id, "created_by" => $created_by, "is_head" => $head["is_head"]))->get();
        if (sizeof($query->result()) == 0) {
            $sql = $this->db->set($head)->get_compiled_insert("tbl_offices");
            // $headers = $this->db->simple_query($sql);
        } 
        // else {
        //     $sql = $this->db->set($head)->where(array("buzi_id" => $buzi_id, "created_by" => $created_by, "is_head" => $head["is_head"]))->get_compiled_update("tbl_offices");
        //     $exist = $this->db->simple_query($sql);
        //     if ($exist) {
        //         return (int)(($query->result())[0])->id;
        //     }
        //     return 0;
        // }
        // log_message("debug", json_encode($branchs));
        for ($i = 0; $i < sizeof($branchs); $i++) {
            $branchs[$i]["buzi_id"] = $buzi_id;
            $branchs[$i]["created_by"] = strval($created_by);
            $branchs[$i]["created_at"] = date("Y-m-d h:i:s");
            $branchs[$i]["is_head"] = "0";
            $branchs[$i]["verify_at"] = "";
            $branchs[$i]["verify_by"] = "";
            $query = $this->db->select("*")->from("tbl_offices")->where(array("buzi_id" => $buzi_id, "created_by" => $created_by, "phone" => $branchs[$i]["phone"], "email" => $branchs[$i]["email"]))->get();
            if (sizeof(($query->result())) > 0) {
                $branchsNum++;
                continue;
            } else {
                $sql = $this->db->set($branchs[$i])->get_compiled_insert("tbl_offices");
                $res = $this->db->simple_query($sql);
            }
            if ($res) {
                // $common = new Common();
                // $email_message = "Hello, ".$branchs[$i]["res_prof_name"].", Just added you as a responsible professional in Office.\n Kindly send your response to info@veriprof.co.za within the next 24hours to verify this information.";
                // $common->sendEmail($branchs[$i]["email"], $email_message);
                // // $url = "https://api.sendgrid.com/v3/mail/send";
                // // $curl = curl_init($url);
                // // curl_setopt($curl, CURLOPT_URL, $url);
                // // $headers = array(
                // // "Authorization: Bearer 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",
                // // "Content-Type: application/json"
                // // );
                // // curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
                // // $data = "{"personalizations": [{"to": [{"email": "".$branchs[$i]["email"]."" }]}],"from": {"email": "info@veriprof.co.za"},"subject": "Verification Email","content": [{"type": "text/plain", "value": "".$email_message.""}]}";
                // // curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                // // curl_exec($curl);
                // // curl_close($curl);
                $branchsNum++;
            }
        }
        return true;
        // if ($headers) {
        //     return $this->db->insert_id();
        // } else {
        //     return 0;
        // }
    }

    function mybranchs($created_by)
    {
        $query = $this->db->select("*")->from("tbl_offices")->where(array("created_by" => $created_by, "is_head" => "0"))->get();
        return $query->result();
    }

    function getlist()
    {
        return $this->db->select("email,status")->from("tbl_offices")->get()->result();
    }

    function ids($buzi_id, $office_id, $profile_id)
    {
        $query = $this->db->select("*")->from("tbl_id")->where("profile_id", $profile_id)->get();
        if (sizeof($query->result()) > 0) {
            $sql = $this->db->set(array("buzi_id" => $buzi_id, "office_id" => $office_id))->where("profile_id", $profile_id)->get_compiled_update("tbl_id");
            $this->db->simple_query($sql);
            return true;
        } else if (sizeof($query->result()) == 0) {
            $sql = $this->db->set(array("profile_id" => $profile_id, "buzi_id" => $buzi_id, "office_id" => $office_id))->get_compiled_insert("tbl_id");
            $res = $this->db->simple_query($sql);
            if ($res) {
                return true;
            }
        }
        return true;
    }

    function getId($profile_id)
    {
        $query = $this->db->select("*")->from("tbl_id")->where("profile_id", $profile_id)->get();
        return $query->result();
    }

    function getoffices($data)
    {
        return $this->db->select("*")->from("tbl_offices")->where($data)->get()->result();
    }

    function updateOffices($key, $update)
    {
        $query = $this->db->select("*")->from("tbl_offices")->where($update)->get();
        if (sizeof($query->result()) > 0) {
            return true;
        } else {
            $sql = $this->db->set($update)->where($key)->get_compiled_update("tbl_offices");
            return $this->db->simple_query($sql);
        }
    }

    function getStaff($data)
    {
        $staff = $this->db->select("*")->from("tbl_staffs")->where($data)->get()->result();
        // log_message("debug", json_decode($staff));
        if (empty($staff)) {
            return false;
        } else {
            $office = $this->getoffices(array("id", intval($staff[0]->office_id)));
            if (empty($office)) {
                return false;
            } else {
                return $office[0]->email;
            }
        }
    }

    function upStaff($email, $key)
    {
        $sql = $this->db->set("status", $key)->where("email", $email)->get_compiled_update("tbl_staffs");
        return $this->db->simple_query($sql);
    }
}
