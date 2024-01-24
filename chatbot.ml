(* Enhanced Chatbot with a Guess-the-Number Game in OCaml *)

open Random

(* Function to generate responses based on user input *)
let generate_response input =
  match String.lowercase_ascii input with
  | "hello" | "hi" | "hey" -> "Hello there! How can I help you today?"
  | "how are you?" | "what's up?" -> "I'm just a chatbot, but thanks for asking!"
  | "bye" | "goodbye" -> "Goodbye! Have a great day!"
  | "play game" -> "Let's play a game! I'm thinking of a number between 1 and 10. Try to guess it!"
  | _ -> "I'm sorry, I didn't understand that. Can you please rephrase or ask something else?"

(* Function to play the Guess-the-Number game *)
let rec play_game () =
  (* Generate a new random number for each new game *)
  let secret_number = Random.int 10 + 1 in

  let rec guess_loop () =
    print_string "> ";
    flush stdout;

    let user_guess = read_line () in

    if String.lowercase_ascii user_guess = "exit game" then
      "Exiting the game. Goodbye!"
    else
      try
        let guess = int_of_string user_guess in
        if guess = secret_number then
          "Congratulations! You guessed the correct number."
        else if guess < secret_number then begin
          print_endline "Try a higher number. Guess again!";
          guess_loop ()
        end else begin
          print_endline "Try a lower number. Guess again!";
          guess_loop ()
        end
      with
      | Failure _ ->
        print_endline "Invalid input. Please enter a valid number. Guess again!";
        guess_loop ()
  in

  guess_loop ()

(* Main function for the chatbot *)
let rec chatbot () =
  (* Start the conversation *)
  print_endline "Welcome to the Chatbot! Type 'exit' to end the conversation.";
  print_endline "Type 'play game' to start a Guess-the-Number game.";

  let rec conversation_loop () =
    print_string "> ";
    flush stdout;

    let user_input = read_line () in

    if String.lowercase_ascii user_input = "exit" then
      print_endline "Chatbot exiting. Goodbye!"
    else begin
      print_endline (generate_response user_input);

      (* Check if the user wants to play the game *)
      if String.lowercase_ascii user_input = "play game" then begin
        print_endline (play_game ());
        conversation_loop ()
      end else
        conversation_loop ()
    end
  in

  conversation_loop ()

(* Start the chatbot *)
let () = chatbot ()
