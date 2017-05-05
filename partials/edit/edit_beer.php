<div>
    <h2>Edit Beer</h2>
    <p>
        Edit the beer.
    </p>

    <div class="form-group">
        <label for="beer-name-field">Name</label>
        <input class="form-control" type="text" id="beer-name-field" name="beer-name-field" autocomplete="off" required />
    </div>

    <div class="form-group">
        <label for="type-selector">Beer Type</label>
        <select class="form-control" id='type-selector' name='type-selector'>
            <?php
            // Populate the dropdown with the name/id combination of each beer type
            require_once '../../php/dbconfig.php';
            $database = new Database();
            $db = $database->dbConnection();
            $query = "SELECT * FROM beer_type";
            try {
                $index = 0;
                foreach($db->query($query) as $row) {
                    $id = $row['beer_type_id'];
                    $name = $row['beer_type_name'];
                    $selected = $index == 0 ? "SELECTED" : ""; // Select the first row
                    echo "<option ${selected} value='${id}'>${name}</option>";
                    $index += 1;
                }
            }
            catch(PDOException $ex) {
                echo "Error!";
            }
            mysqli_close($db);
            ?>
        </select>
    </div>

    <div class="form-group">
        <label for="brewery-selector">Brewery</label>
        <select class="form-control" id='brewery-selector' name='brewery-selector'>
            <?php
            // Populate the dropdown with the name/id combination of each beer type
            require_once '../../php/dbconfig.php';
            $database = new Database();
            $db = $database->dbConnection();
            $query = "SELECT * FROM brewery";
            try {
                $index = 0;
                foreach($db->query($query) as $row) {
                    $id = $row['brewery_id'];
                    $name = $row['brewery_name'];
                    $selected = $index == 0 ? "SELECTED" : ""; // Select the first row
                    echo "<option ${selected} value='${id}'>${name}</option>";
                    $index += 1;
                }
            }
            catch(PDOException $ex) {
                echo "Error!";
            }
            mysqli_close($db);
            ?>
        </select>
    </div>

    <div class="form-group">
        <label for="abv-field">ABV</label>
        <input class="form-control" type="text" id="abv-field" name="abv-field" autocomplete="off" required />
    </div>

    <div class="form-group">
        <label for="ibu-field">IBU</label>
        <input class="form-control" type="text" id="ibu-field" name="ibu-field" autocomplete="off" required />
    </div>

    <div class="form-group">
        <label for="description-field">Description</label>
        <textarea class="form-control" rows="3" id="description-field" name="description-field" autocomplete="off" required></textarea>
    </div>

    <button class="btn btn-primary" id="submit-button">Submit</button>
    <button class="btn btn-danger" id="delete-button">Delete</button>


    <script>

        // Populate all fields with the info from the database
        $.ajax({
            url: '../php/api/search.php',
            data: {
                type: "beer_id",
                id: $("#beer-select").find(":selected").val()
            },
            dataType: 'json',
            type: "GET"
        }).done(function(data){
            //console.log(data);

            $("#beer-name-field").val(data["beer_name"]);
            $("#type-selector").val(data["beer_type_id"]);
            $("#brewery-selector").val(data["brewery_id"]);
            $("#abv-field").val(data["ABV"]);
            $("#ibu-field").val(data["IBU"]);
            $("#description-field").val(data["description"]);

        }).fail(function(xhr){
            console.error(xhr);
        });


        $("#submit-button").click(function(){
            console.log("Submitting...");

            // Clear the results field
            $("#results-container").html("");

            var dat = {
                edit_type: "beer",
                beer_id: $("#beer-select").find(":selected").val(),
                beer_name: $("#beer-name-field").val(),
                beer_type_id: $("#type-selector").val(),
                brewery_id: $("#brewery-selector").val(),
                ABV: $("#abv-field").val(),
                IBU: $("#ibu-field").val(),
                description: $("#description-field").val()
            }

            console.log(dat);

            //Make an AJAX request to the API to get a JSON representation of the query response.
            $.ajax({
                url: '../php/api/edit.php',
                data: JSON.stringify(dat),
                dataType: 'json',
                type: "POST"
            }).done(function(data){
                console.log("Done");
                console.log(data);
                $("#results-container").parent().show();
                $("#results-container").html("<pre>" + JSON.stringify(data, null, 2) + "</pre>");
            }).fail(function(xhr){
                console.log("Failure");
                $("#results-container").parent().show();
                $("#results-container").html("<p style='color:red'>" + xhr + "</p>");
            });
        });

        $("#delete-button").click(function(){

            // Confirm
            var conf = confirm("Would you like to delete this beer?");
            if(!conf) return;

            $.ajax({
                url: '../php/api/delete.php',
                data: {
                    type: "beer",
                    id: $("#beer-select").find(":selected").val()
                },
                dataType: 'json',
                type: "GET"
            }).done(function(data){
                console.log("Done");
                // Remove the beer from the document and refresh the form
                $("#beer-select").find(":selected").remove();
                RebuildForm();
                // Show the response from the server
                $("#results-container").parent().show();
                $("#results-container").html("<pre>" + JSON.stringify(data, null, 2) + "</pre>");
            }).fail(function(xhr){
                console.log("Failure");
                $("#results-container").parent().show();
                $("#results-container").html("<p style='color:red'>" + xhr + "</p>");
            });
        })
    </script>


</div>