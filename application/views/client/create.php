<!doctype html>
<html lang="en">

<head>
  <?php $this->load->view('includes/header'); ?>
  <title>Add New Post</title>
</head>

<body>
    <?php $this->load->view('includes/header-sider'); ?>

        <div class="col-md-4 my-2 mx-5 border border-5 justify-content-center">  
          
          <h2 class="text-center mb-3">Ajouter Client</h2>
          
          <div class="d-flex justify-content-between ">
            <h4></h4>
            <a class="btn btn-warning" href="<?php echo base_url('client'); ?>"> <i class="fas fa-angle-left"></i> Retour</a>
          </div>
  
          <form method="post" action="<?php echo base_url('client/store'); ?>">
  
  
            <div class="form-group">
              <label>Nom Clinet</label>
              <input type="text" class="form-control" name="nom_client">
            </div>
  
            <div class="form-group">
              <label>Solde</label>
              <input type="number" class="form-control" name="solde">
            </div>
  
            <div class="form-group">
              <button type="submit" class="btn btn-success"> <i class="fas fa-check"></i> Ajouter </button>
            </div>

          </form>
  
  
      </div>
    </div>
  </div>



  <?php $this->load->view('includes/footer'); ?>

</body>

</html>