<!doctype html>
<html lang="en">

<head>
  <?php $this->load->view('includes/header'); ?>
  <title>Client</title>
</head>

<body>

  <?php $this->load->view('includes/header-sider'); ?>

    <div class="col-md-9 my-2 justify-content-center">  
      
      <h2 class="text-center mb-3">Gérer Client</h2>
        <?php echo $this->session->flashdata('message'); ?>

        <div class="d-flex justify-content-between mb-3">
          <a href="<?= base_url('client/create') ?>" class="btn btn-success"> <i class="fas fa-plus"></i> Nouveau Client</a>
        </div>

        <table class="table table-bordered table-default">

          <thead class="thead-light">
            <tr>
              <th width="2%">Num Client</th>
              <th width="25%">Nom Client</th>
              <th width="20%">Solde</th>
              <th width="20%">Action</th>
            </tr>
          </thead>

          <tbody>

            <?php $i = 1; foreach ($data as $post) { ?>

              <tr>
                <td><?php echo $post->id_client; ?></td>
                <td><?php echo $post->nom_client; ?></td>
                <td><?php echo $post->solde; ?> Ar</td>
                <td>
                  <a href="<?= base_url('client/edit/' . $post->id_client) ?>" class="btn btn-primary"> <i class="fas fa-edit"></i> Edit </a>
                  <a href="<?= base_url('client/delete/' . $post->id_client) ?>" class="btn btn-danger" onclick="return confirm('Voulez-vous vraiment Supprimer ?')"> <i class="fas fa-trash"></i> Delete </a>
                </td>
              </tr>

            <?php $i++; } ?>

          </tbody>

        </table>

      </div>
    </div>
  </div>



  <?php $this->load->view('includes/footer'); ?>

</body>

</html>