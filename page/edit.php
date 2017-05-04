<?php
session_start();
require_once '../php/class/class.user.php';
$user = new USER();

// Redirect to index if not logged in
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
    <title>Edit Beers | Maine Craft Breweries</title>
</head>


<body>

<!-- Import navbar -->
<?php require_once "../partials/navbar.php"; ?>

<!-- Main area -->
<div class="container-fluid">

    <div class="col-xs-12 col-md-5">
        <!-- Search Type selector -->
        <label for="beer-select">Beer:</label>
        <select class="form-control" id="beer-select" name="beer-select">
            <?php
            // Populate the dropdown with the name/id combination of each beer type
            require_once '../php/dbconfig.php';
            $database = new Database();
            $db = $database->dbConnection();
            $query = "SELECT * FROM beer";
            try {
                foreach($db->query($query) as $row) {
                    $id = $row['beer_id'];
                    $name = $row['beer_name'] ;
                    echo "<option value='${id}'>${name}</option>";
                }
            }
            catch(PDOException $ex) {
                echo "Error!";
            }
            mysqli_close($db);
            ?>
        </select>

        <!-- Partials are injected here based on the selector state -->
        <div id="form-container"></div>

        <div class="panel panel-default">
            <div class="panel-heading">Edit Beer</div>
            <div class="panel-body" id="edit-beer-area"></div>
        </div>
    </div>

    <div class="col-xs-12 col-md-7" style="margin-top: 1.8em;">
        <!-- Results are injected in results-container based on edit results -->
        <div class="panel panel-default">
            <div class="panel-heading">Results</div>
            <div class="panel-body" id="results-container"></div>
        </div>
    </div>

</div>

<script>
    var searchMode = "";
    $("#beer-select").change(function(e){
        e.preventDefault();
        RebuildForm();
    });

    function RebuildForm(){
        searchMode = $("#beer-select").find(":selected").text();
        console.log("Value changed to " + searchMode);
        // Reset form and results
        $("#form-container").html("");
        $("#results-container").parent().hide();
        $("#edit-beer-area").html("");
        $("#edit-beer-area").parent().hide();

        $("#form-container").load("../partials/edit/edit_beer.php");



    }
    RebuildForm();

</script>

</body>
</html>
