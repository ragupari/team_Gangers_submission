# 🎬 Team Gangers - Movie Charades Game
🎉 **Charades** is a classic guessing game where players try to identify a hidden movie by asking clever yes/no questions. In this AI-powered version, you'll go head-to-head with a smart Game Master to figure out.

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
