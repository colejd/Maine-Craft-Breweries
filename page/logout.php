<?php
session_start();
require_once '../php/class/class.user.php';
$user = new USER();

if ($user->is_logged_in()) {
    $user->logout();
}

$user->redirect('index.php');