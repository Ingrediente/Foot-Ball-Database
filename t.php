<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Simple Little Table in HTML/CSS3</title>

<style type="text/css">
body{
		background-image:url("images/xyz.jpg");
		background-size: 1500px 750px;
		background-repeat:no-repeat;
   }
p{
	font-weight: bold;
	font-size: 30px;
}
input {
     background:none!important;
     border:none; 
     padding:0!important;
     font: inherit;
     /*border is optional*/
    // border-bottom:1px solid #444; 
     cursor: pointer;
}
table a:link {
	color: #777;
	font-weight: bold;
	text-decoration:none;
}
table a:visited {
	color: #88888;
	font-weight:bold;
	text-decoration:none;
}
table a:active,
table a:hover {
	color: red;
	text-decoration:underline;
}
table {
	font-family:Arial, Helvetica, sans-serif;
	color:black;
	font-weight:bold;
	font-size:13px;
	text-shadow: 0px 0px 0px #fff;
	background:blue;
	margin:20px;
	border:#ccc 1px solid;

	-moz-border-radius:3px;
	-webkit-border-radius:3px;
	border-radius:3px;

	-moz-box-shadow: 0 1px 2px #d1d1d1;
	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table th {
	padding:21px 25px 22px 25px;
	border-top:1px solid #fafafa;
	border-bottom:1px solid #e0e0e0;

	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#66ffff), to(#0077b3));
	background: -moz-linear-gradient(top,  #66ffff,  #0077b3);
}
table th:first-child{
	text-align: left;
	padding-left:20px;
}
table tr:first-child th:first-child{
	-moz-border-radius-topleft:3px;
	-webkit-border-top-left-radius:3px;
	border-top-left-radius:3px;
}
table tr:first-child th:last-child{
	-moz-border-radius-topright:3px;
	-webkit-border-top-right-radius:3px;
	border-top-right-radius:3px;
}
table tr{
	text-align: center;
	padding-left:20px;
}
table tr td:first-child{
	text-align: left;
	padding-left:20px;
	border-left: 0;
}
table tr td {
	padding:18px;
	border-top: 1px solid #ffffff;
	border-bottom:1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;
	
	background: #fafafa;
	background: -webkit-gradient(linear, left top, left bottom, from(#ccffeb), to(#ccffeb));
	background: -moz-linear-gradient(top,  #a3a3c2,  #3973ac);
}
table tr.even td{
	background: #f6f6f6;
	background: -webkit-gradient(linear, left top, left bottom, from(#66ff66), to(#66ff66));
	background: -moz-linear-gradient(top,  #ccffcc,  #ccffcc);
}
table tr:last-child td{
	border-bottom:0;
}
table tr:last-child td:first-child{
	-moz-border-radius-bottomleft:3px;
	-webkit-border-bottom-left-radius:3px;
	border-bottom-left-radius:3px;
}
table tr:last-child td:last-child{
	-moz-border-radius-bottomright:3px;
	-webkit-border-bottom-right-radius:3px;
	border-bottom-right-radius:3px;
}
table tr:hover td{
	background: #f2f2f2;
	background: -webkit-gradient(linear, left top, left bottom, from(#ffffcc), to(#d5ff80));
	background: -moz-linear-gradient(top,  #ffffcc,  #d5ff80);	
}

</style>

</head>

<body>
<?php
//session_start();
$str = $_POST["f"];
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "football";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
$str="'".$str."'";
$sql = "SELECT * FROM points_table WHERE team_name=".$str;
$result = $conn->query($sql);
//$pos = $row["position"];

if ($result->num_rows > 0) {
    // output data of each row
	//echo "<table><tr><th>Position</th><th>Team Name</th><th>Games Played</th><th>Games Won</th><th>Games Lost</th><th>Games Drawn</th><th>GF</th><th>GA</th><th>Points</th></tr>";
    echo "<p align='center'>League Table</p>";
	echo "<table><tr><th><form method='post' action='league.php'><input type='submit' value='Position'></th><th>
	<form method='post' action='league.php'><input type='submit' value='Team Name'></input></form></th>
	<th><form method='post' action='league.php'><input type='submit' value='Games Played'></input></form>
	</th><th><form method='post' action='league.php'><input type='submit' value='Games Won'></input></form></th>
	<th><form method='post' action='league.php'><input type='submit' value='Games Lost'></input></form></th>
	<th><form method='post' action='league.php'><input type='submit' value='Games Drawn'></th></input></form>
	<th><form method='post' action='league.php'><input type='submit' value='Goals Scored'></input></form></th>
	<th><form method='post' action='league.php'><input type='submit' value='Goals Against'></input></form></th>
	<th><form method='post' action='league.php'><input type='submit' value='Points'></input></form></th>
	</tr>";
	while($row = $result->fetch_assoc()) {
		echo "<tr>";
       echo "<td>".$row["position"]."</td><td>".$row["team_name"]."</td><td>".$row["games_played"]."</td><td>".$row["won"]."</td><td>".$row["losses"]."</td><td>".$row["draw"]."</td><td>".$row["goals_scored"].
	   "</td><td>".$row["goals_against"]."</td><td>".$row["points"]."</td></tr>";
    }
	echo "</table>";
} else {
    echo "Sorry the Team doesn't exist";
}

$sql = "SELECT * FROM owner WHERE team_name=".$str;
$result = $conn->query($sql);
//$pos = $row["position"];

if ($result->num_rows > 0) {
    echo "<p align='center'>Owner</p>";
	// output data of each row
	echo "<table><tr>
	<th><form method='post' action='owner.php'><input type='submit' value='Owner id'></input></form></th>
	<th><form method='post' action='owner.php'><input type='submit' value='Name'></input></form>
	</th><th><form method='post' action='owner.php'><input type='submit' value='Team Name'></input></form></th></tr>";
    while($row = $result->fetch_assoc()) {
		echo "<tr>";
       echo "<td>".$row["owner_id"]."</td><td>".$row["owner_fname"]." ".$row["owner_lname"]."</td><td>".$row["team_name"]."</td></tr>";
	}
	echo "</table>";
}
$sql = "SELECT * FROM manager WHERE team_name=".$str;
$result = $conn->query($sql);
//$pos = $row["position"];

if ($result->num_rows > 0) {
	echo "<p align='center'>Manager</p>";
    // output data of each row
	echo "<table><tr>
	<th><form method='post' action='manager.php'><input type='submit' value='Manager id'></input></form></th>
	<th><form method='post' action='manager.php'><input type='submit' value='Name'></input></form>
	</th><th><form method='post' action='manager.php'><input type='submit' value='Country'></input></form></th>
	<th><form method='post' action='manager.php'><input type='submit' value='Age'></input></form></th>
	<th><form method='post' action='manager.php'><input type='submit' value='Salary'></input></form>
	</th><th><form method='post' action='manager.php'><input type='submit' value='Team Name'></input></form></th>
	</tr>";
    while($row = $result->fetch_assoc()) {
		echo "<tr>";
       echo "<td>".$row["manager_id"]."</td><td>".$row["fname"]." ".$row["lname"]."</td><td>".$row["country"]."</td><td>".$row["age"]."</td><td>".$row["salary"]."</td><td>".$row["team_name"]."</td></tr>";
		echo "</table>";
}
}

$sql = "SELECT * FROM stadium WHERE team_name=".$str;
$result = $conn->query($sql);
//$pos = $row["position"];

if ($result->num_rows > 0) {
    echo "<p align='center'>Owner</p>";
	// output data of each row
	echo "<table><tr>
	<th><form method='post' action='stadium.php'><input type='submit' value='Stadium Name'></input></form></th>
	<th><form method='post' action='stadium.php'><input type='submit' value='Capacity'></input></form>
	</th><th><form method='post' action='stadium.php'><input type='submit' value='Location'></input></form></th>
	<th><form method='post' action='stadium.php'><input type='submit' value='Year Established'></input></form></th>
	<th><form method='post' action='stadium.php'><input type='submit' value='Team Name'></input></form>
	
	</tr>";
    while($row = $result->fetch_assoc()) {
		echo "<tr>";
       echo "<td>".$row["stadium_name"]."</td><td>".$row["capacity"]." </td><td> ".$row["location"]."</td><td>".$row["year_estd"]."</td><td>".$row["team_name"]."</td></tr>";
	}
	echo "</table>";
}

$sql = "SELECT s_name,team FROM sponser_team,sponser WHERE sponser_team.sponser=sponser_id && team=".$str;
$result = $conn->query($sql);
//$pos = $row["position"];

if ($result->num_rows > 0) {
    // output data of each row
	echo "<p align='center'>Official-Sponsor</p>";
	echo "<table><tr>
	<th><form method='post' action='sponser.php'><input type='submit' value='Sponser Name'></input></form></th>
	<th><form method='post' action='sponser.php'><input type='submit' value='Team Name'></input></form>
	</tr>";
    while($row = $result->fetch_assoc()) {
		echo "<tr>";
       echo "<td>".$row["s_name"]."</td><td>".$row["team"]."</tr>";
		echo "</table>";
	}
}

$sql = "SELECT * FROM player WHERE team_name=".$str;
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
	echo "<p align='center'>Players</p>";
	echo "<table><tr><th><form method='post' action='player.php'><input type='submit' value='Jersey No'></th><th>
	<form method='post' action='player.php'><input type='submit' value='Name'></input></form></th>
	<th><form method='post' action='player.php'><input type='submit' value='Team Name'></input></form>
	</th><th><form method='post' action='player.php'><input type='submit' value='Salary'></input></form></th>
	<th><form method='post' action='player.php'><input type='submit' value='Age'></input></form></th>
	<th><form method='post' action='player.php'><input type='submit' value='Country'></th></input></form>
	<th><form method='post' action='player.php'><input type='submit' value='Position'></input></form></th></tr>";
	
	
	$c=0;
    while($row = $result->fetch_assoc()) {
		
       //echo "<td>".$row["team_name"]."</td><td>". $row["position"]."</td></tr>";
	   if($c%2==0)
	   {
		   echo "<tr class='even'>";
		echo "<td>".$row["player_id"]."</td><td>".$row["fname"]." ".$row["lname"]."</td>"."<td>".$row["team_name"]."</td><td>".$row["salary"]."</td><td>".$row["age"]."</td>
		   <td><form method='post' action='country.php'><input type='submit' name='country' value="."'".$row["country"]."'></input></form></td>
		   <td><form method='post' action='position.php'><input type='submit' name='position' value="."'".$row["position"]."'></input></form></td></tr>";
	   }
	   else
	   {
		   echo "<tr>";
		   echo "<td>".$row["player_id"]."</td><td>".$row["fname"]." ".$row["lname"]."</td>"."<td>".$row["team_name"]."</td><td>".$row["salary"]."</td><td>".$row["age"]."</td>
		   <td><form method='post' action='country.php'><input type='submit' name='country' value="."'".$row["country"]."'></input></form></td>
		   <td><form method='post' action='position.php'><input type='submit' name='position' value="."'".$row["position"]."'></input></form></td></tr>";
	   }
		$c=$c+1;
	}
	echo "</table>";
}


$sql = "SELECT * FROM matches WHERE team1=".$str."OR team2=".$str;
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
	echo "<p align='center'>Matches</p>";
	echo "<table><tr><th><form method='post' action='matches.php'><input type='submit' value='Match_Id'></th><th>
	<form method='post' action='matches.php'><input type='submit' value='Date'></input></form></th>
	<th><form method='post' action='matches.php'><input type='submit' value='team1'></input></form></th>
	<th><form method='post' action='matches.php'><input type='submit' value='team2'></input></form></th>
	<th><form method='post' action='matches.php'><input type='submit' value='result'></input></form></th>
	<th><form method='post' action='matches.php'><input type='submit' value='Stadium Name'></input></form>
	</th></tr>";
	
	
	$c=0;
    while($row = $result->fetch_assoc()) {
		
       //echo "<td>".$row["team_name"]."</td><td>". $row["position"]."</td></tr>";
	   if($c%2==0)
	   {
		   echo "<tr class='even'>";
		echo "
		   <td><form method='post' action='matches.php'><input type='submit' name='match' value="."'".$row["matches_id"]."'></input></form></td>
		   <td><form method='post' action='matches.php'><input type='submit' name='date' value="."'".$row["date"]."'></input></form></td>
		   <td><form method='post' action='t.php'><input type='submit' name='f' value="."'".$row["team1"]."'"."></input></form></td>
		   <td><form method='post' action='t.php'><input type='submit' name='f' value="."'".$row["team2"]."'"."></input></form></td>
		   <td>".$row["result"]."</td>
		   <td><form method='post' action='stadium.php'><input type='submit' name='stadium' value="."'".$row["stadium_name"]."'></input></form></td></tr>";
	   }
	   else
	   {
		   
		echo "
		   <td><form method='post' action='matches.php'><input type='submit' name='match' value="."'".$row["matches_id"]."'></input></form></td>
		   <td><form method='post' action='matches.php'><input type='submit' name='date' value="."'".$row["date"]."'></input></form></td>
		   <td><form method='post' action='t.php'><input type='submit' name='f' value="."'".$row["team1"]."'"."></input></form></td>
		   <td><form method='post' action='t.php'><input type='submit' name='f' value="."'".$row["team2"]."'"."></input></form></td>
		   <td>".$row["result"]."</td>
		   <td><form method='post' action='stadium.php'><input type='submit' name='stadium' value="."'".$row["stadium_name"]."'></input></form></td></tr>";}
		$c=$c+1;
	}
	
	echo "</table>";
}

$conn->close();
?>
</body>
</html>
