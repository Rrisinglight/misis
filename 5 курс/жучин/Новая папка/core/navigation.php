<?
	class Navigation
	{
		private $_user;
		
		public function __construct($user)
		{
			$this->_user = $user;
		}
		
		public function show()
		{
			$user = $this->_user;
			echo '<div style="float: right">';		
				if ($user->checkPermission('admin_panel'))
				{
					echo '<a href="/report.php">������</a> &nbsp;&nbsp;&nbsp;';
				}
				
				if ($user->checkPermission('admin_panel'))
				{
					echo '<a href="/clients.php">�������</a> &nbsp;&nbsp;&nbsp;';
				}
				/*
				if ($user->checkPermission('admin_panel'))
				{
					echo '<a href="/firms.php">�����������</a> &nbsp;&nbsp;&nbsp;';
				}	
				*/
				if ($user->checkPermission('admin_panel'))
				{
					echo '<a href="/templates.php">�������</a> &nbsp;&nbsp;&nbsp;';
				}	
				
				if ($user->checkPermission('admin_panel'))
				{
					echo '<a href="/admin/users.php">������������</a> &nbsp;&nbsp;&nbsp;';
				}				
				
				echo '<a href="/">�� �������</a>';
			echo '</div>';
		}
	}
?>