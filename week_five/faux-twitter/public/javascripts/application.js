/* Main Application Functions */

$(document).ready(function()
{
	
	$("#event_button").click(function()
	{
		//alert("we clicked the button");
		
		// make an AJAX call to /main/find_me_info,
		// alert findings
		
		$.ajax({
			type : "GET",
			url : "/main/find_me_info",
			data : "what_info=3",
			success: function(msg)
			{
				//alert(msg);
				$("#dynamic_information_div").html("<div class='cool_div'><p>"+msg+"</p></div>");
			}
		});
		
		return false;
	});
	
});