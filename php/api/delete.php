<?php

require_once '../dbconfig.php';
$database = new Database();
$db = $database->dbConnection();

$deleteType = trim($_GET['type']);

if ($deleteType == "beer"){
    $id = trim($_GET['id']);

    $query = "DELETE FROM `beer` WHERE `beer`.`beer_id` = :id";

    try {
        $stmt = $db->prepare($query);
        $stmt->execute([
            ":id" => $id
        ]);

        echo json_encode("Beer $id deleted.");
    } catch(PDOException $ex) {
        echo json_encode("Error: " . $ex->getMessage());
    }
}

else {
    echo json_encode("No delete routine exists for type: $deleteType");
}

mysqli_close($db);