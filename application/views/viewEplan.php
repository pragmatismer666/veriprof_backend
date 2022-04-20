<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> Eplan<small>Download, Delete</small>
        </h1>
    </section>
    <section class="content">
        <!-- <div class="row">
            <div class="col-xs-12 text-right">
                <div class="form-group">
                    <a class="btn btn-primary" href="<?php echo base_url(); ?>addNew"><i class="fa fa-plus"></i> Add New</a>
                </div>
            </div>
        </div> -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Eplan List</h3>
                        <div class="box-tools">
                        </div>
                    </div><!-- /.box-header -->
                        <table class="table table-hover">
                            <tr>
                                <th>ID</th>
                                <th>Client Name</th>
                                <th>Plan Title</th>
                                <th>Plan Area</th>
                                <th>Plan Cost</th>
                                <th>Plan No</th>
                                <th>Plan Verify No</th>
                                <th>Creator Name</th>
                                <th>Creator Email</th>
                                <th>Created At</th>
                                <th class="text-center">File(Download)</th>
                                <th class="text-center">Certificate(Download)</th>
                            </tr>
                            <?php
                            if (sizeof($eplanRecords) > 0) {
                                $i = 1;
                                foreach ($eplanRecords as $record) {
                            ?>
                                    <tr>
                                        <td><?php echo $i; ?></td>
                                        <td><?php echo $record->client_name?></td>
                                        <td><?php echo $record->project_title?></td>
                                        <td><?php echo $record->project_area ?></td>
                                        <td><?php echo $record->project_cost ?></td>
                                        <td><?php echo $record->project_plan_no?></td>
                                        <td><?php echo $record->verify_code?></td>
                                        <td><?php echo $record->name?></td>
                                        <td><?php echo $record->email?></td>
                                        <td><?php echo date("d-m-Y", strtotime($record->created_at)) ?></td>
                                        <td class="text-center">
                                            <a class="btn btn-sm btn-primary" href="<?php echo base_url() . 'download/' . $record->file; ?>" title="Login history"><i class="fa fa-history"></i></a>
                                        </td>
                                        <td class="text-center">
                                            <a class="btn btn-sm btn-primary" href="<?php echo base_url() . 'download/' . $record->certificate; ?>" title="Login history"><i class="fa fa-history"></i></a>
                                        </td>
                                    </tr>
                            <?php $i++;
                                }
                            }
                            ?>
                        </table>
                </div><!-- /.box -->
            </div>
        </div>
    </section>
</div>

<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/common.js" charset="utf-8"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('ul.pagination li a').click(function(e) {
            e.preventDefault();
            var link = jQuery(this).get(0).href;
            var value = link.substring(link.lastIndexOf('/') + 1);
            jQuery("#searchList").attr("action", baseURL + "userListing/" + value);
            jQuery("#searchList").submit();
        });
    });
</script>