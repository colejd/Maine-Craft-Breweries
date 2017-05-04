<?php
if(isset($_POST['submit'])){
    echo "hello ";
}

?>

<div>
    <h2>Search by Brewery Name</h2>
    <p>
        Find breweries by name, as well as the beers they serve.
    </p>
    <div class="form-group">
        <label for="search-term-field">Search Term</label>
        <input class="form-control" type="text" id="search-term-field" name="search-term-field" autocomplete="on" required />
    </div>

    <button class="btn btn-primary" id="submit-button">Submit</button>

    <script>

        /**
         * Returns a message to be displayed if any of the fields
         * in the form fail to meet certain conditions.
         */
        function validate(){
            // Validate ZIP field
            var searchFieldValue = $("#search-term-field").val()
            if(searchFieldValue === 0 || !searchFieldValue.trim()) {
                return "Search term field is empty.";
            }

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
                    type: "name",
                    term: $("#search-term-field").val()
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