<?php
session_start();

if (isset($_SESSION["username"])) {
    header("Location: dashboard.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <?php include "templates/header.php"; ?>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Login - Barangay Poblacion Profiling System</title>

    <style>
        label.placeholder {
            background: transparent;
            cursor: auto;
            
            
            
        }

        
    </style>
</head>

<body class="login bg-dark">
    <?php include "templates/loading_screen.php"; ?>
    <div class="wrapper wrapper-login">
        
        <div class="container-login animated fadeIn  b-5  shadow-lg p-4 rounded">
            
            <h2><img src="assets/img/Logo.png" style="width: 20%; font-size:10%;" class=" m-3 my-2" alt="logo">BPP System</h2>
        <?php include "templates/alert.php"; ?>
            <div class="login-form">
                <form method="POST" action="model/login.php" autocomplete="off">
                    <div class="form-group form-floating-label">
                        <input id="username" name="username" type="text" class="form-control input-border-bottom" required>
                        <label for="username" class="placeholder"><h3 class="fa fa-fw fa-user ">Username</h3></label>
                    </div>
                    <div class="form-group form-floating-label">
                        <input id="password" name="password" type="password" class="form-control input-border-bottom" required>
                        <label for="password" class="placeholder"><h3 class="fa fa-fw fa-key">Password</h3></label>
                        <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                    </div>
                    <div class="form-action mb-3 d-flex flex-column gap-2">
                        <button type="submit" class="btn btn-primary btn-block fw-bold ">Login</button>
                        <!-- <a href="resident-register.php" class="btn btn-info btn-block  fw-bold">Create New Account</a> -->
                    </div>
                </form>
            </div>
        </div>
    </div>
    <?php include "templates/footer.php"; ?>
</body>

</html>
