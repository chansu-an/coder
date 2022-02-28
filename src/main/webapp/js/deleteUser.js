function deleteUser(){
	 msg = "정말로 탈퇴하시겠습니까?";
            if (confirm(msg)!=0) {
                 location.href="../Mypage/UserDelete.do"
            } else {
                // no click
}
}