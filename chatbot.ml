(* Simple Chatbot in OCaml *)

(* Function to generate responses based on user input *)
let generate_response input =
  match String.lowercase_ascii input with
  | "hello" | "hi" | "hey" -> "Hello there! How can I help you today?"
  | "how are you?" | "what's up?" -> "I'm just a chatbot, but thanks for asking!"
  | "bye" | "goodbye" -> "Goodbye! Have a great day!"
  | _ -> "I'm sorry, I didn't understand that. Can you please rephrase or ask something else?"

(* Main function for the chatbot *)
let rec chatbot () =
  (* Prompt the user for input *)
  print_string "> ";
  flush stdout;

  (* Get user input from the console *)
  let user_input = read_line () in

  (* Check if the user wants to exit the chat *)
  if String.lowercase_ascii user_input = "exit" then
    print_endline "Chatbot exiting. Goodbye!"
  else begin
    (* Generate and print the chatbot's response *)
    print_endline (generate_response user_input);

    (* Continue the conversation *)
    chatbot ()
  end

(* Start the chatbot *)
let () =
  print_endline "Welcome to the Chatbot! Type 'exit' to end the conversation.";
  chatbot ()
