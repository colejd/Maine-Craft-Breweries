<?php

require_once '../dbconfig.php';
$database = new Database();
$db = $database->dbConnection();

$searchType = trim($_GET['type']);

// Render JSON based on the query type and parameters.
if ($searchType == "name"){
    // Generates a row for each brewery's beer containing
    // the brewery name and the beer name.
    $query = "SELECT * FROM brewery
                  INNER JOIN beer ON (brewery.brewery_id=beer.brewery_id)
                  WHERE brewery_name LIKE :term";


    try {
        $term = trim($_GET['term']);

        $stmt = $db->prepare($query);
        $stmt->execute([
            ":term" => "%${term}%"
        ]);

        // Build a dict of breweries (key) and an array of their beers (value)
        $dict = array();
        foreach($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
            $brewery_name = $row['brewery_name'];
            $beer_name = $row['beer_name'];
            // Make a new dict for the brewery if it doesn't exist
            if($dict[$brewery_name] == null){
                $dict[$brewery_name] = array();
            }
            // Add the beer to the dict for the brewery
            array_push($dict[$brewery_name], $beer_name);

        }

        // Build final array with labels
        // {
        //      { "brewery": "name", "beers": [ "beer 1", ... ] },
        //      ...
        // }
        $data = array();
        foreach($dict as $key=>$value){
            $row = array("brewery" => $key, "beers" => $value);
            array_push($data, $row);
        }

        // Encode built array as JSON
        echo json_encode($data);

    } catch(PDOException $ex) {
        echo "Error: " . $ex->getMessage();
    }
}

else if ($searchType == "type") {
    // Get the Breweries that serve the beer with the given ID.
    $query = "SELECT * FROM beer
                  INNER JOIN beer_type ON (beer.beer_type_id = beer_type.beer_type_id)
                  INNER JOIN brewery ON (beer.brewery_id = brewery.brewery_id)
                  WHERE beer.beer_type_id = :id
                  ";

    try {

        $stmt = $db->prepare($query);
        $stmt->execute([
            ":id" => trim($_GET['id'])
        ]);

        $dict = array();
        foreach($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
            $dict[] = $row['brewery_name'];
        }

        // Encode built array as JSON
        echo json_encode($dict);

    } catch(PDOException $ex) {
        echo "Error: " . $ex->getMessage();
    }
}

else if ($searchType == "location") {
    $zip = trim($_GET['zip']);
    $dist = trim($_GET['dist']);

    $term_kilometers = 6371; // Use this to measure in kilometers
    $term_miles = 3956; // Use this to measure in miles
    $haversine = "
        DROP FUNCTION IF EXISTS `MCB`.`inrange`;
        CREATE FUNCTION `MCB`.`inrange` (
            lat1 decimal(11, 7), 
            long1 decimal(11, 7),
            lat2 decimal(11, 7),
            long2 decimal(11, 7),
            rng decimal(18, 10))
        RETURNS int(10) DETERMINISTIC
        BEGIN
            DECLARE distance decimal(18, 10);
        
            SET lat1 = lat1 * PI() / 180.0,
               long1 = long1 * PI() / 180.0,
               lat2 = lat2 * PI() / 180.0,
               long2 = long2 * PI() / 180.0;
        
            SET distance = ACOS(SIN(lat1)*SIN(lat2)+COS(lat1)*COS(lat2)*COS(long2-long1))*$term_miles;
        
            IF distance <= rng THEN 
                RETURN 1;
            END IF;
        
            RETURN 0;
        END";
    try {
        // Register the haversine function
        $db->exec($haversine);

        // Find all the ZIP codes within the distance from the given ZIP
        $query = "SELECT dest.ZIP
            FROM ZIP seek, ZIP dest
            WHERE seek.ZIP = :zip
            AND inrange(seek.latitude, seek.longitude, 
            dest.latitude, dest.longitude, :dist)=1
            ";

        $stmt = $db->prepare($query);
        $stmt->execute([
            ":zip" => trim($_GET['zip']),
            ":dist" => trim($_GET['dist'])
        ]);

        $dict = array();
        foreach($stmt->fetchAll(PDO::FETCH_ASSOC) as $row) {
            $dict[] = $row["ZIP"];
        }

        // Get all brewery / address pairs for each zip
        $pairs = array();
        foreach($dict as $zip){
            $breweryQuery = "SELECT *
                FROM brewery
                INNER JOIN location ON (brewery.location_id = location.location_id)
                WHERE location.zipcode = :zip
            ;";

            $stmt_b = $db->prepare($breweryQuery);
            $stmt_b->execute([
                ":zip" => $zip
            ]);

            foreach($stmt_b->fetchAll(PDO::FETCH_ASSOC) as $row) {

                $pairs[] = array(
                        "name" => $row["brewery_name"],
                        "address" => array($row["street_address"], $row["city"], $row["state"], $row["zipcode"])
                    );
            }

        }


        echo json_encode($pairs);

    } catch(PDOException $ex) {
        echo "Error: " . $ex->getMessage();
    }
}

else if ($searchType == "beer_id"){

    $query = "SELECT * FROM beer WHERE beer_id = :beer_id;";

    try {
        $stmt = $db->prepare($query);
        $stmt->execute([
            ":beer_id" => trim($_GET['id'])
        ]);
        echo json_encode($stmt->fetch(PDO::FETCH_ASSOC));
    }
    catch(PDOException $ex) {
        echo json_encode("Error: " . $ex->getMessage());
    }

}

else {
    echo "Invalid type.";
}

mysqli_close($db);