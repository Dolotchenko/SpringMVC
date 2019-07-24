


<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css"  href="css/login.css"/>
</head>

<body>

<div class="wrapper fadeInDown">
    <div id="formContent">

        <form action="/j_spring_security_check" method="post">
            <h2 class="form-signin-heading">Please sign in</h2>
            <input type="text" class="fadeIn second" name="j_username" placeholder="login" >
            <input type="text" class="fadeIn third" name="j_password" placeholder="password" >

            <input type="submit" class="fadeIn fourth" value="Log In">
        </form>

    </div>
</div>
</body>
</html>