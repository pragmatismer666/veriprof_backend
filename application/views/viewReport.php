<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> Report <small>Download PDF, Delete</small>
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Report List</h3>
                        <div class="box-tools">
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>ID</th>
                                <th>Assessor</th>
                                <th>Report Type</th>
                                <th>Creator</th>
                                <th>Creator Email</th>
                                <th>Created At</th>
                                <th class="text-center">File(Download)</th>
                                <th class="text-center">Actions</th>
                            </tr>
                            <?php
                            if (sizeof($reportRecords) > 0) {
                                $i = 1;
                                foreach ($reportRecords as $record) {
                            ?>
                                    <tr>
                                        <td><?php echo $i; ?></td>
                                        <td><?php echo $record->accessor ?></td>
                                        <td><?php echo $record->report_type ?></td>
                                        <td><?php echo $record->name ?></td>
                                        <td><?php echo $record->email ?></td>
                                        <td><?php echo date("d-m-Y", strtotime($record->created_at)) ?></td>
                                        <td class="text-center">
                                            <a class="btn btn-sm btn-primary" href="<?php echo base_url() . 'download/report/' . $record->filename; ?>" title="Login history"><i class="fa fa-history"></i></a>
                                        </td>
                                        <td class="text-center">
                                            <a class="btn btn-sm btn-danger" href="<?php echo base_url() . 'delete/report/' . $record->id; ?>" onclick="return confirm('Are you sure you ?');" title="Delete"><i class="fa fa-trash"></i></a>
                                        </td>
                                    </tr>
                            <?php $i++;
                                }
                            }
                            ?>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer clearfix">
                        <?php echo $this->pagination->create_links(); ?>
                    </div>
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