document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.getElementById('login-form');
    const errorMessage = document.getElementById('error-message');
    const quizLink = document.getElementById('quiz-link');
  
    loginForm.addEventListener('submit', (e) => {
        e.preventDefault();
        
        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
  
        // Simple authentication (replace with your actual authentication logic)
        if (username === 'admin' && password === 'password') {
            errorMessage.textContent = '';
            loginForm.style.display = 'none';
            quizLink.style.display = 'block';
            quizLink.href = 'home.html'; // Replace with your actual quiz home page URL
        } else {
            errorMessage.textContent = 'Invalid username or password';
        }
        if (username === 'user' && password === 'password1') {
            errorMessage.textContent = '';
            loginForm.style.display = 'none';
            quizLink.style.display = 'block';
            quizLink.href = 'user-home-page.html'; // Replace with your actual quiz home page URL
        } else {
            errorMessage.textContent = 'Invalid username or password';
        }
    });
  });