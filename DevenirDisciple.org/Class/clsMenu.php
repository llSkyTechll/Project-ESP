<?php

class Menu{

  public $name;
  public $menuid;
  public $redirectionPath;
  public $submenu;

  public function getMenu($parentid = 0){
    if (!isset($conn)){
      $conn = OpenCon();
    }

    $SQL = "SELECT menu.menuId, menu.name, menu.redirectionPath FROM menu where parentId = ".$parentid;
    $RSSQL = $conn->query($SQL);

    if ($RSSQL->num_rows > 0){
      $menuarray = array();
      while ($Row = $RSSQL->fetch_assoc()){
        $menu = new Menu();
        $menu->name            = $Row['name'];
        $menu->menuid          = $Row['menuId'];
        $menu->redirectionPath = $Row['redirectionPath'];
        $submenu = new Menu();
        $menu->submenu = $submenu->getMenu($Row['menuId']);
        array_push($menuarray, $menu);
      }
    }

    if ($parentid == 0){
      CloseCon($conn);
    }

    if (isset($menuarray)){
      return $menuarray;
    }
  }
}

?>
