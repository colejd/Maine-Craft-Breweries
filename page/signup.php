<?php
session_start();
require_once '../php/class/class.user.php';
$user = new USER();

if($user->is_logged_in())
{
    $user->redirect('index.php');
}


if(isset($_POST['btn-signup']))
{
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);
    $first_name = trim($_POST['first_name']);
    $last_name = trim($_POST['last_name']);

    $stmt = $user->runQuery("SELECT * FROM MCB_users WHERE email_address=:email_id");
    $stmt->execute(array(":email_id"=>$email));
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if($stmt->rowCount() > 0)
    {
        $msg = "
            <div class='alert alert-error'>
                This email is already registered. Please try another one!
            </div>
            ";
    }
    else
    {
        if($user->register($last_name, $first_name, $username, $password, $email))
        {
            $msg = "
                <div class='alert alert-success'>
                    <strong>Success!</strong>  
                    You have been registered. Please <a href='login.php'>log in</a>.
                </div>
                ";
        }
        else
        {
            echo "Query could not execute!";
        }
    }
}
?>


<!DOCTYPE html>
<html>
<head>
    <!-- Import common header -->
    <?php require_once "../partials/head.php"; ?>

    <title>Sign Up | Maine Craft Breweries</title>
</head>

<body id="login">

<!-- Import navbar -->
<?php require_once "../partials/navbar.php"; ?>

<?php if(isset($msg)) echo $msg;  ?>
<div class="container">
    <div class="row">
        <div class="col-lg-6 col-md-6">
            <div class="form-group">
                <form method="POST">

                    <h1>Sign Up for an Account</h1>

                    <hr />

                    <h4>Only users with accounts can edit information.</h4>

                    <label for="first_name" class="control-label">First Name</label>
                    <input type="text" class="form-control" placeholder="First Name" name="first_name" autocomplete="off" required /><br />

                    <label for="last_name" class="control-label">Last Name</label>
                    <input type="text" class="form-control" placeholder="Last Name" name="last_name" autocomplete="off" required /><br />

                    <label for="username" class="control-label">Username</label>
                    <input type="text" class="form-control" placeholder="Username" name="username" autocomplete="off" required /><br />

                    <label for="email">Email:</label>
                    <input type="email" class="form-control" placeholder="Email" name="email" autocomplete="off" required /><br />

                    <label for="password">Password:</label>
                    <input type="password" class="form-control" placeholder="Password" name="password" required /><br />

                    <hr />

                    <button class="btn btn-large btn-primary" type="submit" name="btn-signup">Sign Up</button>
                </form>

            </div>
        </div>
    </div>
    <!-- /container -->
</div>

</body>
</html>