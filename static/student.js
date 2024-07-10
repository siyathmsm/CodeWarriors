let timeRemaining;
let progress = 0; // Initial progress value, can be fetched from the backend

function startCountdown() {
    const countdownElement = document.getElementById('time');
    const interval = setInterval(() => {
        if (timeRemaining <= 0) {
            clearInterval(interval);
            alert("Time's up!");
            submitActivity();
        } else {
            timeRemaining--;
            const minutes = Math.floor(timeRemaining / 60);
            const seconds = timeRemaining % 60;
            countdownElement.textContent = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
        }
    }, 1000);
}

function updateProgress(newProgress) {
    const progressElement = document.getElementById('progress');
    const progressTextElement = document.getElementById('progress-text');
    
    progress = newProgress;
    progressElement.style.width = `${progress}%`;
    progressTextElement.textContent = `Progress: ${progress}%`;
}

function submitActivity() {
    // Here you would handle the submission logic, e.g., save to the database
    
    // Example of updating progress after activity submission
    const newProgress = Math.min(progress + 10, 100); // Increment progress by 10%
    updateProgress(newProgress);

    alert("Activity submitted!");
    window.location.href = 'lecture.html'; // Redirect back to lecture
}

function fetchActivity() {
    fetch('/api/activity')
        .then(response => response.json())
        .then(data => {
            const activityContainer = document.getElementById('activity-container');
            document.getElementById('activity-title').textContent = data.activity_name;
            timeRemaining = data.time_limit * 60; // Convert minutes to seconds
            startCountdown();

            data.questions.forEach((question, index) => {
                const questionDiv = document.createElement('div');
                questionDiv.innerHTML = `
                    <h2>Question ${index + 1}</h2>
                    <p>${question.question}</p>
                    ${generateOptions(question)}
                `;
                activityContainer.appendChild(questionDiv);
            });
        });
}

function generateOptions(question) {
    if (question.type === 'mcq') {
        return `
            <ul>
                ${question.options.map((option, index) => `
                    <li><input type="radio" name="q${question.question_id}" value="${option}"> ${option}</li>
                `).join('')}
            </ul>
        `;
    } else if (question.type === 'fill_in_blanks') {
        return `<input type="text" name="q${question.question_id}" placeholder="Fill in the blank">`;
    } else if (question.type === 'short_answer') {
        return `<textarea name="q${question.question_id}" rows="4" cols="50" placeholder="Type your answer here"></textarea>`;
    }
    return '';
}

document.addEventListener('DOMContentLoaded', (event) => {
    fetchActivity();
    updateProgress(progress); // Initialize the progress bar
});
