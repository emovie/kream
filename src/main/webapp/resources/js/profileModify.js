	const ModifyEmailBtn = document.querySelector('.ModifyEmailBtn')
	const ModifyPwBtn = document.querySelector('.ModifyPwBtn')
	const ModifyNameBtn = document.querySelector('.ModifyNameBtn')

	const SocialCheck = '${login.email}'
	
	const email = document.querySelector('input[name="newEmail"]')
	const nowPw = document.querySelector('input[name="nowPw"]')
	const newPw = document.querySelector('input[name="newPw"]')
	const name = document.querySelector('input[name="newName"]')
	const authNum = document.querySelector('input[name="authNum"]')
	
	ModifyEmailBtn.onclick = function(event) {
		const url = '${cpath}/my/profile/check/' + SocialCheck + '/'
		const opt = {
				method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 0) {
				alert('소셜 로그인된 상태에서는 비밀번호를 변경할 수 없습니다.')
			}
			else{
				const ModifyEmail = document.querySelector('.myEmailModify')
				const myEmail = document.querySelector('.myEmail')
				ModifyEmail.classList.remove('hidden')
				myEmail.classList.add('hidden')
				
			}
		})
		
	}
	
	ModifyPwBtn.onclick = function(event) {
		const url = '${cpath}/my/profile/check/' + SocialCheck + '/'
		const opt = {
				method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 0) {
				alert('소셜 로그인된 상태에서는 이메일을 변경할 수 없습니다.')
			}
			else{
				const ModifyPw = document.querySelector('.myPwModify')
				const myPw = document.querySelector('.myPw')
				
				ModifyPw.classList.remove('hidden')
				myPw.classList.add('hidden')
			}
		})
	}

	function MyModifyopen(event) {
		event.target.parentNode.parentNode.classList.add('hidden')
		event.target.parentNode.parentNode.nextElementSibling.classList.remove('hidden')
	}
	function MyModifyclose(event) {
		event.target.parentNode.parentNode.classList.add('hidden')
		event.target.parentNode.parentNode.previousElementSibling.classList.remove('hidden')
		const eventClassInputName = event.target.previousElementSibling.previousElementSibling.firstElementChild.name
		
		switch (eventClassInputName) {
		case 'newEmail':
			const newEmailMsg = document.querySelector('.newEmailMsg')
			const sendModifyEmailBtn = document.querySelector('.sendModifyEmailBtn')
			
			email.value = null
			newEmailMsg.innerText = ''
			sendModifyEmailBtn.style.backgroundColor = 'inherit'
			sendModifyEmailBtn.style.color = '#5D5D5D'
			sendModifyEmailBtn.style.cursor = 'default'
			sendModifyEmailBtn.disabled = true
			break;
			
		case 'newPw':
			const nowPwMsg = document.querySelector('.nowPwMsg')
			const newPwMsg = document.querySelector('.newPwMsg')
			const saveModifyPwBtn = document.querySelector('.saveModifyPwBtn')
			
			nowPw.value = null
			newPw.value = null
			
			nowPwMsg.innerText = ''
			newPwMsg.innerText = ''
			saveModifyPwBtn.style.backgroundColor = 'inherit'
			saveModifyPwBtn.style.color = '#5D5D5D'
			saveModifyPwBtn.style.cursor = 'default'
			saveModifyPwBtn.disabled = true
			break;
		
		case 'newName':
			const newNameMsg = document.querySelector('.newNameMsg')
			const saveModifyNameBtn = document.querySelector('.saveModifyNameBtn')
			name.value = null
			
			newNameMsg.innerText = ''
			saveModifyNameBtn.style.backgroundColor = 'inherit'
			saveModifyNameBtn.style.color = '#5D5D5D'
			saveModifyNameBtn.style.cursor = 'default'
			saveModifyNameBtn.disabled = true
			break;

		default:
			break;
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
	

	

	
	const myProfileModifyReg = function(event) {
		
		// 이메일
		let reg_email =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/
		// 패스워드
		let reg_pw = /^.*(?=^.{8,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		// 이름		
		let reg_name = /^[가-힣]{2,50}$/;
		
		if(event.target.name == 'newEmail') {
			const newEmailMsg = document.querySelector('.newEmailMsg')
			const sendModifyEmailBtn = document.querySelector('.sendModifyEmailBtn')
			// 유효성 체크 false
			if(!check(reg_email,event.target.value)){
				newEmailMsg.innerText = '이메일 주소를 정확히 입력해주세요.'
				sendModifyEmailBtn.style.backgroundColor = 'inherit'
				sendModifyEmailBtn.style.color = 'black'
				sendModifyEmailBtn.style.cursor = 'default'
				sendModifyEmailBtn.disabled = true			
			}
			// 유효성 체크 true
			else if(check(reg_email,event.target.value)) {
				newEmailMsg.innerText = ''
				sendModifyEmailBtn.style.backgroundColor = 'black'
				sendModifyEmailBtn.style.color = 'white'
				sendModifyEmailBtn.style.cursor = 'pointer'
				sendModifyEmailBtn.disabled = false				
			}
		}
		else if(event.target.name == 'nowPw') {
			const nowPwMsg = document.querySelector('.nowPwMsg')
			const saveModifyPwBtn = document.querySelector('.saveModifyPwBtn')
			// 유효성 체크 false
			if(!check(reg_pw,event.target.value)){
				nowPwMsg.innerText = '영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자)'
				saveModifyPwBtn.style.backgroundColor = 'inherit'
				saveModifyPwBtn.style.color = '#5D5D5D'
				saveModifyPwBtn.style.cursor = 'default'
				saveModifyPwBtn.disabled = true
			}
			// 유효성 체크 true
			else if(check(reg_pw,event.target.value)) {
				nowPwMsg.innerText = ''
				if(newPw.value.length > 0 && document.querySelector('.newPwMsg').innerText == '') {
					saveModifyPwBtn.style.backgroundColor = 'black'
					saveModifyPwBtn.style.color = 'white'
					saveModifyPwBtn.style.cursor = 'pointer'
					saveModifyPwBtn.disabled = false				
				}
			}
		}
		else if(event.target.name == 'newPw') {
			const newPwMsg = document.querySelector('.newPwMsg')
			const saveModifyPwBtn = document.querySelector('.saveModifyPwBtn')
			// 유효성 체크 false
			if(!check(reg_pw,event.target.value)){
				newPwMsg.innerText = '영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자)'
				saveModifyPwBtn.style.backgroundColor = 'inherit'
				saveModifyPwBtn.style.color = '#5D5D5D'
				saveModifyPwBtn.style.cursor = 'default'
				saveModifyPwBtn.disabled = true
			}
			// 유효성 체크 true
			else if(check(reg_pw,event.target.value)) {
				newPwMsg.innerText = ''
				if(nowPw.value.length > 0 && document.querySelector('.nowPwMsg').innerText == '') {
					saveModifyPwBtn.style.backgroundColor = 'black'
					saveModifyPwBtn.style.color = 'white'
					saveModifyPwBtn.style.cursor = 'pointer'
					saveModifyPwBtn.disabled = false				
				}
			}
			
		}
		if(event.target.name == 'newName') {
			const newNameMsg = document.querySelector('.newNameMsg')
			const saveModifyNameBtn = document.querySelector('.saveModifyNameBtn')
			// 유효성 체크 false
			if(!check(reg_name,event.target.value)){
				newNameMsg.innerText = '올바른 이름을 입력해주세요. (2-50자)'
				saveModifyNameBtn.style.backgroundColor = 'inherit'
				saveModifyNameBtn.style.color = 'black'
				saveModifyNameBtn.style.cursor = 'default'
				saveModifyNameBtn.disabled = true	
			}
			// 유효성 체크 true
			else if(check(reg_name,event.target.value)) {
				newNameMsg.innerText = ''
				saveModifyNameBtn.style.backgroundColor = 'black'
				saveModifyNameBtn.style.color = 'white'
				saveModifyNameBtn.style.cursor = 'pointer'
				saveModifyNameBtn.disabled = false				
			}
		}
		if(event.target.name == 'authNum' && event.target.value > 0) {
			const authNumSubmitBtn = document.querySelector('.authNumSubmitBtn')
			authNumSubmitBtn.style.backgroundColor = 'black'
			authNumSubmitBtn.style.color = 'white'
			authNumSubmitBtn.style.cursor = 'pointer'
			authNumSubmitBtn.disabled = false	
		}
		
	}
	
	email.oninput = myProfileModifyReg
	nowPw.oninput = myProfileModifyReg
	newPw.oninput = myProfileModifyReg
	name.oninput = myProfileModifyReg
	authNum.oninput = myProfileModifyReg
	
	const newEmailParam = document.querySelector('.newEmailParam')

	const myEmailModifyForm = document.querySelector('.myEmailModifyForm')
	
	myEmailModifyForm.onsubmit = function(event) {
		event.preventDefault()
		
		const newEmail = this.newEmail.value
		newEmailParam.innerText = newEmail
		const url = '${cpath}/my/profile/modifyEmail/checked/' + newEmail + '/'
		const opt = {
				method: 'POST'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				alert('이미 가입된 이메일 아이디입니다.')
			}
			else {
				const url = '${cpath}/my/profile/modifyEmail/' + newEmail +'/'
				const opt = {
						method: 'POST'
				}
				fetch(url, opt)
				.then(resp => resp.text())
				.then(text => {
					if(text.length == 128) {
						alert('이메일 발송이 완료됐습니다.')
						// 인증메일 발송폼
						event.target.parentNode.classList.add('hidden')
						this.newEmail.value = null
						// 인증번호 입력폼
						event.target.parentNode.nextElementSibling.classList.remove('hidden')
					}
					else {
						alert('이메일 발송이 실패했습니다.')
					}
				})
			}
		})
	}
	const myEmailModifyAuthNumForm = document.querySelector('.myEmailModifyAuthNumForm')
	

	const authHandler =  function(event) {
		event.preventDefault()
		const userNumber = event.target.querySelector('input[name="authNum"]')
		
		const url = '${cpath}/getAuthResult/' + userNumber.value + '/' + newEmailParam.innerText + '/${login.email}/'
		const opt = {
				method: 'POST'
		}
		fetch(url, opt).then(resp => resp.text())
		.then(text => {
			if(text == 1){
				location.reload(true)
			}
			else {
				alert('인증 실패')
			}
			newEmailParam.innerText = ''
		})
	}
	myEmailModifyAuthNumForm.onsubmit = authHandler
	
	// 인증번호 입력폼 닫기
	function authNumInputCancel(event) {
		
		event.target.parentNode.parentNode.previousElementSibling.previousElementSibling.classList.remove('hidden')
		event.target.parentNode.parentNode.classList.add('hidden')
	}
	
	
	// 비밀번호 수정
	const myPwModifyForm = document.querySelector('.myPwModifyForm')
	
	myPwModifyForm.onsubmit = function(event) {
		event.preventDefault()
		
		const nowpw = this.nowPw.value
		const newpw = this.newPw.value
		
		console.log(nowpw)
		
		const url = '${cpath}/my/profile/modifyPw/check/' + nowpw + '/'
		const opt = {
				method: 'POST'
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1){
				const url = '${cpath}/my/profile/modifyPw/' + newpw + '/'
				const opt = {
						method: 'POST'
				}
				fetch(url, opt)
				.then(resp => resp.text())
				.then(text => {
					if(text == 1) {
						location.reload(true)
					}
					else {
						alert('비밀번호 변경 실패')
					}
				})
			}
			else {
				alert('기존 비밀번호가 일치하지 않습니다')
			}
		})
	}
	
	
	// 이름 변경
	
	const myNameModifyForm = document.querySelector('.myNameModifyForm')
	myNameModifyForm.onsubmit = function(event) {
		event.preventDefault()
		
		const newName = this.newName.value
		
		const url = '${cpath}/my/profile/modifyName/' + newName + '/'
		const opt = {
				method: 'GET'
		}
		fetch(url, opt).then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				location.reload(true)
			}
			else {
				alert('이름 변경 실패')
			}
		})
	}