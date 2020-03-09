<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Menu</title>

  <script>
    function Redirect(Path) {
      document.getElementById('PageContent').src = Path;
    }

  </script>
</head>

<body>
  <form>
    <input type="button" value="Test" onclick="Redirect('Content2.php')">
    <iframe id="PageContent" name="PageContent" src="Content.php" style="width:100%;height:90%"></iframe>
  </form>
</body>

</html>
