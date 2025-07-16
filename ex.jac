"""A Number Guessing Game"""

import random;


obj Game {
    has no_of_guesses: int = 0, no_of_hints: int = 3, won: bool = False; 

    def play {
        raise NotImplementedError("Subclasses must implement this method.");
    }
}


obj GuessTheNumberGame (Game) {
    has movie_name: str = "Guess the Number";

    def play {
        while self.no_of_guesses < 10 {
            guess = input("Guess a number between 1 and 10: ");
                self.process_guess(str(guess));
                if self.won {
                    break;
                }
        }
        if not self.won {
            print("Sorry, you didn't guess the number. Better luck next time!");
        }
    }

    def process_guess(guess: str) {
        if guess == self.movie_name {
            print("You guessed the movie name correctly!");
            self.won = True;
            return;
        }
        print("Incorrect guess. Try again!");
        self.no_of_guesses += 1;
        print(f"You have {10 - self.no_of_guesses} attempts left.");
    }
}


# Run the game
with entry {
    game = GuessTheNumberGame();
    game.play();
}