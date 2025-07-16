# mt_poem.jac - Simple AI integration
import from mtllm { Model }

import json;


glob llm = Model(model_name="gpt-4.1-mini");

"""
A movie_name will be selected by the system.  
The user can ask only yes/no questions to guess the movie.

You must respond with one of the following values for "answer":
- "Yes"
- "No"
- "CORRECT" (only if the user guesses the exact movie name)

Respond strictly in **valid JSON format** as follows:
{
  "answer": "Yes" | "No" | "CORRECT",
  "guess_attempt": true | false,  if true if the user is making a guess, false if asking a question,
  "found": true | false,
  "message": "A brief optional message for the user. This could congratulate the user, explain that the guess was incorrect, clarify the question wasn't understood, or indicate it wasn't a yes/no question."
}

Do not include any extra commentary, explanation, or text outside the JSON object.
By any chance, do not directly reveal the movie name in your response.
"""
def ask_yes_no_question(movie_name: str, question: str) -> str by llm();
def parsed_ask_yes_no_question(movie_name: str, question: str){
    response = ask_yes_no_question(movie_name, question);
    parsed = json.loads(response);
    
    # Ensure the response is valid JSON
    if not parsed or not isinstance(parsed, dict){
        raise ValueError("Invalid JSON response from AI. Please check the AI's output format.");
    }
    return parsed;
}

"""Generates a very famous easy movie with title less than 4 word couunt and not in movie_list and its initial concise description/hint.
   The output is strictly formatted for easy parsing.
    The format is:{
        "Title": "movie_name",
        "Hint": "initial_hint"
    }
    By any chance, do not directly reveal the movie name in your response.
"""
def generate_title_and_hint(movie_list: list[str]) -> str by llm();

def parsed_generate_title_and_hint(movie_list: list[str]){
    response = generate_title_and_hint(movie_list);
    parsed = json.loads(response);
    
    # Ensure the response is valid JSON
    if not parsed or not isinstance(parsed, dict){
        raise ValueError("Invalid JSON response from AI. Please check the AI's output format.");
    }
    return parsed;
}

node game_state {
    has movie_name: str = "";
    has guesses_made: int = 0;
    has max_guesses: int = 10;
    has won: bool = False;
    has high_score: int = 0;         # High score for the game
    has movie_list: list[str] = []; # List of movies for the game
}

walker GameMaster {
   

    can start_game with `root entry;
    can new_game with game_state entry;
}

walker GuessProcessor {
    can process_guess with game_state entry;
}

walker GameOver {
    can end_game with game_state entry;
}


with entry {
    root spawn GameMaster();
}
