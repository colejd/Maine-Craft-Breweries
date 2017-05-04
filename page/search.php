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
    <title>Search | Maine Craft Breweries</title>
</head>


<body>

<!-- Import navbar -->
<?php require_once "../partials/navbar.php"; ?>

<!-- Main area -->
<div class="container-fluid">
    <div class="col-xs-12 col-md-5">
        <!-- Search Type selector -->
        <label for="search-type-select">Search Type:</label>
        <select class="form-control" id="search-type-select" name="search-type-select">
            <option selected>Brewery Name</option>
            <option>Brewery Location</option>
            <option>Beer Type</option>
        </select>

        <!-- Partials are injected here based on the selector state -->
        <div id="form-container"></div>

    </div>
    <div class="col-xs-12 col-md-7" style="margin-top: 1.8em;">
        <!-- Results are injected in results-container based on search results -->
        <div class="panel panel-default">
            <div class="panel-heading">Results</div>
            <div class="panel-body" id="results-container"></div>
        </div>
    </div>

</div>

<script>
    var searchMode = "";
    $("#search-type-select").change(function(e){
        e.preventDefault();
        RebuildForm();
    });

    function RebuildForm(){
        searchMode = $("#search-type-select").find(":selected").text();
        console.log("Value changed to " + searchMode);
        // Reset form and results
        $("#form-container").html("");
        $("#results-container").html("");
        $("#results-container").parent().hide();

        // Load in form logic for chosen option
        if(searchMode == "Brewery Name"){
            $("#form-container").load("../partials/search/search_by_name.php");
        }
        else if (searchMode == "Brewery Location") {
            $("#form-container").load("../partials/search/search_by_location.php");
        }
        else if (searchMode == "Beer Type") {
            $("#form-container").load("../partials/search/search_by_type.php");
        }



    }
    RebuildForm();

</script>

</body>
</html>