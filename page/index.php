<!-- Main screen. -->

<?php
session_start();
require_once '../php/class/class.user.php';
$user = new USER();
?>


<!DOCTYPE html>
<html>

<head>
    <!-- Import common header -->
    <?php require_once "../partials/head.php"; ?>
    <title>Home | Maine Craft Breweries</title>
</head>


<body>
<!-- Import navbar -->
<?php require_once "../partials/navbar.php"; ?>

<!-- Main area -->
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6 col-sm-6">

            <h1>Maine Craft Breweries</h1>

            <hr />

            <?php

                if ($user->is_logged_in()){
                    $info = $user->getInfo();
                    $first_name = $info['first_name'];

                    echo "Welcome, $first_name.<br /><br />";
                    echo "<a href='add.php'>Add Information</a><br />";
                    echo "<a href='edit.php'>Edit Information</a>";
                } else {
                    echo "Search beers <a href='search.php'>here</a>.<br /><br />";
                    echo "To add or edit information, please <a href='login.php'>log in</a> or <a href='signup.php'>sign up</a>.";
                }

            ?>

        </div>

    </div>

</div>

</body>
