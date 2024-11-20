<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />

    <style type="text/css">
        /* Import Google font - Poppins */
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        /* Body with background image */
        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            background-image: url('images/p1.jpg'); /* Add your image path here */
            background-size: cover;
            background-position: center;
            position: relative;
        }

        /* Background overlay for blur and opacity */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.4); /* Overlay with lower opacity */
            backdrop-filter: blur(5px); /* Apply blur effect */
            z-index: -1;
        }

        .container {
            position: relative;
            max-width: 700px;
            width: 100%;
            background: rgba(255, 255, 255, 0.9); /* Slight opacity for the form */
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            z-index: 1; /* Ensure form stays on top */
        }

        .container header {
            font-size: 1.5rem;
            color: #333;
            font-weight: 500;
            text-align: center;
        }

        .container .form {
            margin-top: 30px;
        }

        .form .input-box {
            width: 100%;
            margin-top: 20px;
        }

        .input-box label {
            color: #333;
        }

        .form :where(.input-box input) {
            position: relative;
            height: 50px;
            width: 100%;
            outline: none;
            font-size: 1rem;
            color: #707070;
            margin-top: 8px;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 0 15px;
        }

        .input-box input:focus {
            box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
        }

        .form button {
            height: 55px;
            width: 100%;
            color: #fff;
            font-size: 1rem;
            font-weight: 400;
            margin-top: 30px;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
            background: rgb(130, 106, 251);
        }

        .form button:hover {
            background: rgb(88, 56, 250);
        }

        /* Responsive */
        @media screen and (max-width: 500px) {
            .form .input-box {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <section class="container">
        <header>Login</header>
        <form action="loginServlet" method="post" class="form">

            <!-- Username Input -->
            <div class="input-box">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter username" required />
            </div>

            <!-- Password Input -->
            <div class="input-box">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter password" required />
            </div>

            <!-- Submit Button -->
            <button type="submit">Login</button>

        </form>
    </section>
</body>
</html>
