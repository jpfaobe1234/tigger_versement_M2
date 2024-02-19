    <!-- Header -->
    <header>
        <!-- Vous pouvez ajouter ici le contenu de votre en-tête -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
          <div class="container-fluid">
              <!-- Placer le bouton à gauche -->
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
              </button>
              <!-- Logo ou titre -->
              <a class="navbar-brand" href="#">Rôle : <?= $this->session->userdata['role']; ?></a>
              <!-- Titre du projet -->
              <h5 style="color:bisque; margin-left: 20%;">PROJET - M2 - TRIGGER</h5>
              <!-- Bouton à droite -->
              <button class="ml-auto"><?= $this->session->userdata['email']; ?></button>
          </div>
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
                <?php 
                  if ($this->session->userdata['role'] == 'admin') { ?>
                    <li class="list-group-item bg-dark"><a href="<?php echo base_url('audit'); ?>">Audit</a></li>                
                <?php 
                  }
                ?>
                <li class="list-group-item bg-dark"><a href="<?php echo base_url('login/logout'); ?>">Déconnexion</a></li>
              </ul>
            </div>
          </div>
          <!-- End Sidebar -->