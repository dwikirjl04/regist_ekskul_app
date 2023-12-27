<?php
require_once "method.php";
$id = new regist_ekskul();
$request_method=$_SERVER["REQUEST_METHOD"];
switch ($request_method) {
	case 'GET':
			if(!empty($_GET["id"]))
			{
				$id=intval($_GET["id"]);
				$id->get_regist_ekskul($id);
			}
			else
			{
				$id->get_regist_ekskul();
			}
			break;
	case 'POST':
			if(!empty($_GET["id"]))
			{
				$id=intval($_GET["id"]);
				$id->update_regist_ekskul($id);
			}
			else
			{
				$id->insert_regist();
			}		
			break; 
	case 'DELETE':
		    $id=intval($_GET["id"]);
            $ekskul->delete_regist($id);
            break;
	default:
		// Invalid Request Method
			header("HTTP/1.0 405 Method Not Allowed");
			break;
		break;
}




?>