# TextClient

**Description**

This project intends to provide a console interface to play the game hangman.

This is a module, that along with Dictionary, Hangman and Gallows make the experience of playing the Hangman game. 

It was implemented with the purpose of learning along with the course [Elixir for Programmers from Dave Thomas](https://codestool.coding-gnome.com/courses/elixir-for-programmers). 

## Installation

First it is needed the Hangman dependency in your mix file. And the project hangman in the same directory as the gallows directory. 

```elixir
def deps do
  [
    {:hangman, [ path: "../hangman"]}
  ]
end
```

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `text_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:text_client, "~> 0.1.0"}
  ]
end
```

