<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> Business<small>Detail, Delete</small>
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
                        <h3 class="box-title">Business List</h3>
                        <div class="box-tools">
                        </div>
                    </div><!-- /.box-header -->
                        <table class="table table-hover">
                            <tr>
                                <th>ID</th>
                                <th>Business Name</th>
                                <th>Business Pcounil</th>
                                <th>Business Type</th>
                                <th>Business Diretor</th>
                                <th>Diretor Reg No</th>
                                <th>Creator Name</th>
                                <th>Creator Email</th>
                                <th>Updated Date</th>
                                <th>Status</th>
                                <th class="text-center">Detail</th>
                                <th class="text-center">Delete</th>
                            </tr>
                            <?php
                            if (sizeof($businessRecords) > 0) {
                                $i = 1;
                                foreach ($businessRecords as $record) {
                            ?>
                                    <tr>
                                        <td><?php echo $i; ?></td>
                                        <td><?php echo $record->pname ?></td>
                                        <td><?php echo $record->pcouncil ?></td>
                                        <td><?php echo $record->ptype ?></td>
                                        <td><?php echo $record->director ?></td>
                                        <td><?php echo $record->dir_prof_regno ?></td>
                                        <td><?php echo $record->name ?></td>
                                        <td><?php echo $record->email ?></td>
                                        <td><?php echo date("d-m-Y", strtotime($record->updated_at)) ?></td>
                                        <td><?php echo $record->status ?></td>
                                        <td class="text-center">
                                            <a class="btn btn-sm btn-primary" href="<?php echo base_url() . 'detail/' . $record->id; ?>" title="Login history"><i class="fa fa-history"></i></a>
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