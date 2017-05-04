<div>
    <h2>Search Breweries by Beer Type</h2>
    <p>
        Find the breweries that serve the selected type of beer.
    </p>
    <div class="form-group">
        <label for="type-selector">Search Term</label>
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

    <button class="btn btn-primary" id="submit-button">Submit</button>


    <script>
        $("#submit-button").click(function(){
            // Clear the results field
            $("#results-container").html("");

            //Make an AJAX request to the API to get a JSON representation of the query response.
            $.ajax({
                url: '../php/api/search.php',
                data: {
                    type: "type",
                    id: $("#type-selector").find(":selected").val()
                },
                dataType: 'json',
                type: "GET"
            }).done(function(data){
                $("#results-container").parent().show();
                $("#results-container").html("<pre>" + JSON.stringify(data, null, 2) + "</pre>");
            }).fail(function(xhr){
                console.error(xhr);
            });
        });
    </script>


</div>