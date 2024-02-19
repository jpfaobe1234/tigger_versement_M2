<!doctype html>
<html lang="en">

<head>
  <?php $this->load->view('includes/header'); ?>
  <title>Virement</title>
</head>

<body>

    <?php $this->load->view('includes/header-sider'); ?>

      <div class="col-md-9 my-2 justify-content-center"> 
        <h2 class="text-center mb-3">Audit Virement</h2>
        <table class="table table-bordered table-default">

          <thead class="thead-light">
            <tr>
              <th width="2%">#</th>
              <th width="25%">Type</th>
              <th width="53%">date_operation</th>
              <th width="20%">Num Virement</th>
              <th width="20%">Num Compte</th>
              <th width="20%">Nom Client</th>
              <th width="20%">Montant Ancien</th>
              <th width="20%">Montant Nouveau</th>
              <th width="20%">Utilisateur</th>
            </tr>
          </thead>

          <tbody>
            <?php
              $resulat = $this->db->order_by('id_audit', 'DESC')->get('audit')->result();
              $i = 1; foreach ($resulat as $post) { ?>

              <tr>
                <td><?php echo $i; ?></td>
                <td><?php echo $post->type; ?></td>
                <td><?php echo $post->date_operation; ?></td>
                <td><?php echo $post->id_vir; ?></td>
                <td><?php echo $post->id_client; ?></td>
                <td><?php echo $post->nom_client; ?></td>
                <td><?php echo $post->montant_ancien; ?></td>
                <td><?php echo $post->montant_nouveau; ?></td>
                <td><?php echo $post->utilisateur; ?></td>
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