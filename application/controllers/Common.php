<?php if (!defined("BASEPATH")) exit("No direct script access allowed");

include_once(__DIR__ . "/pdf/fpdf.php");

class Common extends CI_Controller
{

    private static $instance = null;
    public $image_path = "/assets/images/pdf_back.jpeg";
    public $image_path_bid = "/assets/images/pdf_bid_back.jpg";
    // public $image_path = "\\assets\\images\\pdf_back.jpeg";

    public function __construct()
    {
        parent::__construct();
        $this->load->model("project_model");
    }

    static public function getInstance()
    {
        if (self::$instance == null) {
            self::$instance = new Accessor();
        }
        return self::$instance;
    }

    public function sendEmail($emailaddress, $verified)
    {
        try {
            $url = "https://api.sendgrid.com/v3/mail/send";
            $curl = curl_init($url);
            curl_setopt($curl, CURLOPT_URL, $url);
            $headers = array(
                "Authorization: Bearer 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",
                "Content-Type: application/json"
            );
            curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
            $data = '{"personalizations": [{"to": [{"email": "' . $emailaddress . '" }]}],"from": {"email": "info@veriprof.co.za"},"subject": "Verification Email","content": [{"type": "text/plain", "value": "' . $verified . '"}]}';
            curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            curl_exec($curl);
            curl_close($curl);
            return true;
        } catch (\Throwable $th) {
            return false;
        }
    }

    public function getVerifyCode()
    {
        $charset = "ABCDEFGHIGKLMNOPQRSTUVWXYZ";
        $base = strlen($charset);
        $result = "";
        $now = explode(" ", microtime())[1];
        while ($now >= $base) {
            $i = $now % $base;
            $result = $charset[$i] . $result;
            $now /= $base;
        }
        return substr($result, -7);
    }

    public function getVerifyNumberCode()
    {
        $charset = "0123456789";
        $base = strlen($charset);
        $result = "";
        $now = explode(" ", microtime())[1];
        while ($now >= $base) {
            $i = $now % $base;
            $result = $charset[$i] . $result;
            $now /= $base;
        }
        $verification_code = substr($result, -5);
        return $verification_code;
    }

