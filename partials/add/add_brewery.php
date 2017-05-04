<div>
    <h2>Add Brewery</h2>
    <p>
        Create a new brewery.
    </p>

    <div class="form-group">
        <label for="brewery-name-field">Name</label>
        <input class="form-control" type="text" id="brewery-name-field" name="brewery-name-field" autocomplete="off" required />
    </div>

    <div class="form-group">
        <label for="owner-name-field">Owner Name</label>
        <input class="form-control" type="text" id="owner-name-field" name="owner-name-field" autocomplete="off" required />
    </div>

    <div class="form-group">
        <label for="phone-field">Phone Number</label>
        <input class="form-control" type="tel" id="phone-field" name="phone-field" autocomplete="off" required />
    </div>



    <div class="form-group">
        <label for="location-selector">Location</label>
        <select class="form-control" id='location-selector' name='location-selector'>
            <option value='-1'>Make New</option>
            <?php
            // Populate the dropdown with the name/id combination of each beer type
            require_once '../../php/dbconfig.php';
            $database = new Database();
            $db = $database->dbConnection();
            $query = "SELECT * FROM location";
            try {
                foreach($db->query($query) as $row) {
                    $id = $row['location_id'];
                    $name = "${row['street_address']} - ${row['city']}, ${row['state']}" ;
                    echo "<option value='${id}'>${name}</option>";
                }
            }
            catch(PDOException $ex) {
                echo "Error!";
            }
            mysqli_close($db);
            ?>
        </select>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">New Location</div>
        <div class="panel-body" id="new-location-form-container"></div>
    </div>

    <button class="btn btn-primary" id="submit-button">Submit</button>


    <script>

        $("#location-selector").change(function(e){
            e.preventDefault();
            RebuildLocationForm();
        });

        function RebuildLocationForm(){
            var mode = $("#location-selector").find(":selected").text();
            console.log("Value changed to " + mode);
            // Reset location form
            $("#new-location-form-container").html("");
            $("#new-location-form-container").parent().hide();

            // Load in form logic for chosen option
            if(mode == "Make New"){
                $("#new-location-form-container").load("../partials/add/add_location.php");
                $("#new-location-form-container").parent().show();
            }



        }
        RebuildLocationForm();


        $("#submit-button").click(function(){
            // Clear the results field
            $("#results-container").html("");

            submitLocation();
        });

        /**
         * Submit the location if we're making a new one
         */
        function submitLocation(){
            if ($("#location-selector").find(":selected").text() != "Make New"){
                submitBrewery();
                return;
            }

            var dat = {
                add_type: "location",
                street_address: $("#street-address-field").val(),
                city: $("#city-field").val(),
                zipcode: parseInt($("#zip-field").val()),
                state: $("#state-field").val()
            }

            // Submit the new location as a POST request to the API
            $.ajax({
                url: '../php/api/add.php',
                data: JSON.stringify(dat),
                dataType: 'json',
                type: "POST"
            }).done(function(data){
                console.log("New location created successfully.")
                // Submit the brewery now with the location id returned by the API.
                submitBrewery(data);
            }).fail(function(xhr){
                console.error(xhr);
            });

        }

        function submitBrewery(locationData){
            // If no location is specified, use the value from the selector
            if (locationData == null){
                locationData = $("#location-selector").find(":selected").val();
            }

            var dat = {
                add_type: "brewery",
                brewery_name: $("#brewery-name-field").val(),
                owner: $("#owner-name-field").val(),
                telephone_num: $("#phone-field").val(),
                location_id: locationData,
                website: $("#website-field").val()
            }

            // Submit the new brewery as a POST request to the API
            $.ajax({
                url: '../php/api/add.php',
                data: JSON.stringify(dat),
                dataType: 'json',
                type: "POST"
            }).done(function(data){
                console.log("New brewery created successfully.");
                $("#results-container").parent().show();
                $("#results-container").html("<pre>" + JSON.stringify(data, null, 2) + "</pre>");
            }).fail(function(xhr){
                console.error(xhr);
            });

        }
    </script>


</div>