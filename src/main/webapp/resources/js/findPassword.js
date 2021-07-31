
	const findPwForm = document.getElementById('findPwForm')
	const findPw = document.querySelector('.findPw')
	const sendWrap = document.querySelector('.sendWrap')
	
	const sendMailHandler = function(event){
		event.preventDefault()
		
      	const formData = new FormData(event.target)
		
		const email = event.target.querySelector('input[name="email"]')
		const phoneNumber = event.target.querySelector('input[name="phoneNumber"]')

		const SocialCheck = email.value
		
		const url = cpath + '/my/profile/check/' + SocialCheck + '/'
		const opt = {
				method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 0) {
				console.log(SocialCheck)
				alert('소셜아이디로 가입된 계정입니다.')
			}
			else{
				const url = cpath + '/login/find_password/'
				const opt = {
					method: 'POST',
					body: formData,
				}
				fetch(url, opt).then(resp => resp.text())
		 		.then(text => {
		 			if(text == 1) {	// DB에 일치하는 이메일 정보가 있다면
		 				// 임시 비밀번호 전송
		 				const url = cpath + '/login/find_password/accord/' + email.value + '/' + phoneNumber.value + '/'
						const opt = {
							method: 'GET',
						}
		 				fetch(url, opt).then(resp => resp.text())
		 				.then(text => {
		 					console.log(text)
		 					if(text == 1) {
		 						findPw.classList.add('hidden')
		 						sendWrap.classList.remove('hidden')
		 					}
		 					else {
		 						alert('메일 발송에 실패하였습니다.')	
		 					}
		 				})
					}
					else {	// DB에 일치하는 이메일 정보가 없다면
						alert('일치하는 사용자 정보를 찾을 수 없습니다.')	
					}
				})
			}
		})
	}
	findPwForm.onsubmit = sendMailHandler
	
	const checkedInputBox = function(event) {
		const email = document.querySelector('input[name="email"]')
		const phoneNumber = document.querySelector('input[name="phoneNumber"]')
		
		// 전화번호 숫자만
		let reg_num = /^[0-9]{10,11}$/
		// 이메일
		let reg_email =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/
		 
		const msg = document.createElement('p')
		msg.classList.add('findPwMsg')

		// 값이 들어온 input 구별 (email or phoneNum)
		if(event.target.name == 'phoneNumber') {
			msg.classList.add('phoneNumberMsg')
			// 전화번호 유효성 체크
			
			// 유효성 체크 false && 유효성 체크 메세지가 없는 경우
			if(!check(reg_num,event.target.value) && !document.querySelector('.phoneNumberMsg')){
				msg.innerText = '휴대폰 번호를 정확히 입력해주세요.'
				phoneNumber.after(msg)
			}
			
			// 유효성 체크 true
			else if(check(reg_num,event.target.value)) {
				const phoneNumberMsg = document.querySelector('.phoneNumberMsg')
				
				// 유효성 체크 메세지가 있다면 삭제
				if(document.querySelector('.phoneNumberMsg')){
					phoneNumber.parentNode.removeChild(phoneNumberMsg);
				}
			}
		}
		else if(event.target.name == 'email'){
			msg.classList.add('emailMsg')
			// 메일 유효성 체크
			if(!check(reg_email,event.target.value) && !document.querySelector('.emailMsg')){
				msg.innerText = '이메일 주소를 정확히 입력해주세요.'
				email.after(msg)
			}
			else if(check(reg_email,event.target.value)) {
				const emailMsg = document.querySelector('.emailMsg')
				if(document.querySelector('.emailMsg')) {
					email.parentNode.removeChild(emailMsg);
				}
			}
		}
	}
	
	function check(reg, val) {
		if(reg.test(val)){
			return true
		}
		else {
			return false
		}
	}
	
	const email = document.querySelector('input[name="email"]')
	const phoneNumber = document.querySelector('input[name="phoneNumber"]')
	
	email.oninput = function(event) {
		checkedInputBox(event)
		avtiveBtn()
	}
	phoneNumber.oninput = function(event) {
		checkedInputBox(event)
		avtiveBtn()
	}
	
	// 유효성 체크 후 버튼 활성화
	function avtiveBtn() {
		const findPwBtn = document.getElementById('findPwSubmitBtn')
		if(document.querySelector('.phoneNumberMsg') == null && document.querySelector('.emailMsg') == null && email.value.length > 0 && phoneNumber.value.length > 0){
			findPwBtn.disabled = false
			findPwBtn.classList.remove('off')
		}
		else {
			findPwBtn.disabled = true
			findPwBtn.classList.add('off')
		}
	}