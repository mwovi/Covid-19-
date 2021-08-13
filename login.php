<?php

include 'db.php';

session_start();

if (isset($_POST['submit'])) {
    $Email = $_POST['Email'];
    $Password = md5($_POST['Password']);

    $sql = "SELECT * FROM patients WHERE Email='$Email' AND Password='$Password' ";
    $result = mysqli_query($conn, $sql);

    if ($result->num_rows > 0) {
        $row = mysqli_fetch_assoc($result);
        $_SESSION['loggedin'] = true;
        $_SESSION['FirstName'] = $row['FirstName'];
        $_SESSION['Email'] = $row['$Email'];

        header("Location: index.php");
    } else {
        echo "<script>alert('Woops! Email or Password is wrong')</script>";
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

        <title>PWD GIGS</title>

        <!-- Custom fonts for this template-->

        <link href="LoginAssets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->

        <link href="LoginAssets/css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body class="bg-gradient-primary">
        

        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-login-image">
                                    <img style="width: 100px; height: 100px;" src="assets/img/logo/logo.png" alt="">
                                </div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                        </div>
                                        <form action="" method="POST" class="user">
                                            <div class="form-group">
                                                <input type="email" class="form-control form-control-user" name="Email" value="<?php echo $Email; ?>" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address..." required>
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control form-control-user" id="exampleInputPassword" value="<?php echo $_POST['Password']; ?>" name="Password" placeholder="Password" required>
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox small">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck">
                                                    <label class="custom-control-label" for="customCheck">Remember
                                                        Me</label>
                                                </div>
                                            </div>
                                            <button class="btn btn-primary btn-user btn-block" type="submit" name="submit">
                                                Login
                                            </button>
                                            <hr>
                                           <!-- <a href="index.php" class="btn btn-google btn-user btn-block">
                                                <i class="fab fa-google fa-fw"></i> Login with Google
                                            </a>
                                            <a href="index.php" class="btn btn-facebook btn-user btn-block">
                                                <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                            </a>-->
                                        </form>
                                        <hr>
                                        <div class="text-center">
                                            <a class="small" href="forgot-password.php">Forgot Password?</a>
                                        </div>
                                        <div class="text-center">
                                            <a class="small" href="register.php">Create an Account!</a>
                                        </div>
                                    </div>
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