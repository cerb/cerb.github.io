document.addEventListener("DOMContentLoaded", function() {
    const $form = document.getElementById('demo-signup');
    const $demo_status = document.getElementById('demo-status');
    
    $form.addEventListener('submit', function(e) {
        e.stopPropagation();
        e.preventDefault();
        
        const $email = $form.querySelector('[name=contact]')
        const email = $email.value;
        
        let formData = new FormData();
        formData.set('email', email);
        
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "https://form.cerb.ai/signup", true);
        xhr.responseType = "json";
        
        xhr.onload = function() {
            if (
                xhr.status === 200
                && 'json' === xhr.responseType
                && xhr.response.hasOwnProperty('success')
            ) {
                $form.remove();
                $demo_status.innerText = xhr.response.success;
                
            } else if (
                xhr.status === 200
                && 'json' === xhr.responseType
                && xhr.response.hasOwnProperty('error')
            ) {
                $demo_status.innerText = xhr.response.error;
            } else {
                $demo_status.innerText = 'An unexpected error occurred. Please try again.';
            }
        };
        
        xhr.onerror = function() {
            $demo_status.innerText = 'An unexpected error occurred. Please try again.'
        };
        
        xhr.send(formData);
        
        return false;
    });
});