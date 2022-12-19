window.onload = function () {
 	$("#mntDate").flatpickr({
    dateFormat: "Y년 m월 d일",
	 minDate: "today",
	"locale": "ko",
 });
 

 $('#stTimepicker').timepicker({
    timeFormat: 'H:00',
    interval: 60,
    minTime: '09:00am',
    maxTime: '11:00pm',
    startTime: '09:00am',
    dynamic: false,
    dropdown: true,
    scrollbar: true,
    change: stTimeSelectChange
});	    		
   
    var stTime = "";
 	var edTime = "";
   
   
   	   function stTimeSelectChange(){
        stTime = $("#stTimepicker").val();   
        console.log(stTime);
       // $('#edTimepicker').prop('disabled', false);
        $('#edTimepicker').timepicker('option', 'minTime', stTime+'1:00');
           
       //document.getElementById("clickedStartTime").value = stTime;
     }                   
        
	$('#edTimepicker').timepicker({
    	 timeFormat: 'H:00',
    	 interval: 60,
    	 dynamic: false,
    	 dropdown: true,
    	 scrollbar: true
    	 
    });
	  
	 console.log(stTime);  
}
