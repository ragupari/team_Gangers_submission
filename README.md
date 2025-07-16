# 🎬 Team Gangers - Movie Charades Game
🎉 **Charades** is a classic guessing game where players try to identify a hidden movie by asking clever yes/no questions. In this AI-powered version, you'll go head-to-head with a smart Game Master to figure out.

**Here is an example terminal game snipet:**
```
(.venv) pari07@Parishiths-MacBook-Air jac % jac run charades.jac
🎬 Welcome to the Movie Guessing Game!
👋 I will provide you with a movie title and an initial hint.
❓ You can ask yes/no questions or guess the movie directly.
📝 You have a maximum of 10 guesses to find the movie.
🏆 Let's see if you can guess the movie correctly!

🎬 Initializing your game session... Please wait while I prepare your first clue.
💡 Here’s your movie hint:
📘 Animated tale about toys coming to life when humans aren't around.
❓ Ask a yes/no question or guess the movie directly (type 'quit' to exit): is it made by Disney studios
💬 GameMaster: Yes
❓ Ask a yes/no question or guess the movie directly (type 'quit' to exit): Toy story
🎉 Excellent! You've guessed the movie correctly: 🎬 'Toy Story'
\n🏁 Game Over – You Win!
🎯 Final Score: 120
🏆 High Score: 120

🔁 Would you like to play another round? (yes/no): yes

🔄 Starting a new game...
💡 Here’s your movie hint:
📘 A great white terrorizes a small beach town.
❓ Ask a yes/no question or guess the movie directly (type 'quit' to exit): is this related to animals
💬 GameMaster: Yes – The movie involves animals.
❓ Ask a yes/no question or guess the movie directly (type 'quit' to exit): is it scary
💬 GameMaster: Yes
❓ Ask a yes/no question or guess the movie directly (type 'quit' to exit): Jaws
🎉 Excellent! You've guessed the movie correctly: 🎬 'Jaws'
\n🏁 Game Over – You Win!
🎯 Final Score: 120
🏆 High Score: 120

🔁 Would you like to play another round? (yes/no): yes

🔄 Starting a new game...
💡 Here’s your movie hint:
📘 An elderly man fulfills a lifelong dream by tying thousands of balloons to his house and flying to South America.
❓ Ask a yes/no question or guess the movie directly (type 'quit' to exit): is it super hero movie like spideman
💬 GameMaster: No – The movie is not a superhero movie.
❓ Ask a yes/no question or guess the movie directly (type 'quit' to exit): is it for kids?
💬 GameMaster: Yes
❓ Ask a yes/no question or guess the movie directly (type 'quit' to exit): Cindrella
❌ Incorrect guess. You have 9 guesses remaining.
❓ Ask a yes/no question or guess the movie directly (type 'quit' to exit): is it released after 2020
💬 GameMaster: No
❓ Ask a yes/no question or guess the movie directly (type 'quit' to exit): my guess is UP
🎉 Excellent! You've guessed the movie correctly: 🎬 'Up'
\n🏁 Game Over – You Win!
🎯 Final Score: 90
🏆 High Score: 120

🔁 Would you like to play another round? (yes/no): no

🎬 Thank you for playing the Movie Guessing Game! See you next time.
(.venv) pari07@Parishiths-MacBook-Air jac % 
```

---

## 📦 Setup Instructions

Follow these steps to set up and run the project:

### 1. Clone the Repository

```bash
git clone https://github.com/ragupari/team_Gangers_submission.git
cd team_Gangers_submission
```

### 2. Create and Activate Python 3.12 Virtual Environment

#### On macOS/Linux:
```bash
python3.12 -m venv venv
source venv/bin/activate
```

#### On Windows:
```cmd
python -m venv venv
venv\Scripts\activate
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Export OpenAI API Key

Replace `your-api-key-here` with your actual API key.

#### On macOS/Linux:
```bash
export OPENAI_API_KEY="your-api-key-here"
```

#### On Windows (Command Prompt):
```cmd
set OPENAI_API_KEY="your-api-key-here"
```

#### On Windows (PowerShell):
```powershell
$env:OPENAI_API_KEY="your-api-key-here"
```

### 5. Run the Game

```bash
jac run charades.jac
```

---

## 🎮 How to Play

- The game starts when the Game Master (powered by OpenAI) selects a **very famous movie**.
- You'll receive an **initial hint** to help you begin.
- You can then:
  - Ask **yes/no** questions to gather clues.
  - Or try to **guess the exact movie name** at any time.
- You have a **maximum of 10 attempts** to guess the correct movie.
- **Each wrong guess** (not a question) will reduce your remaining attempts.
- If you guess the movie correctly:
  - You **win**, and your **score is higher** the fewer guesses you used.
- If you run out of attempts without guessing the movie:
  - It’s **game over**.
- You can type `"quit"` at any time to exit the game.

🧠 Think smart, ask clever questions, and enjoy the game!
