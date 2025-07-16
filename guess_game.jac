import from mtllm.llms { Gemini }

glob llm = Gemini(model_name="gemini-1.5-flash", verbose=False);


"""Generates a random movie or book title and its initial concise description/hint.
   The output is strictly formatted for easy parsing.
"""
def generate_title_and_hint() -> str byllm();

"""Provides a new, different hint for a given movie/book title.
   It avoids repeating information from previous hints and does not reveal the title.
"""
def give_next_hint(correct_title: str, previous_hints: list[str]) -> str byllm();

node game_state {
    has correct_title: str;
    has current_hint: str;
    has given_hints: list[str] = []; # Stores all hints given so far for context
    has max_guesses: int = 5;       # Total number of guesses allowed
    has guesses_made: int = 0;      # Number of guesses made so far
    has high_score: int = 0;         # High score for the game
}

walker GameMaster {
    can start_game with `root entry;
}

walker GuessProcessor {
    can process_guess with game_state entry;
}

with entry{
    print("Welcome to the Movie/Book Title Guessing Game!");
    root spawn GameMaster();
}