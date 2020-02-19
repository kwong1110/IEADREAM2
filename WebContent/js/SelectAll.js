/**
 * 체크박스 전부 체크, 헤제 기능
 * 전부체크 #all
 * 요소별체크 name="checkselect";
 */

function checkAll() {
	var all = document.getElementById("all");
	var category = document.getElementsByName("checkselect");
	if (all.checked) {
		for (var i = 0; i < category.length; i++) {
			category[i].checked = true;
		}
	} else {
		for (var i = 0; i < category.length; i++) {
			category[i].checked = false;
		}
	}
}

function checkDetail() {
	var count = 0;
	var all = document.getElementById("all");
	var category = document.getElementsByName("checkselect");

	for (var i = 0; i < category.length; i++) {
		if (category[i].checked) {
			count++;
		}
	}

	if (count != category.length) {
		all.checked = false;
	} else {
		all.checked = true;
	}
}