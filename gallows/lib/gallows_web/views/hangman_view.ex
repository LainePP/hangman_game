defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view

  import Gallows.Views.Helpers.GameStateHelper

  def new_game_button(conn) do
    button("New Game", to: GallowsWeb.Router.Helpers.hangman_path(conn, :create_game) )
  end

  def letters(tally) do
    tally.letters |> Enum.join(" ")
  end

  def letters_guessed(tally) do
    tally.letters_guessed |> Enum.join(" ")
  end
  def turn(left, target) when target >= left do
    "opacity: 1"
  end

  def turn(_left, _target) do
    "opacity: 0.1"
  end
end
