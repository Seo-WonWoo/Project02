<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="referrer" content="always">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0">
    <!-- No cache -->
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache; no-store; no-save">
    <meta property="og:title" content="프로젝트">
    <title>프로젝트</title>

    <link rel="stylesheet" href="./css/sub.css">
    <link rel="stylesheet" href="./css/header.css">
    <link rel="stylesheet" href="./css/layout.css">
    <link rel="stylesheet" href="./css/base.css">
    <link rel="stylesheet" href="./css/board.css">

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8"); //문자인코딩 설정  한글깨짐 방지
		String inputId = request.getParameter("input_id");
		int checkId = (request.getParameter("check_id") != null && !request.getParameter("check_id").isEmpty())
				? Integer.parseInt(request.getParameter("check_id"))
				: 0;			
	%>

	<div class="field">
		<form action="signUpAction.jsp" method="post" id=" ">
        <div class="store_search_box  sign_up_box center_box">
            <h2 class="title mb30">회원가입</h2>
            
            <%
			if( checkId == 1){
            %>      
            <div class="wrap_s">
                <div class="wrap_s" style="align-items: flex-start;">
                <div class="wrap_s box id_box">
                    <p class="text">아이디</p>
                    <div style="width: 220px;">                    
	                    <input type="text" class="input-value" value="<%=inputId%>" readonly>
	                    <p class="info input-check"></p>
                    </div>
                </div>                
            	</div>
            </div>
            
			<%
			} else {
           	%>
            	<div class="wrap_s">
                <div class="wrap_s" style="align-items: flex-start;">
                <div class="wrap_s box id_box">
                    <p class="text">아이디</p>
                    <div style="width: 220px;">                    
	                    <input type="text" class="input-value">
	                    <p class="info input-check"></p>
                    </div>
                </div>
                <div class="btn2" style="width: 100px; padding: 14px;" onclick="idCheckSubmit()">중복확인</div>
            	</div>
            	</div>
            <%
           	}
           	%>
            <div class="wrap_s box mt20">
                <p class="text">비밀번호</p>
                <div>
	                <input type="password" name="pw_signUp" class="input-value">
	                <p class="info input-check"></p>
                </div>
            </div>
            
            <div class="wrap_s box mt20">            	
                <p class="text">이름</p>
                <div>
	                <input type="text" name="name_signUp" placeholder="홍길동" class="input-value">
	                <p class="info input-check"></p>
                </div>                
            </div>            

            <div class="wrap_s box mt20">
                <p class="text">주민번호</p>
                <div>
	                <input type="text" name="jumin_signUp" placeholder="000000-0000000" class="input-value">
	                <p class="info input-check"></p>
                </div>
            </div>

            <div class="wrap_s box mt20">
                <p class="text">전화번호</p>
                <div>
	                <input type="tel" name="tel_signUp"  placeholder="010-0000-0000" class="input-value">
	                <p class="info input-check"></p>
                </div>
            </div>

            <div class="wrap_s box mt20">
                <p class="text">주소</p>
                <div>
                <input type="text" name="address_signUp" class="input-value">
                <p class="info input-check"></p>
                </div>
            </div>

            <div class="btn2 mt30" style="float: right; padding: 15px 0;" onclick="signUpSubmit()">가입하기</div>
        </div>
        </form>
    </div>
    
    <script>
 	
    	//input 
    	let inputValue = document.querySelectorAll('.input-value');
    	let inputCheckMsg = document.querySelectorAll('.input-check');
    	let inputCheck = [ false, false, false, false, false, false ];
    	let inputIdCheckSubmit = false;
    	let inputName = ['아이디', '비밀번호', '이름', '주민번호', '전화번호', '주소'];
    	
    	if(<%=checkId%> == 1 ){
    		inputCheck[0] = true;
    	}
    	
    	
    	let idLimit = /^[a-zA-Z0-9-_]{5,12}$/;  // a~z, A~Z, 0~9, -, _만 5~12자리 입력가능
    	let pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{5,12}$/; // a~z, A~Z, 0~9,~!@#$%^&*()_-특수문자 만 5~12자리 입력가능
    	let juminLimit1 = /^[0-9]{6}$/; // 0~9내에서만 6자리 입력가능    	
    	let juminLimit2 = /^[0-9]{7}$/; // 0~9내에서만 7자리 입력가능
    	let pnumLimit1 = /^[0-9]{2,3}$/; // 0~9내에서만 2~3자리 입력가능    	
    	let pnumLimit2 = /^[0-9]{3,4}$/; // 0~9내에서만 3~4자리 입력가능
        let pnumLimit3 = /^[0-9]{4}$/; // 0~9내에서만 4자리 입력가능
    
        inputValue[0].addEventListener('keyup', ()=>{
            if( idLimit.test(inputValue[0].value) ){
            	inputCheckMsg[0].innerHTML = "아이디 중복 확인 필요합니다.";
            	inputIdCheckSubmit = true;
            } else{
            	inputCheckMsg[0].innerHTML = "5~12자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
            	inputIdCheckSubmit = false;
            }
        })
        
        inputValue[1].addEventListener('keyup', ()=>{ 
            if( pwLimit.test(inputValue[1].value) ){
            	inputCheckMsg[1].innerHTML = "비밀번호 사용이 가능합니다.";
            	inputCheck[1] = true;
            } else{
            	inputCheckMsg[1].innerHTML = "5~12자의 영문 소대문자, 숫자와 특수기호 '~!@#$%^&*()_-'만 사용 가능합니다.";
            	inputCheck[1] = false;
            }
        })
        
		inputValue[2].addEventListener('keyup', ()=>{ 
            if( inputValue[2].value != null ){
            	inputCheckMsg[2].innerHTML = "";
            	inputCheck[2] = true;
            } else{
            	inputCheckMsg[2].innerHTML = "이름 입력해주세요.";
            	inputCheck[2] = false;
            }
        })
        
        inputValue[3].addEventListener('keyup', ()=>{ 
            if( juminLimit1.test(inputValue[3].value.substring(0, inputValue[3].value.indexOf('-')))
            		&& juminLimit2.test(inputValue[3].value.substr(7)) ){
            	inputCheckMsg[3].innerHTML = "";
            	inputCheck[3] = true;
            } else{
            	inputCheckMsg[3].innerHTML = "다음의 양식으로 입력하시기 바랍니다. 000000-0000000";
            	inputCheck[3] = false;
            }
        })
        
        inputValue[4].addEventListener('keyup', ()=>{
            if( pnumLimit1.test( inputValue[4].value.substring(0, inputValue[4].value.indexOf('-') ) )
            		&& pnumLimit2.test( inputValue[4].value.substring(inputValue[4].value.indexOf('-')+1, inputValue[4].value.indexOf('-', 4) ) )
            		&& pnumLimit3.test( inputValue[4].value.substr(inputValue[4].value.indexOf('-', 4)+1 ) ) ){
            	inputCheckMsg[4].innerHTML = "";
            	inputCheck[4] = true;
            } else{
            	inputCheckMsg[4].innerHTML = "다음의 양식으로 입력하시기 바랍니다. 000(2~3자리)-0000(3~4자리)-0000";
            	inputCheck[4] = false;
            }
        })
        
        inputValue[5].addEventListener('keyup', ()=>{ 
            if( inputValue[5].value != null ){
            	inputCheckMsg[5].innerHTML = "";
            	inputCheck[5] = true;
            } else{
            	inputCheckMsg[2].innerHTML = "주소 입력해주세요.";
            	inputCheck[5] = false;
            }
        })
        
        function idCheckSubmit(){
        	if(inputIdCheckSubmit == true){        		
        		location.href = "idCheck.jsp?input_id=" + inputValue[0].value;
        	} else {
        		alert('아이디를 양식에 맞게 입력해주세요');
        		inputValue[0].focus();
        	}
        	
        }
        
        
    	function signUpSubmit(){
        	for(let i=0; i<6; i++){
        		if(inputCheck[i] == false){
        			alert(inputName[i] + " 입력해주세요")
        			inputValue[i].focus();
        			return false;
        		}
        	}
			document.getElementById('signUp_form').submit();
		}
    </script>
</body>
</html>