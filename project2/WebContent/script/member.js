	function checklogin(){
		if(document.loginForm.id.value=="")
			alert("아이디입력");
		else if(document.loginForm.pwd.value=="")
			alert("비밀번호입력");
		else
			document.loginForm.submit();
	}
	
	function checkWrite(){
		if(document.writeForm.name.value==""){
			alert("이름입력 필수");
			document.writeForm.name.focus();
		}
		else if(document.writeForm.id.value==""){
			alert("아이디 입력 필수");
			document.writeForm.id.focus();
		}
		else if(document.writeForm.pwd.value==""){
			alert("비밀번호 입력 필수");
			document.writeForm.pwd.focus();
		}
		else if(document.writeForm.pwd.value!=document.writeForm.repwd.value){
			alert("비밀번호가 다름");
			document.writeForm.repwd.focus();
		}
		else
			document.writeForm.submit();
	}
	function checkId(){
		var sid=document.writeForm.id.value;
		if(sid=="")
			alert("먼저 아이디부터..");
		else
		window.open("checkId.jsp?id="+sid,"","width=300 height=100 left=600 top=100");
	}
	