(* chatbot.ml *)

open Random

(* ... existing code ... *)

(* Function to play the Guess-the-Number game *)
let rec play_game () =
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

(* ... existing code ... *)

(* Function to generate a response based on user input *)
let generate_response input =
  (* Your implementation here based on the chatbot's logic *)
  "This is a placeholder response. Implement your logic here."

(* ... existing code ... *)

(* Start the chatbot *)
let () =
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

(* ... existing code ... *)