<nav class="navbar navbar-default">

    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.php">Maine Craft Breweries</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="search.php">Search</a></li>
                <?php
                if (isset($_SESSION['isAdmin'])) {
                    echo "<li><a href='add.php'>Add</a></li>";
                    echo "<li><a href='edit.php'>Edit</a></li>";
                }
                ?>

                <!-- Add login / logout button -->
                <?php
                echo "<li role='separator' class='divider'></li>";
                if (isset($_SESSION['userSession'])) {
                    echo "<li><a href='logout.php'>Log Out</a></li>";
                } else {
                    echo "<li><a href='login.php'>Log In</a></li>";
                }
                ?>

            </ul>

        </div>

    </div>

</nav>