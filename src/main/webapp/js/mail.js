let generatedCode = ''; // 생성된 인증번호를 저장할 변수

function sendEmail() {
    const from = "lunasc@naver.com";
	
	const email1 = document.getElementById('email1').value;
	const email2 = document.getElementById('email2').value;
	
    const to = email1 + "@" +email2;
    const randomCode = Math.floor(Math.random() * 900000) + 100000; // 인증번호 생성

    // AJAX를 사용하여 이메일 전송
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "sendMail.jsp", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onload = function() {
        if (xhr.status === 200) {
            alert("이메일이 성공적으로 전송되었습니다.");
            generatedCode = randomCode; // 생성한 인증번호 저장
            document.getElementById('verificationSection').style.display = 'block'; // 인증번호 입력 칸 보이기
        } else {
            alert("이메일 전송 중 오류 발생: " + xhr.statusText);
        }
    };

    // 요청 데이터에 인증번호 포함
    xhr.send(`from=${encodeURIComponent(from)}&to=${encodeURIComponent(to)}&code=${randomCode}`);
}

function verifyCode() {
    const inputCode = document.getElementById('inputCode').value;
    
    if (!inputCode) {
        alert("메일을 발송해주세요");
        return;
    }

    if (inputCode === generatedCode.toString()) {
        alert("인증번호가 일치합니다.");
    } else {
        alert("인증번호가 일치하지 않습니다.");
        document.getElementById('inputCode').value = ''; 
    }
}