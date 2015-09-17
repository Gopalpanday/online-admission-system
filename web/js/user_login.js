function isBlank()
{	
	var val = document.getElementById('email').value;
	if(val == '')
	{
		document.getElementById('email').focus();
		return false;
	}
	var val1 = document.getElementById('pass').value;
	if(val1 == '')
	{
		document.getElementById('pass').focus();
		return false;
	}
}