$(document).ready(function() {
	  var menu = $("#sRoom-menu-wrap").offset().top;
	  $(window).scroll(function() {
	    var window = $(this).scrollTop();
	    if(menu <= window) {
	      $("#sRoom-menu-wrap").addClass("fixed");
	    } else {
	      $("#sRoom-menu-wrap").removeClass("fixed");
	    }
	  })
	  
	  $("#move").click(function(event){         
          event.preventDefault();
          $('html,body').animate({scrollTop:$(this.hash).offset().top}, 300);
  	  });
  	  
  	  // 시간선택
  	  $('#sTimepicker').timepicker({
    	 timeFormat: 'H:00', // 분을 빼고 00으로 설정
    	 interval: 60, // 1시간 간격
    	 startTime: '7:00am',
    	 minTime: new Date(), //// 최소 시작시간을 현재시간으로 설정
    	 maxTime: '22:00pm',
    	 dynamic: false,
    	 dropdown: true,
    	 scrollbar: true,
    	 change: stimeSelectChange
      })
      
      var stTime = "";
 	  var endTime = "";
 	  
 	  $("#eTimepicker").prop('disabled', true);
 
	  function stimeSelectChange(){
	  	stTime = $("#sTimepicker").val();   
	  	console.log(stTime);
	  	$('#eTimepicker').prop('disabled', false);
	  	$('#eTimepicker').timepicker('option', 'minTime', stTime+'1:00');
			  
    	document.getElementById("clickedStartTime").value = stTime;
    	document.getElementById("reserveStime").value = stTime;
    	
	  } 	    		
    	    		
    $('#eTimepicker').timepicker({
    	 timeFormat: 'H:00',
    	 interval: 60,
    	 //maxTime: '0:00',
    	 dynamic: false,
    	 dropdown: true,
    	 scrollbar: true,
    	 change: etimeSelectChange
    });
      
    function etimeSelectChange(){
	  endTime = $("#eTimepicker").val();
	  stTime = $("#sTimepicker").val();
	  
	  console.log(stTime);
	  console.log(endTime);
	  document.getElementById("clickedStartTime").value += '~' + endTime;
	  document.getElementById("reserveEtime").value = endTime;
	  
	  // 일부 자르기
	  var strStTime = stTime.slice(0,2);
	  var strEndTime = endTime.slice(0,2);
	 
	  // String -> int 형변환
	  var intStTime = parseInt(strStTime);
	  var intEndTime = parseInt(strEndTime);
	  
	  // 시간차이 구하기
	  var durationTime = intEndTime-intStTime
	  console.log(durationTime);
	
	  
	  // 시간차이 반영
	  document.getElementById("timeDuration").value = '(' + durationTime + '시간)';
	  
	  var OriginPeople = document.getElementById("originalPeople").value;
	  var priceArea = document.getElementById("originalPrice").value;
	  var price = parseInt(priceArea);
	  
	  console.log("가격 : " + price);
	  console.log("시간차이 : " + durationTime );
	  console.log("가격 데이터타입 : " + typeof price);
	  console.log("시간차이 데이터 타입 : " + typeof durationTime);
	  
	  if(peopleNum !="") {
	 	 var peopleNum = document.getElementById("pNum").value;
	 	 document.getElementById("price-input-box").value = durationTime * price * peopleNum;
	  } else {
	 	 document.getElementById("price-input-box").value = durationTime * price * OriginPeople;
	  }
	}
	
	
      
  	  
});



 
window.onload = function() {

var btn = document.querySelectorAll("button.modal-custom-button");
var modals = document.querySelectorAll('.modal-custom');
var spans = document.getElementsByClassName("close-modal");

for (var i = 0; i < btn.length; i++) {
    btn[i].onclick = function (e) {
        e.preventDefault();
        modal = document.querySelector(e.target.getAttribute("href"));
        console.log(modal);
        modal.style.display = "block";
    }
}
    
for (var i = 0; i < spans.length; i++) {
    spans[i].onclick = function (e) {
          for (var index in modals) {
            if (typeof modals[index].style !== 'undefined') modals[index].style.display = "none";
        }
    }
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target.classList.contains('modal-custom')) {
        for (var index in modals) {
            if (typeof modals[index].style !== 'undefined') modals[index].style.display = "none";
        }
    }
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 스터디룸 주소
var sradr = document.getElementById("sAddr").value;

// 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(sradr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			var lat = result[0].y; // 위도
			var lng = result[0].x; // 경도
			console.log(lat);
			console.log(lng);
						
		var mapbtn = document.getElementById('map-btn');
		mapbtn.addEventListener("click", function() {
			window.location = "https://map.kakao.com/link/to/"+document.getElementById("sName").value+","+lat+","+lng;
		})
						
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div class="map-text">' + document.getElementById("sName").value + '</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
        
        
    } 
});    

