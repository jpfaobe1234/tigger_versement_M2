<!doctype html>
<html lang="en">

<head>
  <?php $this->load->view('includes/header'); ?>
  <title>Virement</title>
</head>

<body>
  <?php $this->load->view('includes/header-sider'); ?>

    <div class="col-md-9 my-2 justify-content-center"> 
          
          <h2 class="text-center mb-3">Gérer Virement</h2>
        <?php echo $this->session->flashdata('message'); ?>

        <div class="d-flex justify-content-between mb-3">
          <a href="<?= base_url('virement/create') ?>" class="btn btn-success"> <i class="fas fa-plus"></i> Nouveau Virement</a>
        </div>

        <table class="table table-bordered table-default">

          <thead class="thead-light">
            <tr>
              <th width="2%">Num Virement</th>
              <th width="25%">Num Compte</th>
              <th width="53%">Montant</th>
              <th width="20%">Date Virement</th>
              <th width="20%">Utilisatteur</th>
              <th width="20%">Action</th>
            </tr>
          </thead>

          <tbody>

            <?php
              $data = $this->db->order_by('id_vir', 'DESC')->get('virement')->result();
               $i = 1; foreach ($data as $post) { ?>

              <tr>
                <td><?php echo $post->id_vir; ?></td>
                <td><?php echo $post->id_client; ?></td>
                <td><?php echo $post->montant; ?> Ar</td>
                <td><?php echo $post->date; ?></td>
                <td><?php echo $post->utilisateur; ?></td>
                <td>
                  <a href="<?= base_url('virement/edit/' . $post->id_vir) ?>" class="btn btn-primary"> <i class="fas fa-edit"></i> Edit </a>
                  <a href="<?= base_url('virement/delete/' . $post->id_vir) ?>" class="btn btn-danger" onclick="return confirm('Voulez-vous vraiment Supprimer ?')"> <i class="fas fa-trash"></i> Delete </a>
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