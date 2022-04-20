<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> Project <small>Edit(Change Status)/(Download), Delete</small>
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
                        <h3 class="box-title">Project List</h3>
                        <div class="box-tools">
                        </div>
                    </div><!-- /.box-header -->
                        <table class="table table-hover">
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Project Type</th>
                                <th>Client Name</th>
                                <th>Leader Name</th>
                                <th>Leader Email</th>
                                <th>Leader Phone</th>
                                <th>Creator</th>
                                <th>Creator Email</th>
                                <th>Date</th>
                                <th>Status</th>
                                <th class="text-center">File(Download)</th>
                                <th class="text-center">Update Status</th>
                                <th class="text-center">Delete</th>
                            </tr>
                            <?php
                            if (sizeof($projectRecords) > 0) {
                                $i = 1;
                                foreach ($projectRecords as $record) {
                            ?>
                                    <tr>
                                        <td><?php echo $i; ?></td>
                                        <td><?php echo $record->title ?></td>
                                        <td><?php echo $record->prof_type ?></td>
                                        <td><?php echo $record->client_name ?></td>
                                        <td><?php echo $record->pl_name ?></td>
                                        <td><?php echo $record->pl_email ?></td>
                                        <td><?php echo $record->pl_phone ?></td>
                                        <td><?php echo $record->name ?></td>
                                        <td><?php echo $record->email ?></td>
                                        <td><?php echo $record->year ?></td>
                                        <td><?php echo $record->status ?></td>
                                        <td class="text-center">
                                            <a class="btn btn-sm btn-primary" href="<?php echo base_url() . 'download/' . $record->file; ?>" title="Login history"><i class="fa fa-history"></i></a>
                                        </td>
                                        <td class="text-center">
                                            <a class="btn btn-sm btn-info" href="<?php echo base_url() . 'project/update_status_cancel/' . $record->id; ?>" onclick="return confirm('Are you sure you ?');" title="Cancel">Cancel</a>
                                            <a class="btn btn-sm btn-info" href="<?php echo base_url() . 'project/update_status_ongoing/' . $record->id; ?>" onclick="return confirm('Are you sure you ?');" title="Ongoing">Ongoing</a>
                                            <a class="btn btn-sm btn-info" href="<?php echo base_url() . 'project/update_status_complete/' . $record->id; ?>" onclick="return confirm('Are you sure you ?');" title="Complete">Complete</a>
                                        </td>
                                        <td class="text-center">
                                            <!-- <a class="btn btn-sm btn-primary" href="<?php echo base_url() . 'login-history/' . $record->userId; ?>" title="Login history"><i class="fa fa-history"></i></a>
                                            <a class="btn btn-sm btn-info" href="<?php echo base_url() . 'editOld/' . $record->userId; ?>" title="Edit"><i class="fa fa-pencil"></i></a> -->
                                            <a class="btn btn-sm btn-danger" href="<?php echo base_url() . 'delete/report/' . $record->id; ?>" onclick="return confirm('Are you sure you ?');" title="Delete"><i class="fa fa-trash"></i></a>
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