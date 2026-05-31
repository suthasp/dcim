<?php
$header=(!isset($header))?$config->ParameterArray["OrgName"]:$header;
$subheader=(!isset($subheader))?"":$subheader;
$version=$config->ParameterArray["Version"];

echo '
<div id="header">
	<span id="header1">',$header,'</span>
	<span id="header2">',$subheader,'</span>
	<span id="version">',$person->UserID,'/',$version,' | <a href="login_ldap.php?logout=1" style="color:inherit;">Logout</a></span>
</div>
';
?>
