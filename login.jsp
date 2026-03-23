<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            height: 100vh;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 100%;
            max-width: 400px;
        }

        .login-card {
            background: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            text-align: center;
            animation: fadeIn 0.8s ease;
        }

        .login-card h2 {
            margin-bottom: 5px;
            color: #333;
        }

        .subtitle {
            margin-bottom: 20px;
            color: #777;
            font-size: 14px;
        }

        .input-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .input-group label {
            font-size: 13px;
            color: #555;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 6px;
            outline: none;
            transition: 0.3s;
        }

        .input-group input:focus {
            border-color: #4facfe;
            box-shadow: 0 0 5px rgba(79,172,254,0.5);
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            background: #4facfe;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover {
            background: #00c6ff;
        }

        .error {
            background: #ff4d4d;
            color: white;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 5px;
            font-size: 13px;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>

</head>

<body>

<div class="container">

    <div class="login-card">

        <h2>Inventory System</h2>
        <p class="subtitle">Admin Login</p>

        <!-- Error Message -->
        <% if(request.getParameter("error") != null){ %>
            <div class="error">Invalid Username or Password</div>
        <% } %>

        <form action="login" method="post">

            <div class="input-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter username" required>
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
            </div>

            <button type="submit">Login</button>

        </form>

    </div>

</div>

</body>
</html>