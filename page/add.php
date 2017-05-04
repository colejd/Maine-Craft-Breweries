<?php
session_start();
require_once '../php/class/class.user.php';
$user = new USER();

// Redirect to login page if not logged in
if(!$user->is_logged_in())
{
    $user->redirect('login.php');
}

?>

<!DOCTYPE html>
<html>

<head>
    <!-- Import common header -->
    <?php require_once "../partials/head.php"; ?>
    <title>Add | Maine Craft Breweries</title>
</head>


<body>

<!-- Import navbar -->
<?php require_once "../partials/navbar.php"; ?>

<!-- Main area -->
<div class="container-fluid">
    <div class="col-xs-12 col-md-5">
        <!-- Search Type selector -->
        <label for="add-type-select">Type:</label>
        <select class="form-control" id="add-type-select" name="add-type-select">
            <option>Brewery</option>
            <option selected>Beer</option>
            <option>Retailer</option>
        </select>

        <!-- Partials are injected here based on the selector state -->
        <div id="form-container"></div>

    </div>

    <div class="col-xs-12 col-md-7" style="margin-top:1.8em">
        <!-- Results are injected in results-container based on search results -->
        <div class="panel panel-default">
            <div class="panel-heading">Results</div>
            <div class="panel-body" id="results-container"></div>
        </div>
    </div>


</div>

<script>
    var addMode = "";
    $("#add-type-select").change(function(e){
        e.preventDefault();
        RebuildForm();
    });

    function RebuildForm(){
        addMode = $("#add-type-select").find(":selected").text();
        console.log("Value changed to " + addMode);
        // Reset form and results
        $("#form-container").html("");
        $("#results-container").html("");
        $("#results-container").parent().hide();

        // Load in form logic for chosen option
        if(addMode == "Brewery"){
            $("#form-container").load("../partials/add/add_brewery.php");
        }
        else if (addMode == "Beer") {
            $("#form-container").load("../partials/add/add_beer.php");
        }
        else if (addMode == "Retailer") {
            $("#form-container").load("../partials/add/add_retailer.php");
        }



    }
    RebuildForm();

</script>

</body>
</html>
