

function boardCheck() {
	if (document.frm.name.value.length == 0) {
		alert("작성자를 입력하세요");
		return false;
	}
	if (document.frm.bTitle.value.length == 0) {
		alert("제목을 입력하세요");
		return false;
	}

	return true;
}





/**
function open_win(url, name) {
	window.open(url, name, "width=500 height=230")
}

-

* 
 */
 
 