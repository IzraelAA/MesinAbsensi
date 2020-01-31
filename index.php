<html>

<head>
    <script src="jquery-latest.js"></script>
    <script>
    var refreshId = setInterval(function() {
        $('#responsecontainer').load('menampilkan.php');
    }, 1000);
    </script>
</head>

<body>
    <?php 
$sp = null;
?>
    <div id="responsecontainer">
    </div>
</body>

</html>