    public function createReportPDF($detail)
    {
        try {
            $pdf = new FPDF("P", "mm", "A4");
            $pdf->AddPage();
            $pdf->Image(getcwd() . $this->image_path_bid, 0, 0, 210, 297);
            $pdf->SetFont("Arial", null, 20);
            $pdf->SetXY(70, 65);
            $pdf->Write(0, strtoupper($detail["report_type"]) . "  SUBMISSION");
            $font_size = 12;
            $space_size = 6;
            // if ( $detail["report_type"] == "Eplan" ) {
            //     $font_size = 11;
            //     $space_size = 5.4;
            // }
            $pdf->SetFont("Arial", null, $font_size);
            $pdf->SetXY(20, 77);
            $pdf->Write(0, "Assessor : " . $detail["accessor"]);
            $pdf->SetXY(20, 83);
            $pdf->Write(0, "Created Date : " . $detail["created_at"]);
            $pdf->SetXY(20, 89);
            $pdf->Write(0, "Veriprof Score : " . $detail["score"]);
            $continue_number = 0;
            $datas = json_decode($detail["data"], true);
            // log_message("debug", gettype($datas));
            foreach ($datas as $each_line) {
                $data = json_decode(json_encode($each_line));
                $pdf->SetXY(20, 92 + (intval($data->id) - $continue_number) * $space_size);
                // log_message("debug", "interval : ".intval($data->id));
                $keyword = "";
                if (strcmp($data->key, "FILE") == 0 || strcmp($data->key, "CREATED BY") == 0 || strcmp($data->key, "ID") == 0 || strcmp($data->key, "SCHEDULE STATUS") == 0) {
                    $continue_number += 1;
                    continue;
                } else if (strcmp($data->key, "COMPLETED_AT") == 0) {
                    $keyword = "COMPLETED DATE";
                } else if (strcmp($data->key, "PNAME") == 0) {
                    $keyword = "NAME";
                } else if (strcmp($data->key, "PTYPE") == 0) {
                    $keyword = "TYPE";
                } else if (strpos($data->key, "_") !== false) {
                    $keyword1 = explode("_", $data->key)[0];
                    $keyword2 = explode("_", $data->key)[1];
                    if (strcmp($keyword1, "pl") == 0) {
                        $keyword = "PROJECT MANAGER " . strtoupper($keyword2);
                    } else if (strcmp($keyword1, "proj") == 0) {
                        $keyword = "PROJECT " . strtoupper($keyword2);
                    } else if (strcmp($keyword1, "prof") == 0) {
                        $keyword = "PROFESS " . strtoupper($keyword2);
                    } else if (strcmp($keyword1, "const") == 0) {
                        $keyword = "CONSTRUCTION " . strtoupper($keyword2);
                    } else {
                        $keyword = strtoupper($keyword1) . " " . strtoupper($keyword2);
                    }
                } else {
                    $keyword = strtoupper($data->key);
                }
                $pdf->Write(0, $keyword);
                $pdf->SetXY(100, 92 + (intval($data->id) - $continue_number) * $space_size);
                if (strcmp($data->key, "IS HEAD") == 0) {
                    if (strcmp($data->val, "0") == 0) {
                        $pdf->Write(0, "Branch Office");
                        $pdf->SetXY(170, 92 + (intval($data->id) - $continue_number) * $space_size);
                    } else {
                        $pdf->Write(0, "Head Office");
                        $pdf->SetXY(170, 92 + (intval($data->id) - $continue_number) * $space_size);
                    }
                } else {
                    $pdf->Write(0, $data->val);
                    $pdf->SetXY(170, 92 + (intval($data->id) - $continue_number) * $space_size);
                }
                if ($data->status == 0) {
                    $pdf->Write(0, "Unverified");
                } else {
                    $pdf->Write(0, "Verified");
                }
            }
            $savedName = time() . "_" . $detail["report_type"] . ".pdf";
            // $path = getcwd() . "\\assets\\create\\report\\" . $savedName;
            $path = getcwd() . "/assets/create/report/" . $savedName;
            $pdf->Output($path, "F");
            return $savedName;
        } catch (\Throwable $th) {
            return "false";
        }
    }

    public function createEplanPdf($detail)
    {
        try {
            $pdf = new FPDF("P", "mm", "A4");
            $pdf->AddPage();
            $pdf->Image(getcwd() . $this->image_path, 0, 0, 210, 297);
            $pdf->SetFont("Arial", null, 20);
            $title = "E-PLAN FILLING CONFIRMATION";
            $pdf->SetXY(48, 75);
            $pdf->Write(0, $title);
            $pdf->SetFont("Arial", null, 15);
            $pdf->SetXY(21, 90);
            $pdf->Write(0, "This serves to confirm that the outlined project, whose details appear");
            $pdf->SetXY(18, 100);
            $pdf->Write(0, "below, has been duly filed in accordance with the provisions of the relevant");
            $pdf->SetXY(18, 110);
            $pdf->Write(0, "professional council with VeriProf.");
            $pdf->SetXY(26, 125);
            $pdf->Write(0, "1. Project Title  :  " . $detail["project_title"]);
            $pdf->SetXY(26, 133);
            $pdf->Write(0, "2. ERF NO  :  " . $detail["erfno"]);
            $pdf->SetXY(26, 141);
            $pdf->Write(0, "3. LOCATION  :  " . $detail["project_address_line_1"]);
            $pdf->SetXY(55, 149);
            $pdf->Write(0, $detail["project_address_line_2"]);
            $pdf->SetXY(55, 157);
            $pdf->Write(0, $detail["project_city"] . "  " . $detail["project_province"]);
            $pdf->SetXY(55, 165);
            $pdf->Write(0, $detail["project_zipcode"]);
            $pdf->SetXY(26, 173);
            $pdf->Write(0, "4. VeriProf PLAN NO  :  " . Strval($detail["project_plan_no"]));
            $pdf->SetXY(26, 181);
            $pdf->Write(0, "5. ESTIMATED COST  :  R" . $detail["project_cost"]);
            $pdf->SetXY(26, 189);
            $pdf->Write(0, "6. Responsible Prof Name  :  " . $detail["professional"]);
            $pdf->SetXY(26, 197);
            $pdf->Write(0, "7. PR. REGISTRATION NO.  :  " . $detail["professional_reg_number"]);
            $pdf->SetXY(26, 205);
            $pdf->Write(0, "8. EMAIL  :  " . $detail["contact_email"]);
            $pdf->SetXY(26, 213);
            $pdf->Write(0, "9. TELEPHONE  :  " . $detail["contact_phone"]);
            $pdf->SetXY(18, 220);
            $pdf->Write(0, "Please contact VeriProf for further clarification if required.");
            $pdf->SetXY(18, 235);
            $pdf->Write(0, "Veriprof");
            $savedName = time() . "_" . $detail["project_title"] . ".pdf";
            // $path = getcwd() . "\\assets\\certificate\\" . $savedName;
            $path = getcwd() . "/assets/certificate/" . $savedName;
            $pdf->Output($path, "F");
            return $savedName;
        } catch (\Throwable $th) {
            return "false";
        }
    }

