/**
 * 
 */
 function boardCheck()	{
	if(document.frm.name.value.length ==0 ){
		alert("이름을 작성해주세요.");
		frm.name.focus();
		return false;
	}
	
	
	if(document.frm.title.length ==0){
		alert("제목을 써주세요.");
		frm.title.focus();
		return false;
		
	}
	
	if(document.frm.content.length ==0){
		alert("내용을 써주세요.");
		frm.content.focus();
		return false;
		
	}
	return true;
}


//아래는 아직 미확인
function open_win(url, name) {

	window.open(url, name, "width=500 height=230")
}

function passCheck() {
	if (document.frm.pass.value.length == 0) {
		alert("비밀번호를 입력하세요");
		return false;
	}
	return true;
}