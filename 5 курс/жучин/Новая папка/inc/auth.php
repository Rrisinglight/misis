<?
	session_start();		
	function user_exist($password)
	{
		include($_SERVER['DOCUMENT_ROOT'].'/inc/sql_config.php');		
		$sql = mysql_query("SELECT * FROM users WHERE password='$password'", $mysql_cont);
		$len = mysql_num_rows($sql);
		return ($len == 1);
	}
	
	if ((isset($_GET['action'])) && ($_GET['action'] == 'logout'))
	{
		unset($_SESSION['password']);
		setCookie('password', 'none');
		$_COOKIE['password'] = 'none';
	}
	
	// �������� ���������� ������
	if (isset($_POST['password']))
	{
		$name = $_POST['name'];
		$password = $_POST['password'];
		$password = md5($name.$password);
		
		if (user_exist($password))
		{        
			$_SESSION['password'] = $password;
			if (isset($_POST['remember'])) setCookie('password', $password, time() + 3000000); // �� �����
			header('Refresh: 2; URL='.$_SERVER['REQUEST_URI']);
			die('������ ������.');
		}
		else 
		{			
			header('Refresh: 2; URL='.$_SERVER['REQUEST_URI']);
			die('�������� ������.');
		}
	}
	
	// ���� ������������ �� �����������
	if ((!isset($_SESSION['password']))or (!user_exist($_SESSION['password'])) )
	{
		// ��������� ����
		if ((!isset($_COOKIE['password']))or(!user_exist($_COOKIE['password'])) )
		{	
			// ������ ������ - ������� ����� �����������
			include($_SERVER['DOCUMENT_ROOT']."/inc/login_form.php");
		
			die(); // ��������� ������
		}			
	}
	
	if ((isset($_COOKIE['password']))&&(!isset($_SESSION['password']))) $_SESSION['password'] = $_COOKIE['password'];
	
	include($_SERVER['DOCUMENT_ROOT'].'/inc/sql_config.php');
	$sql = mysql_query("SELECT * FROM users WHERE password='".$_SESSION['password']."'", $mysql_cont);
	$len = mysql_num_rows($sql);
	
	if ($len == 1) 
	{
		$row = mysql_fetch_assoc($sql);
		$_SESSION['user'] = $row['name'];
	}
	
?>