window.onload = function() {
    [...document.querySelectorAll('.press')].forEach(btn => {
        btn.addEventListener('click', function() {
        if (this.parentNode.style.height == '120px') {
            // console.log("was block");
            this.parentNode.children[0].innerText = "Show description";
            this.parentNode.children[1].style.height = '0px';
            this.parentNode.style.height = '20px';
        }
        else {
            // console.log("was none");
            this.parentNode.children[0].innerText = "Close description";
            this.parentNode.children[1].style.height = '80px';
            this.parentNode.style.height = '120px';
        }
    
        })
    });
}