(* test.ml *)

open OUnit2
open Chatbot

let test_play_game_guess_correct_number _ =
  let result = play_game () in
  assert_equal "Congratulations! You guessed the correct number." result

let test_play_game_exit_game _ =
  (* Simulate the user entering "exit game" *)
  let result = play_game () in
  assert_equal "Exiting the game. Goodbye!" result

let suite =
  "suite" >::: [
    "test_play_game_guess_correct_number" >:: test_play_game_guess_correct_number;
    "test_play_game_exit_game" >:: test_play_game_exit_game;
  ]

let () =
  run_test_tt_main suite