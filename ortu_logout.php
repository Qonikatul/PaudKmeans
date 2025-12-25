<?php
session_start();
session_destroy();
header("Location: ortu_login.php");
exit;
?>
