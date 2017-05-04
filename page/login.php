<?php
session_start();
require_once '../php/class/class.user.php';
$user = new USER();

// Redirect to index if logged in
if($user->is_logged_in())
{
    $user->redirect('index.php');
}

// Handle form submit (do login)
if(isset($_POST['btn-login']))
{
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    if($user->login($email, $password))
    {
        $user->redirect('index.php');
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <!-- Import common header -->
    <?php require_once "../partials/head.php"; ?>
    <title>Log In | Maine Craft Breweries</title>
</head>

<body>

<!-- Import navbar -->
<?php require_once "../partials/navbar.php"; ?>

<div class="container">
    <div class="row">
        <div class="col-lg-6 col-md-6">
            <form class="form-signin" method="post">
                <?php
                if(isset($_GET['error']))
                {
                    ?>
                    <div class='alert alert-danger'>
                        <strong>Sorry, that doesn't seem to be correct! Did you mistype something?</strong>
                    </div>;
                    <?php
                };
                ?>
                <h2>Log In</h2>

                <hr />

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" class="input-block-level form-control" placeholder="Email" name="email" required />
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="input-block-level form-control" placeholder="Password" name="password" required />
                </div>

                <hr />

                <button class="btn btn-large btn-primary" type="submit" name="btn-login">Log In</button>
                <a href="signup.php" class="btn btn-large">Sign Up</a>

                <hr />

            </form>
        </div>
    </div>

</div> <!-- /container -->

</body>
</html>