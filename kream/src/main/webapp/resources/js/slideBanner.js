const slide = document.querySelector('.slide')
        const content = document.querySelectorAll('.slide li')
        let currentIdx = 0,
        contentCount = content.length,
        contentWidth = content[0].offsetWidth
        prevBtn = document.querySelector('.prev'),
        nextBtn = document.querySelector('.next')

        makeClone()

        function makeClone() {
            for(let i = 0; i < contentCount; i++) {
                let cloneContent = content[i].cloneNode(true)
                cloneContent.classList.add('clone')
                slide.appendChild(cloneContent)
            }
            for(let i = contentCount - 1; i >= 0; i--) {
                let cloneContent = content[i].cloneNode(true)
                cloneContent.classList.add('clone')
                slide.prepend(cloneContent)
            }
            calcWidth()
            setInitialPosition()
            
            setTimeout(function(){
                slide.classList.add('animated')
            })
        }

        function calcWidth() {
            let currentContent = document.querySelectorAll('.slide li')
            let newWidth = currentContent.length * contentWidth
            slide.style.width = newWidth + 'px'
        }

        function setInitialPosition() {
            let initalTranslateValue = -contentWidth * contentCount
            slide.style.transform = 'translateX(' + initalTranslateValue + 'px)'
        }

        nextBtn.onclick = function() {
            moveSlide(currentIdx + 1)
        }

        prevBtn.onclick = function() {
            moveSlide(currentIdx - 1)
        }

        function moveSlide(num) {
            slide.style.left = (-num * contentWidth) + 'px'
            currentIdx = num
            if(currentIdx == contentCount || currentIdx == -contentCount) {
                setTimeout(function(){
                    slide.classList.remove('animated')
                    slide.style.left = '0px'
                    currentIdx = 0;
                },400)
                setTimeout(function(){
                    slide.classList.add('animated')
                },500)
            }
        }

        let timer = undefined

        function autoSlide() {
            if(timer == undefined) {
                timer = setInterval(function(){
                    moveSlide(currentIdx + 1)
                }, 3000)
            }
        }

        autoSlide()

        function stopSlide(){
            clearInterval(timer)
            timer = undefined
        }
        slide.onmouseover = stopSlide
        slide.onmouseout = autoSlide
        prevBtn.onmouseover = stopSlide
        nextBtn.onmouseover = stopSlide