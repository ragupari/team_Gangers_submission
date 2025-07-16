impl GameMaster.start_game {
    print("🎬 Welcome to the Movie Guessing Game!");
    print("👋 I will provide you with a movie title and an initial hint.");
    print("❓ You can ask yes/no questions or guess the movie directly.");
    print("📝 You have a maximum of 10 guesses to find the movie.");
    print("🏆 Let's see if you can guess the movie correctly!\n");

    print("🎬 Initializing your game session... Please wait while I prepare your first clue.");

    current_game_state = root ++> game_state();

    parsed = parsed_generate_title_and_hint(current_game_state[0].movie_list);
    current_game_state[0].movie_name = parsed["Title"];
    current_game_state[0].movie_list = [parsed["Title"]];

    if not current_game_state {
        print("❌ Unable to initialize game state. Please try again.");
        return;
    }

    print("💡 Here’s your movie hint:\n📘 " + parsed["Hint"]);

    visit current_game_state spawn GuessProcessor();
}

impl GuessProcessor.process_guess {
    if here.guesses_made < here.max_guesses and not here.won {
        question = input("❓ Ask a yes/no question or guess the movie directly (type 'quit' to exit): ");
        
        if question.strip() == "quit" {
            print("🚪 Exiting the game. Thanks for playing!");
            print("🎯 The correct movie was: 🎞️ " + here.movie_name);
            visit here spawn GameOver();
        }

        parsed = parsed_ask_yes_no_question(here.movie_name, question);

        # Correct guess
        if parsed["answer"] == "CORRECT" {
            print(f"🎉 Excellent! You've guessed the movie correctly: 🎬 '{here.movie_name}'");
            here.won = True;
            visit here spawn GameOver();
        }

        # Guess attempt
        elif "guess_attempt" in parsed and parsed["guess_attempt"] {
            here.guesses_made += 1;
            remaining = here.max_guesses - here.guesses_made;
            print(f"❌ Incorrect guess. You have {remaining} guess{'' if remaining == 1 else 'es'} remaining.");

            if here.guesses_made >= here.max_guesses {
                print("💀 You've exhausted all your guesses.");
                print(f"🎯 The correct answer was: '{here.movie_name}'");
                visit here spawn GameOver();
            } else {
                visit here;
            }
        }

        # Yes/No response
        elif parsed["answer"] == "Yes" or parsed["answer"] == "No" {
            print(f"💬 GameMaster: {parsed['answer']} – {parsed['message']}");
            visit here;
        }

        # Unexpected response
        else {
            print("⚠️ I didn’t understand that. Please ask a valid yes/no question or make a guess.");
            visit here;
        }
    } else {
        print("🛑 Game over! Either you’ve won or used all your guesses.");
        visit here spawn GameOver();
    }
}

impl GameOver.end_game {
    if here.won {
        score = 100 - (10 * here.guesses_made);
        if here.guesses_made == 0 {
            score += 20;
        } elif here.guesses_made == 10 {
            score += 1;
        }
        here.high_score = max(here.high_score, score);

        print(f"\n🏁 Game Over – You Win!");
        print(f"🎯 Final Score: {score}");
        print(f"🏆 High Score: {here.high_score}");
    } else {
        print("\n📉 Game Over – Better luck next time!");
    }

    play_again = input("\n🔁 Would you like to play another round? (yes/no): ").strip().lower();
    
    if play_again == "yes" {
        visit here spawn GameMaster();
    } else {
        print("\n🎬 Thank you for playing the Movie Guessing Game! See you next time.");
        exit(0);
    }

    exit(0);
}

impl GameMaster.new_game {
    print("\n🔄 Starting a new game...");

    parsed = parsed_generate_title_and_hint(here.movie_list);
    here.movie_list.append(parsed["Title"]);
    here.movie_name = parsed["Title"];
    here.guesses_made = 0;
    here.won = False;

   print("💡 Here’s your movie hint:\n📘 " + parsed["Hint"]);

    visit here spawn GuessProcessor();
}
