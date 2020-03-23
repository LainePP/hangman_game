# Gallows

**Description**
This project intends to provide a http page to play the game hangman.

This is a module, that along with Dictionary, Hangman and TextClient make the experience of playing the Hangman game. 

It was implemented with the purpose of learning along with the course [Elixir for Programmers from Dave Thomas](https://codestool.coding-gnome.com/courses/elixir-for-programmers). 


## Start 
First it is needed the Hangman dependency in your mix file. And the project hangman in the same directory as the gallows directory. 

```elixir
def deps do
  [
    {:hangman, [ path: "../hangman"]}
  ]
end
```

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).


