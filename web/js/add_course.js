// JavaScript Document
function isBlank()
{
	var val = document.getElementById('code').value;
	if(val == '')
	{
		document.getElementById('code').focus();
		return false;
	}
	var val1 = document.getElementById('name').value;
	if(val1 == '')
	{
		document.getElementById('name').focus();
		return false;
	}
	var val2 = document.getElementById('duration').value;
	if(val2 == 'select')
	{
		document.getElementById('duration').focus();
		return false;
	}
	var val3 = document.getElementById('type').value;
	if(val3 == 'select')
	{
		document.getElementById('type').focus();
		return false;
	}	
	var val4 = document.getElementById('fees').value;
	if(val4 == '' || isNaN(val4))
	{
		document.getElementById('fees').focus();
		return false;
        }
}

function isBlank1()
{
	var val = document.getElementById('code1').value;
	if(val == '')
	{
		document.getElementById('code1').focus();
		return false;
	}
}

function isBlank2()
{
        var val = document.getElementById('course1').value;
	if(val == '')
	{
		document.getElementById('course1').focus();
		return false;
	}
        var val1 = document.getElementById('name1').value;
	if(val1 == '')
	{
		document.getElementById('name1').focus();
		return false;
	}
	var val2 = document.getElementById('duration1').value;
	if(val2 == '')
	{
		document.getElementById('duration1').focus();
		return false;
	}
	var val3 = document.getElementById('type1').value;
	if(val3 == '')
	{
		document.getElementById('type1').focus();
		return false;
	}	
	var val4 = document.getElementById('fees1').value;
	if(val4 == '' || isNaN(val4))
	{
		document.getElementById('fees1').focus();
		return false;
        }
}

function isBlank3()
{
	var val2 = document.getElementById('course_c').value;
	if(val2 == 'select')
	{
		document.getElementById('course_c').focus();
		return false;
	}
}

function isBlank4()
{
	var val = document.getElementById('enroll').value;
	if(val == '' || isNaN(val))
	{
		document.getElementById('enroll').focus();
		return false;
	}
}