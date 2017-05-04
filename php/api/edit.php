<?php

require_once '../dbconfig.php';
$database = new Database();
$db = $database->dbConnection();

// Read JSON input from POST request
$_POST = json_decode(file_get_contents('php://input'), true);

$editType = trim($_POST['edit_type']);


if($editType == "beer"){
    $beer_id = trim($_POST['beer_id']);
    $beer_name = trim($_POST['beer_name']);
    $beer_type_id = trim($_POST['beer_type_id']);
    $brewery_id = trim($_POST['brewery_id']);
    $abv = trim($_POST['ABV']);
    $ibu = trim($_POST['IBU']);
    $description = trim($_POST['description']);

    $query = "UPDATE beer 
              SET 
                beer_name = :beer_name, 
                beer_type_id = :beer_type_id,
                brewery_id = :brewery_id, 
                abv = :abv, 
                ibu = :ibu,
                description = :description
              WHERE 
                beer_id = :beer_id
              ;";

    try {
        $stmt = $db->prepare($query);
        $stmt->execute([
            ":beer_name" => $beer_name,
            ":beer_type_id" => $beer_type_id,
            ":brewery_id" => $brewery_id,
            ":abv" => $abv,
            ":ibu" => $ibu,
            ":description" => $description,
            ":beer_id" => $beer_id
        ]);
        echo json_encode("Success");
    }
    catch(PDOException $ex) {
        echo json_encode("Error: " . $ex->getMessage());
    }
}

else {
    echo "Invalid type.";
}

mysqli_close($db);