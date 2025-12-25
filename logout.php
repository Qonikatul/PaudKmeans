<?php
session_start();
session_destroy();
header("Location: loginguru.php");
exit;
?>
