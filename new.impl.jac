impl GameMaster.start_game {
    print("Please wait while I generate your first hint...");



    current_game_state = root ++> game_state(
    );
    parsed = parsed_generate_title_and_hint(current_game_state[0].movie_list);
    current_game_state[0].movie_name=parsed["Title"];
    current_game_state[0].movie_list=[parsed["Title"]];

    if not current_game_state {
        print("❌ Failed to create game state. Aborting.");
        return;
    }
    print(current_game_state[0].movie_list);
    print("Here is your hint for your movie: \n" + parsed["Hint"], parsed["Title"]);

    visit current_game_state spawn GuessProcessor();
}

impl GuessProcessor.process_guess {

    if here.guesses_made < here.max_guesses and not here.won {
        question = input("Ask a yes or no question about the movie: ");
        if question.strip() == "quit"{
            print("Exiting the game. Thank you for playing!");
            print("Correct movie was: " + here.movie_name);
            visit here spawn GameOver();
        }
           
        parsed = parsed_ask_yes_no_question(here.movie_name, question);

        # Handle correct guess
        if parsed["answer"] == "CORRECT" {
            print(f"🎉 Congratulations! You guessed correctly: '{here.movie_name}'");
            here.won = True;
            visit here spawn GameOver();
        }

        # Handle guess attempts
        elif "guess_attempt" in parsed and parsed["guess_attempt"] {
            here.guesses_made += 1;
            print(f"❌ Incorrect guess! You have {here.max_guesses - here.guesses_made} guesses remaining.");

            if here.guesses_made >= here.max_guesses {
                print("💀 Game Over! You've used all your guesses.");
                print(f"The correct answer was: '{here.movie_name}'");
                visit here spawn GameOver();
            } else {
                visit here;
            }
        }

        # Handle yes/no questions
        elif parsed["answer"] == "Yes" or parsed["answer"] == "No" {

            print(f"💬 GameMaster: {parsed['answer']}, {parsed['message']}");

            visit here;
        }

        # Handle unexpected response
        else {
            print("⚠️ Invalid response. Please ask a yes/no question or make a guess.");
            visit here;
        }
    } else {
        print("🛑 Game already won or maximum guesses reached.");
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

        print("Your final score is: " + str(score));
        print("Your high score is: " + str(here.high_score));
    } else {
        print("😢 Better luck next time!");
    }
    play_again = input("Would you like to start a new match? (yes/no): ").strip().lower();
    if play_again == "yes" {
           visit here spawn GameMaster();
    }
    else {
        print("Thank you for playing the Movie Guessing Game!");
        exit(0);
    }

    exit(0);
}

impl GameMaster.new_game {
    print("Here we go again! Starting a new game...");
    
    parsed = parsed_generate_title_and_hint(here.movie_list);
    here.movie_list.append(parsed["Title"]);
    here.movie_name = parsed["Title"];
    here.guesses_made = 0;
    here.won = False;
    print(here.movie_list);
    print("Here is your hint for your movie: \n" + parsed["Hint"]);

    visit here spawn GuessProcessor();
}
