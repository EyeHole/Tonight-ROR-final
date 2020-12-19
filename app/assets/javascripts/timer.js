function redirect_timer(count) {
    let delay = 10;
    let output = document.querySelector('.time-left');

    if (output) {
        let timer = setInterval(function() {
                output.textContent = --delay;
                if (!delay) {
                    clearInterval(timer);
                    window.location.href = "/events/";
                }
            }, 1000);
        output.textContent = delay;
    }
    else {
        count.c_stop++;
        if (count.c_stop < 5) {
            setTimeout(redirect_timer(count), 1000);
        }
    }
}

window.onload = function() {
    let count = {c_stop: 0};
    console.log(count.c_stop);
    redirect_timer(count);
};