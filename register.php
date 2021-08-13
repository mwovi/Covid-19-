<?php

include 'db.php';



if (isset($_POST['submit'])) {
    $FirstName = $_POST['FirstName'];
    $LastName = $_POST['LastName'];
    $Email = $_POST['Email'];
    $Password = md5($_POST['Password']);
    $cPassword = md5($_POST['cPassword']);

    if ($Password === $cPassword) {
        $sql = "SELECT * FROM patients WHERE Email = '$Email'";
        $result = mysqli_query($conn, $sql);
        if (!$result->num_rows > 0) {

            $sql = "INSERT INTO patients (FirstName, LastName, Email, Password)
                VALUES ('$FirstName', '$LastName', '$Email', '$Password')";
            $result = mysqli_query($conn, $sql);
            if ($result) {

                echo "<script>alert('Wow! User Registered')</script>";

                $FirstName = "";
                $LastName = "";
                $Email = "";
                $_POST['Password'] = "";
                $_POST['cPassword'] = "";
            } else {


                echo "<script>alert('Woops! Something went wrong')</script>";
            }
        } else {
            echo "<script>alert('Woops! Email already exists')</script>";
        }
    } else {

        echo "<script>alert('Password Not Matched')</script>";
    }
}

?>

<!DOCTYPE php>
<php lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Covid </title>

        <!-- Custom fonts for this template-->

        <link href="LoginAssets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->

        <link href="LoginAssets/css/sb-admin-2.min.css" rel="stylesheet">


    </head>

    <body class="bg-gradient-primary">



        <div class="container">

            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-5 d-none d-lg-block bg-register-image">
                            <img style="width: 100px; height: 100px;" src="assets/img/logo/logo.png" alt="">
                        </div>
                        <div class="col-lg-7">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                </div>
                                <form action="" method="POST" class="user">
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" class="form-control form-control-user" name="FirstName" id="exampleFirstName" placeholder="First Name" value="<?php echo $FirstName; ?>" required>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="text" class="form-control form-control-user" name="LastName" id="exampleLastName" placeholder="Last Name" value="<?php echo $LastName; ?>" required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="email" class="form-control form-control-user" name="Email" id="exampleInputEmail" placeholder="Email Address" value="<?php echo $Email; ?>" required>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="password" class="form-control form-control-user" name="Password" id="exampleInputPassword" placeholder="Password" value="<?php echo $_POST['Password']; ?>" required>
                                        </div>
                                        <div class="col-sm-6">
                                            <input type="password" class="form-control form-control-user" name="cPassword" id="exampleRepeatPassword" placeholder="Repeat Password" value="<?php echo $_POST['cPassword']; ?>" required>
                                        </div>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-primary btn-user btn-block">
                                        Register Account
                                    </button>
                                    <hr>
                                   <!-- <a href="index.php" class="btn btn-google btn-user btn-block">
                                        <i class="fab fa-google fa-fw"></i> Register with Google
                                    </a>
                                    <a href="index.php" class="btn btn-facebook btn-user btn-block">
                                        <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                    </a>-->
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgot-password.php">Forgot Password?</a>
                                </div>
                                <div class="text-center">
                                    <a class="small" href="login.php">Already have an account? Login!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Bootstrap core JavaScript-->

        <script src="LoginAssets/vendor/jquery/jquery.min.js"></script>


        <script src="LoginAssets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="LoginAssets/vendor/jquery-easing/jquery.easing.min.js"></script>


        <!-- Custom scripts for all pages-->
        <script src="LoginAssets/js/sb-admin-2.min.js"></script>



    </body>

</php>