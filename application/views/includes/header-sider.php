    <!-- Header -->
    <header>
        <!-- Vous pouvez ajouter ici le contenu de votre en-tête -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark" >
            <a class="navbar-brand" href="#">Admin</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <h5 style="margin-left: 20% ; color:bisque">PROJET - M2 - TRIGGER</h5>
        </nav>
    </header>

    <div class="container-fluid">

      <div class="row">

          <!-- Sidebar -->
          <div class="col-md-3 bg-dark">
            <div class="sidebar">
              <ul class="list-group list-group-flush">
                <li class="list-group-item bg-dark"><a href="<?php echo base_url('client'); ?>">Client</a></li>
                <li class="list-group-item bg-dark"><a href="<?php echo base_url('virement'); ?>">Virement</a></li>
                <li class="list-group-item bg-dark"><a href="<?php echo base_url('audit'); ?>">Audit</a></li>
              </ul>
            </div>
          </div>
          <!-- End Sidebar -->