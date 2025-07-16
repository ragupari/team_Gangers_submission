impl GameMaster.start_game {


    print("Please wait while I generate your first hint...");
    llm_output = generate_title_and_hint();
    
    correct_title_val = "";
    initial_hint_val = "";
    
    lines = llm_output.split('\n');
    for line in lines{
        if line.startswith("Title:"){
            correct_title_val = line.split(':', 1)[1].strip();
        }
        elif line.startswith("Hint:"){
            initial_hint_val = line.split(':', 1)[1].strip();
        }
    }

    if (not correct_title_val or not initial_hint_val) { 
        print("Error: Could not generate a valid title and hint from LLM. Please try again.");
        disengage; 
        return;
    }

    current_game_state = root ++> game_state(
        correct_title=correct_title_val,
        current_hint=initial_hint_val,
        given_hints=[initial_hint_val] # Store the first hint
    );
    
    print("\n--- Your First Hint ---");
    print(current_game_state.current_hint);
    
 
    visit current_game_state spawn GuessProcessor();
}

impl GuessProcessor.process_guess {
    user_guess = input("\nWhat's your guess? (Enter the full title): ").strip();
    here.guesses_made += 1;

    if user_guess.lower() == here.correct_title.lower(){
        print(f"\n Congratulations! You guessed correctly: '{here.correct_title}' ");
        disengage; # End the game
    }
    elif here.guesses_made >= here.max_guesses{
        print(f"\nGame Over! You've used all your guesses.");
        print(f"The correct answer was: '{here.correct_title}'");
        disengage; # End the game
    }
    else {
        print("\nIncorrect guess. Please wait for another hint...");
        new_hint = give_next_hint(here.correct_title, here.given_hints);
        
        here.current_hint = new_hint;
        here.given_hints.append(new_hint); 

        print("\n--- Here's another hint ---");
        print(here.current_hint);

        visit here; 
    }
}