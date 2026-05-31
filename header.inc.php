<?php
echo '<script>var _f=document.createElement("link");_f.rel="icon";_f.type="image/png";_f.href="images/logo-cno.png";document.head.appendChild(_f);</script>';
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
