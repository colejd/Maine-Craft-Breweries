<div>
    <h2>Add Retailer</h2>
    <p>
        Create a new retailer.
    </p>

    <div class="form-group">
        <label for="retail-name-field">Name</label>
        <input class="form-control" type="text" id="retail-name-field" name="retail-name-field" autocomplete="off" required />
    </div>

    <!-- Retail type ID selector -->
    <div class="form-group">
        <label for="type-selector">Type</label>
        <select class="form-control" id='type-selector' name='type-selector'>
            <?php
            // Populate the dropdown with the name/id combination of each beer type
            require_once '../../php/dbconfig.php';
            $database = new Database();
            $db = $database->dbConnection();
            $query = "SELECT * FROM retail_type";
            try {
                $index = 0;
                foreach($db->query($query) as $row) {
                    $id = $row['retail_type_id'];
                    $name = $row['retail_type_name'];
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

    <!-- Location ID selector -->
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
                submitRetailer();
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
                // Submit the brewery now with the location id returned by the API.
                submitRetailer(data);
            }).fail(function(xhr){
                console.error(xhr);
            });

        }

        function submitRetailer(locationData){
            // If no location is specified, use the value from the selector
            if (locationData == null){
                locationData = $("#location-selector").find(":selected").val();
            }

            var dat = {
                add_type: "retailer",
                retail_name: $("#retail-name-field").val(),
                retail_type_id: $("#type-selector").val(),
                location_id: locationData
            }

            // Submit the new brewery as a POST request to the API
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

        }
    </script>


</div>