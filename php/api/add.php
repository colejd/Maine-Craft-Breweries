<?php

require_once '../dbconfig.php';
$database = new Database();
$db = $database->dbConnection();

// Read JSON input from POST request
$_POST = json_decode(file_get_contents('php://input'), true);

$addType = trim($_POST['add_type']);

if($addType == "beer"){

    $beer_name = trim($_POST['beer_name']);
    $beer_type_id = trim($_POST['beer_type_id']);
    $brewery_id = trim($_POST['brewery_id']);
    $abv = trim($_POST['ABV']);
    $ibu = trim($_POST['IBU']);
    $description = trim($_POST['description']);

    $query = "INSERT INTO `beer` (`beer_id`, `beer_name`, `beer_type_id`, `brewery_id`, `ABV`, `IBU`, `description`, `active`) 
                          VALUES (NULL, :beer_name, :beer_type_id, :brewery_id, :abv, :ibu, :description, '1');";

    try {
        $stmt = $db->prepare($query);
        $stmt->execute([
            ":beer_name" => $beer_name,
            ":beer_type_id" => $beer_type_id,
            ":brewery_id" => $brewery_id,
            ":abv" => $abv,
            ":ibu" => $ibu,
            ":description" => $description
        ]);

        $new_id = $db->lastInsertId();
        echo json_encode("New beer created with ID: $new_id");
    }
    catch(PDOException $ex) {
        echo json_encode("Error: " . $ex->getMessage());
    }
}

else if($addType == "retailer"){
    $retail_name = trim($_POST['retail_name']);
    $retail_type_id = trim($_POST['retail_type_id']);
    $location_id = trim($_POST['location_id']);

    $query = "INSERT INTO `retail_outlet` 
                (`retail_id`, `retail_name`, `retail_type_id`, `location_id`) 
              VALUES 
                (NULL, :retail_name, :retail_type_id, :location_id);";

    try {
        $stmt = $db->prepare($query);
        $stmt->execute([
            ":retail_name" => $retail_name,
            ":retail_type_id" => $retail_type_id,
            ":location_id" => $location_id,
        ]);

        $new_id = $db->lastInsertId();
        echo json_encode("New retailer created with ID: $new_id");
    }
    catch(PDOException $ex) {
        echo json_encode("Error: " . $ex->getMessage());
    }

}

else if($addType == "brewery"){
    $brewery_name = trim($_POST['brewery_name']);
    $owner = trim($_POST['owner']);
    $telephone_num = trim($_POST['telephone_num']);
    $location_id = trim($_POST['location_id']);
    $website = trim($_POST['website']);

    $query = "INSERT INTO `brewery` 
                (`brewery_id`, `brewery_name`, `owner`, `telephone_num`, `location_id`, `website`) 
              VALUES 
                (NULL, :brewery_name, :owner_name, :telephone_num, :location_id, :website);";

    try {
        $stmt = $db->prepare($query);
        $stmt->execute([
            ":brewery_name" => $brewery_name,
            ":owner_name" => $owner,
            ":telephone_num" => $telephone_num,
            ":location_id" => $location_id,
            ":website" => $website
        ]);

        $new_id = $db->lastInsertId();
        echo json_encode("New brewery created with ID: $new_id");
    }
    catch(PDOException $ex) {
        echo json_encode("Error: " . $ex->getMessage());
    }

}

else if($addType == "location"){

    $street_address = trim($_POST['street_address']);
    $city = trim($_POST['city']);
    $zipcode = trim($_POST['zipcode']);
    $state = trim($_POST['state']);

    $query = "INSERT INTO `location` (`location_id`, `street_address`, `city`, `zipcode`, `state`) 
                            VALUES (NULL, :street_address, :city, :zipcode, :state);";

    try {
        $stmt = $db->prepare($query);
        $stmt->execute([
            ":street_address" => $street_address,
            ":city" => $city,
            ":zipcode" => $zipcode,
            ":state" => $state
        ]);

        // Echo the ID of the inserted row
        echo json_encode($db->lastInsertId());
    }
    catch(PDOException $ex) {
        echo json_encode("Error: " . $ex->getMessage());
    }

}

mysqli_close($db);