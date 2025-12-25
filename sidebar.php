<aside class="sidebar" id="sidebar">
  <div class="brand">
    <img src="assets/PAUD.png" alt="PAUD logo">
    <div>
      <div class="title">PAUD K-Means</div>
      <small style="color:#64748b">Guru • Dashboard</small>
    </div>
  </div>

  <nav class="menu">
    <a href="dashboard.php" class="<?= basename($_SERVER['PHP_SELF'])=='dashboard.php'?'active':'' ?>">📊 Dashboard</a>
    <a href="dataanak.php" class="<?= basename($_SERVER['PHP_SELF'])=='dataanak.php'?'active':'' ?>">🧒 Data Anak</a>
    <a href="input.php" class="<?= basename($_SERVER['PHP_SELF'])=='input.php'?'active':'' ?>">📝 Input Perkembangan</a>
    <a href="rekomendasi.php" class="<?= basename($_SERVER['PHP_SELF'])=='rekomendasi.php'?'active':'' ?>">📝 Rekomendasi</a>
    <a href="kmeans.php" class="<?= basename($_SERVER['PHP_SELF'])=='kmeans.php'?'active':'' ?>">🔢 K-Means</a>
    <a href="hasil.php" class="<?= basename($_SERVER['PHP_SELF'])=='hasil.php'?'active':'' ?>">📁 Hasil Klaster</a>
    <a href="laporan.php" class="<?= basename($_SERVER['PHP_SELF'])=='laporan.php'?'active':'' ?>">📄 Laporan</a>
    <a href="logout.php">🚪 Keluar</a>
  </nav>
</aside>
