# Chatbot with Guess-the-Number Game

Welcome to the Chatbot repository! This OCaml project provides a simple chatbot that engages in conversation and includes a Guess-the-Number game. Users can interact with the chatbot, receive responses, and play the game.

## Getting Started

### Prerequisites

Make sure you have OCaml and the OUnit2 testing framework installed on your system.

### Running the Chatbot

- Clone the repository:

        git clone https://github.com/NIXBLACK11/assignmentLFX.git
        cd chatbot-ocaml

- Compile and run the chatbot:

        ocamlc -o chatbot chatbot.ml
        ./chatbot

- Follow the on-screen instructions to interact with the chatbot. Type 'exit' to end the conversation or 'play game' to start the Guess-the-Number game.

### Running Tests

To run the test suite:

        ocamlc -o test_chatbot -I +ounit2 -I . chatbot.ml test.ml
        ./test_chatbot

## Project Structure

- chatbot.ml: Main implementation of the chatbot and the Guess-the-Number game.
- test.ml: Test cases for the chatbot functions.
- Makefile: A Makefile for building the project.