// 캘린더
var selectedDate = "";

var flatpk = flatpickr(document.getElementById("sRoomSelectDate"), {
	'monthSelectorType' : 'static',
	"locale": "ko",
	 dateFormat: "Y년 m월 d일",
	 minDate: "today",
	 inline: true, 
	
	onChange: function() {
		selectedDate = document.getElementById("sRoomSelectDate").value;
		console.log(selectedDate);
		document.getElementById("clickedDate").value = selectedDate;
		
	}
});

// 공유하기
const open = () => {
    document.querySelector(".shareModal").classList.remove("hidden");
  }

  const close = () => {
    document.querySelector(".shareModal").classList.add("hidden");
  }
  document.querySelector(".detail-button-share").addEventListener("click", open);
  document.querySelector(".share-closeBtn").addEventListener("click", close);
  document.querySelector(".bg").addEventListener("click", close);


  // 카카오 공유하기
  document.getElementById("kakaoShareBtn").addEventListener("click", shareKakao);	
  function shareKakao() {
 
  // 사용할 앱의 JavaScript 키 설정
  Kakao.init('fe630bd53dba8a69ff6f81c29b1b2bba');
 
  // 카카오링크 버튼 생성
  Kakao.Link.createDefaultButton({
    container: '#kakaoShareBtn', // 카카오공유버튼ID
    objectType: 'feed',
    content: {
      title: "스터디룸 이름", // 보여질 제목
      description: "스터디룸 이름 정보 및 예약페이지", // 보여질 설명
      imageUrl: "https://ifh.cc/g/SG0cCl.jpg", // 콘텐츠 썸네일 URL
      link: {
         mobileWebUrl: "http://localhost:8888/sRoom/detail",
         webUrl: "http://localhost:8888/sRoom/detail"
      }
    }
 });   
}
  
   // 트위터 공유하기
  document.getElementById("twitterShareBtn").addEventListener("click", shareTwitter);	
  function shareTwitter() {
    var sendText = "스터디룸 이름 정보 및 예약페이지"; // 전달할 텍스트
    var sendUrl = "http://localhost:8888/sRoom/detail"; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}
        	
   // 현재페이지 url 확인
   var sRoomUrl = document.location.href;
   console.log(sRoomUrl); 
   
   // 현재페이지 url 복사
  document.getElementById("urlShareBtn").addEventListener("click", clip);	
  
  function clip(){
  	var url = '';    // <a>태그에서 호출한 함수인 clip 생성
    var textarea = document.createElement("textarea");  
    //url 변수 생성 후, textarea라는 변수에 textarea의 요소를 생성
        
    document.body.appendChild(textarea); //</body> 바로 위에 textarea를 추가(임시 공간이라 위치는 상관 없음)
    url = window.document.location.href;  //url에는 현재 주소값을 넣어줌
    textarea.value = url;  // textarea 값에 url를 넣어줌
    textarea.select();  //textarea를 설정
    document.execCommand("copy");   // 복사
    document.body.removeChild(textarea); //extarea 요소를 없애줌
        
    var urlMsg = document.getElementById("urlCopiedMsg");
    if(urlMsg.style.display=="none"){ 		
    	urlMsg.style.display = "block"; 	
    } else {
    	urlMsg.style.display = "none";
    }
    }
       	
}
