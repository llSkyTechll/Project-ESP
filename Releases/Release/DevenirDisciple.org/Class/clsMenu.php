<?php

class Menu{

  public $name;
  public $menuid;
  public $redirectionPath;
  public $submenu;

  
  function get_name(){
    return $this->name;
  }

  function get_menuid(){
    return $this->menuid;
  }

  function get_redirectionPath(){
    return $this->redirectionPath;
  }

  function get_submenu(){
    return $this->submenu;
  }

  public function getMenu($parentid = 0){
    if (!isset($conn)){
      $conn = OpenCon();
    }

    $SQL = "CALL GetMenus(".$parentid.");";
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
