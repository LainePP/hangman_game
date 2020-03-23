# Hangman

**Description**
This project intends to provide all the logic needed to play the game hangman.

This is a module, that along with Dictionary, TextClient and Gallows make the experience of playing the Hangman game. 

It was implemented with the purpose of learning along with the course [Elixir for Programmers from Dave Thomas](https://codestool.coding-gnome.com/courses/elixir-for-programmers). 


## Installation
First it is needed the Hangman dependency in your mix file. And the project dictionary in the same directory as the hangman directory. 

```elixir
def deps do
  [
    { :dictionary, path: "../dictionary"},
  ]
end
```