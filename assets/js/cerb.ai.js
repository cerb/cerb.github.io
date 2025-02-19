window.addEventListener('load', function () {
    // Credit: https://remarkablemark.org/blog/2021/06/01/add-copy-code-to-clipboard-button-to-jeyll-site/
    let codeBlocks = document.querySelectorAll('figure.highlight');
    
    codeBlocks.forEach(function (codeBlock) {
        let copyButton = document.createElement('button');
        copyButton.className = 'copy';
        copyButton.type = 'button';
        copyButton.ariaLabel = 'Copy code to clipboard';
        copyButton.innerText = 'Copy';
        
        codeBlock.append(copyButton);
        
        copyButton.addEventListener('click', function () {
            let code;
            
            // Handle code blocks with line numbers
            if(codeBlock.querySelector('.rouge-table')) {
                code = codeBlock.querySelector('.code > pre').innerText.trim();
            } else {
                code = codeBlock.querySelector('code').innerText.trim();
            }
            
            window.navigator.clipboard.writeText(code);
            
            copyButton.innerText = 'Copied';
            let fourSeconds = 4000;
            
            setTimeout(function () {
                copyButton.innerText = 'Copy';
            }, fourSeconds);
        });
    });
});