    public function createBidPDF($detail)
    {
        try {
            $pdf = new FPDF("P", "mm", "A4");
            $pdf->AddPage();
            $pdf->Image(getcwd() . $this->image_path_bid, 0, 0, 210, 297);
            $pdf->SetFont("Arial", null, 20);
            $title = "CONFIRMATION OF BID PARTCIPATION";
            $pdf->SetXY(40, 75);
            $pdf->Write(0, $title);
            $pdf->SetFont("Arial", null, 13);
            $pdf->SetXY(18, 91);
            $pdf->Write(0, "Ref No : " . $detail["professional_reg_no"]);
            $pdf->SetXY(18, 99);
            $pdf->Write(0, "Date : " . $detail["created_at"]);
            $pdf->SetXY(18, 107);
            $pdf->Write(0, "To Whom It May Concern.");
            $pdf->SetXY(55, 122);
            $pdf->Write(0, "REF : LETTER OF BID PARTCIPATION");
            $pdf->SetXY(18, 133);
            $pdf->Write(0, "This letter serves to confirm that the individual whose details appear below is");
            $pdf->SetXY(18, 141);
            $pdf->Write(0, "voluntarily tendering/participating for professional services in the bid as detailed below.");
            $pdf->SetXY(18, 153);
            $pdf->Write(0, "1. Name  :  " . $detail["name"]);
            $pdf->SetXY(18, 161);
            $pdf->Write(0, "2. Surname  :  " . $detail["surname"]);
            $pdf->SetXY(18, 169);
            $pdf->Write(0, "3. Professional Reg No  :  " . $detail["professional_reg_no"]);
            $pdf->SetXY(18, 177);
            $pdf->Write(0, "4. Email Add.  :  " . $detail["email_add"]);
            $pdf->SetXY(18, 185);
            $pdf->Write(0, "5. Cell  :  " . $detail["cell"]);
            $pdf->SetXY(18, 193);
            $pdf->Write(0, "6. Bidder  :  " . $detail["bidder"]);
            $pdf->SetXY(18, 201);
            $pdf->Write(0, "7. Client / Department  :  " . $detail["client_department"]);
            $pdf->SetXY(18, 209);
            $pdf->Write(0, "8. Bid No  :  " . $detail["bid_no"]);
            $pdf->SetXY(18, 217);
            $pdf->Write(0, "9. Short Description  :  " . $detail["short_description"]);
            $pdf->SetXY(18, 228);
            $pdf->Write(0, "  Detailed particulars of the concerned professional can be found");
            $pdf->SetXY(18, 236);
            $pdf->Write(0, "on www.VeriProf.co.za.");
            $pdf->SetXY(18, 245);
            $pdf->Write(0, "  For more information please do not hesitate to contact our");
            $pdf->SetXY(18, 253);
            $pdf->Write(0, " agents who will be more than happy to assist you further.");
            $pdf->SetXY(18, 268);
            $pdf->Write(0, "Issued by VeriProf");
            $savedName = time() . "_" . $detail["bid_no"] . ".pdf";
            // $path = getcwd() . "\\assets\\bid\\" . $savedName;
            $path = getcwd() . "/assets/bid/" . $savedName;
            $pdf->Output($path, "F");
            return $savedName;
        } catch (\Throwable $th) {
            log_message("debug", "create_bid_pdf" . json_encode($th));
            return "false";
        }
    }
}
