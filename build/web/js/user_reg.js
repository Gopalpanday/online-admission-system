// JavaScript Document
function isBlank()
{
	var val = document.getElementById('email').value;
	if(val == '')
	{
		document.getElementById('email').focus();
		return false;
	}
	var val1 = document.getElementById('fname').value;
	if(val1 == '')
	{
		document.getElementById('fname').focus();
		return false;
	}
	var val2 = document.getElementById('dob').value;
	if(val2 == '')
	{
		document.getElementById('dob').focus();
		return false;
	}
	var val4 = document.getElementById('contact').value;
	if(val4 == '' || isNaN(val4))
	{
		document.getElementById('contact').focus();
		return false;
	}
	var val5 = document.getElementById('address').value;
	if(val5 == '')
	{
		document.getElementById('address').focus();
		return false;
	}	
	var val7 = document.getElementById('pin').value;
	if(val7 == '' || isNaN(val7))
	{
		document.getElementById('pin').focus();
		return false;
	}
        var val8 = document.getElementById('pass').value;
	if(val8 == '')
	{
		document.getElementById('pass').focus();
		return false;
	}
        var val9 = document.getElementById('pass1').value;
        if(val9 == '')
	{
		document.getElementById('pass1').focus();
		return false;
	}
        if(val8!=val9)
	{
		document.getElementById('pass').value="";
		document.getElementById('pass1').value="Please enter same password";
		document.getElementById('pass1').focus();
		return false;
	}
}

function isBlank1()
{
	var val1 = document.getElementById('fname').value;
	if(val1 == '')
	{
		document.getElementById('fname').focus();
		return false;
	}
	var val4 = document.getElementById('contact').value;
	if(val4 == '' || isNaN(val4))
	{
		document.getElementById('contact').focus();
		return false;
	}
	var val5 = document.getElementById('address').value;
	if(val5 == '')
	{
		document.getElementById('address').focus();
		return false;
	}	
	var val7 = document.getElementById('pin').value;
	if(val7 == '' || isNaN(val7))
	{
		document.getElementById('pin').focus();
		return false;
	}
        var val8 = document.getElementById('pass').value;
	if(val8 == '')
	{
		document.getElementById('pass').focus();
		return false;
	}
        var val9 = document.getElementById('pass1').value;
        if(val9 == '')
	{
		document.getElementById('pass1').focus();
		return false;
	}
        if(val8!=val9)
	{
		document.getElementById('pass').value="";
		document.getElementById('pass1').value="Please enter same password";
		document.getElementById('pass1').focus();
		return false;
	}
}