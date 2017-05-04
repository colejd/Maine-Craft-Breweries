<div>
    <h2>Add Beer</h2>
    <p>
        Create a new beer.
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


    <script>
        $("#submit-button").click(function(){
            // Clear the results field
            $("#results-container").html("");

            console.log($("#description-field").val());

            var dat = {
                add_type: "beer",
                beer_name: $("#beer-name-field").val(),
                beer_type_id: $("#type-selector").val(),
                brewery_id: $("#brewery-selector").val(),
                ABV: parseFloat($("#abv-field").val()),
                IBU: parseFloat($("#ibu-field").val()),
                description: $("#description-field").val()
            }

            //Make an AJAX request to the API to get a JSON representation of the query response.
            $.ajax({
                url: '../php/api/add.php',
                data: JSON.stringify(dat),
                dataType: 'json',
                type: "POST"
            }).done(function(data){
                $("#results-container").parent().show();
                $("#results-container").html("<pre>" + JSON.stringify(data, null, 2) + "</pre>");
            }).fail(function(xhr){
                console.error(xhr);
            });
        });
    </script>


</div>