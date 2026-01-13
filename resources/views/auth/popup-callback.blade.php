<!DOCTYPE html>
<html>
<head>
    <title>Authentication Complete</title>
</head>
<body>
    <script>
        window.opener.postMessage('login_success', window.location.origin);
        window.close();
    </script>
</body>
</html>
