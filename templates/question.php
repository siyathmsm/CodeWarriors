<?php
// Database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "code_warriors";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the question type from the URL
$question_type = isset($_GET['type']) ? $_GET['type'] : 'type1';

// Fetch questions for the specified type from the database
$sql = "SELECT q1, q2, q3, q4, q5 FROM owa WHERE questiontype = ?";
$stmt = $conn->prepare($sql);
if ($stmt) {
    $stmt->bind_param("s", $question_type);
    $stmt->execute();
    $result = $stmt->get_result();
    $questions = $result->fetch_assoc();
    $stmt->close();
} else {
    die("Database query failed: " . $conn->error);
}

$conn->close();
?>

<div class="container" id="question-container">
    <h2>Questions and Answers</h2>
    <?php if (!empty($questions)): ?>
        <form id="questions-form" action="submit_answers.php" method="post">
            <input type="hidden" name="question_type" value="<?php echo htmlspecialchars($question_type); ?>">
            <?php foreach ($questions as $key => $question): ?>
                <?php if (strpos($key, 'q') === 0 && !empty($question)): ?>
                    <div class="question">
                        <p><?php echo htmlspecialchars($question); ?></p>
                        <input type="text" name="answers[<?php echo $key; ?>]" class="answer-input" required>
                    </div>
                <?php endif; ?>
            <?php endforeach; ?>
            <button type="submit">Submit Answers</button>
        </form>
    <?php else: ?>
        <p>No questions found for this type.</p>
    <?php endif; ?>
    <a href="analytics.html">Back to question types</a>
</div>

<script>
    // Countdown timer
    let timeLeft = 120;
    const timerElement = document.getElementById('timer');
    const questionContainer = document.getElementById('question-container');

    function updateTimer() {
        const minutes = Math.floor(timeLeft / 60);
        const seconds = timeLeft % 60;
        timerElement.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;

        if (timeLeft > 0) {
            timeLeft--;
        } else {
            clearInterval(timerInterval);
            questionContainer.style.display = 'none';
            alert('Time is up!');
        }
    }

    const timerInterval = setInterval(updateTimer, 1000);

    // Update progress bar based on answered questions
    const form = document.getElementById('questions-form');
    const progressBar = document.getElementById('progress-bar');
    const inputs = document.querySelectorAll('.answer-input');
    const totalQuestions = inputs.length;

    form.addEventListener('input', () => {
        let answered = 0;
        inputs.forEach(input => {
            if (input.value.trim() !== '') {
                answered++;
            }
        });
        const progress = (answered / totalQuestions) * 100;
        progressBar.style.width = `${progress}%`;
    });
</script>