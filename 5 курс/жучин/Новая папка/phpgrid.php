<?php
// ����������� � ����� ��
$mysql_host = "localhost";
$mysql_dbname = "mpexp_mpexp";
$mysql_login = "mpexp_mpexp";
$mysql_psswd = "R38rh4Co";
  
$db = mysql_connect($mysql_host, $mysql_login, $mysql_psswd);
mysql_select_db($mysql_dbname);

# ��������!!!
# ������ ��� �� ����� �������� ������������� ������
# ��� ����� ����� �������� ������! ����������� ���������� ��� ������
# ����������� �� �������

$page = $_GET['page'];      // ����� ������������� ��������
$limit = $_GET['rows'];     // ���������� ������������� �������
$sidx = $_GET['sidx'];      // ����� �������� ������� �� ������ ������� ����������� ����������
                            // ����� ������ ����, �� �������� ������� ����������� ����������
$sord = $_GET['sord'];      // ����������� ����������

// ���� �� ������� ���� ����������, �� ����������� ���������� �� ������� ����
if(!$sidx) $sidx =1;
//$sidx =1;
// �������� ������, ������� ������ ��������� ���-�� ������� � �������
$result = mysql_query("SELECT COUNT(*) AS count FROM history");
$row = mysql_fetch_array($result,MYSQL_ASSOC);
$count = $row['count'];     // ������ ��� ���������� ������ ���-�� ������� � �������

// ���������� ������� ����� ������� ������ ������ � ��
if( $count > 0 && $limit > 0) {
    $total_pages = ceil($count/$limit);
} else {
    $total_pages = 0;
}
// ���� �� �����-�� �������� ������ ��������
if ($page > $total_pages) $page=$total_pages;

// ������������ ��������� �������� ��� LIMIT �������
$start = $limit*$page - $limit;
// ������ �� �������������� ��������
if($start <0) $start = 0;

// ������ ������� ������
$query = "SELECT * FROM history ORDER BY ".$sidx." ".$sord." LIMIT ".$start.", ".$limit;
//echo $query;
$result = mysql_query($query);


// ������ xml ��������
$s = "<?xml version='1.0' encoding='utf-8'?>";
$s .=  "<rows>";
$s .= "<page>".$page."</page>";
$s .= "<total>".$total_pages."</total>";
$s .= "<records>".$count."</records>";

// ������ ������ ��� �������
// �� �������� �������� ��������� ������ � <![CDATA[]]>
while($row = mysql_fetch_assoc($result)) {
	
	$s .= "<row id='". $row['id']."'>";	   
	$s .= "<cell>". $row[id]."</cell>";  
    $s .= "<cell>". $row[user_id]."</cell>";  
	$s .= "<cell>". $row[production_name]."</cell>";  	
    $s .= "</row>";
}
$s .= "</rows>";

// ����� ������� �� ��������� ��������� header
// � ����� �������� � ����������
header("Content-type: text/xml;charset=utf-8");
echo $s;
?>