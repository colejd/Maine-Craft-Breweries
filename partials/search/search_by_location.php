<div>
    <h2>Search by Brewery Location</h2>
    <p>
        Find the names and addresses of breweries within a distance
        from the given zip code.
    </p>
    <div class="form-group">
        <label for="zip-code-field">Zip Code</label>
        <input class="form-control" type="text" id="zip-code-field" name="zip-code-field" autocomplete="on" />
    </div>
    <div class="form-group">
        <label for="distance-field">Distance (miles)</label>
        <input class="form-control" type="number" id="distance-field" name="distance-field" autocomplete="on" />
    </div>

    <button class="btn btn-primary" id="submit-button">Submit</button>

    <script>

        /**
         * Returns a message to be displayed if any of the fields
         * in the form fail to meet certain conditions.
         */
        function validate(){
            // Validate ZIP field
            var zipFieldValue = $("#zip-code-field").val()
            if(zipFieldValue === 0 || !zipFieldValue.trim()) {
                return "ZIP field is empty.";
            }
            if(isNaN(zipFieldValue)) return "ZIP must contain only numbers.";
            if(zipFieldValue.length != 5) return "ZIP code must be 5 characters.";

            // Validate distance field
            var distFieldValue = $("#distance-field").val();
            if(distFieldValue === 0 || !distFieldValue.trim()) {
                return "Distance field is empty.";
            }
            if(isNaN(distFieldValue)) return "Distance must be a number.";
            var dist = parseFloat(distFieldValue);
            if(dist < 0) return "Distance must be positive.";

        }

        $("#submit-button").click(function(){

            // Clear the results field
            $("#results-container").parent().hide();
            $("#results-container").html("");

            var validation = validate();
            if(typeof validation === 'string' || validation instanceof String) {
                // If validation failed, show the error in the results section
                $("#results-container").parent().show();
                $("#results-container").html("<p style='color:red'>" + validation + "</p>");
                return;
            }

            //Make an AJAX request to the API to get a JSON representation of the query response.
            $.ajax({
                url: '../php/api/search.php',
                data: {
                    type: "location",
                    zip: parseInt($("#zip-code-field").val()),
                    dist: $("#distance-field").val()
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