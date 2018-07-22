<html>
<head>
<style>
table {
font-family: arial, sans-serif;
border-collapse: collapse;
//width: 80%;
margin-left: auto;
margin-right: auto;
table-layout: auto;
}

td, th {
border: 1px solid #dddddd;
text-align: left;
padding: 8px;
}

tr:nth-child(even) {
background-color: #dddddd;
}

textarea {
	border: 2px solid #765942;
	border-radius: 10px;
}

input[type=submit] {
	background-color: #37BADD;
    color: black;
    padding: 14px 20px;
    margin: 8px 0;
    border: 1px solid #765942;
    border-radius: 4px;
    cursor: pointer;

}

input[type=submit]:hover {
    background-color: #06566C;
}
</style>
</head>
<body>
<div style="text-align: center;">
<br><br>
<p><strong>Type in your query in the space provided below</strong></p>
<form method = "GET" action = "query.php">
<textarea name = "queryInput" cols = "75" rows = "10"></textarea>
<br>
<input type = "submit" value = "submit">
</form>

<?php
if(isset($_GET['queryInput'])) {
$query = $_GET['queryInput'];
//echo $query;
}
echo "<br>";
$db_name="CS143";
$db_connection = mysql_connect("localhost", "cs143", "");
if(!$db_connection) {
	echo "<p>Could not connet to db.</p>\n";
	echo mysql_error();
}
mysql_select_db($db_name, $db_connection);


$output = "<table><tr>";
if($result = mysql_query($query, $db_connection)) {
for($i = 0; $i < mysql_num_fields($result); $i++) {

$colName = mysql_field_name($result, $i);
$output .= "<td>$colName</td>";
}
$output .= "</tr><tr>";

	while($row = mysql_fetch_row($result)) {
		for($i = 0; $i < mysql_num_fields($result); $i++){
		$val = $row[$i];
		$output .= "<td>$val</td>";
		}
		//print "$row[0] <br>";
		$output .= "</tr>"; 
	}
} // if closes
$output .= "</table></div></body></html>";
echo $output;
mysql_close($db_connection);
?>
