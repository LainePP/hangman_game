defmodule Hangman.Game do
  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters:    [],
    used:       MapSet.new()
  )
  def new_game(word) do
    %Hangman.Game{
      letters: word |> String.codepoints
  }
  end

  def new_game(), do: new_game(Dictionary.random_word)


  def tally(game) do
    %{
      game_state: game.game_state,
      turns_left: game.turns_left,
      letters: game.letters |> reveal_guessed(game.used),
      letters_guessed: game.used
    }
  end

  def make_move(game = %{game_state: state}, _letter_guess) when state in [:won, :lost] do
    game
    |> return_with_tally
  end

  def make_move(game, letter_guess) do
    accept_move(game, letter_guess, MapSet.member?(game.used, letter_guess), validate_single_lowercase(letter_guess))
    |> return_with_tally
  end

  ##########################################################################################
  # Private Functions

  defp return_with_tally(game), do: {game, tally(game)}

  defp validate_single_lowercase(guess) do
    guess == String.downcase(guess, :ascii)
  end

  defp accept_move(game, _letter_guess, _already_guessed=true, _valid_string) do
    Map.put(game, :game_state, :already_used)
  end

  defp accept_move(game, _letter_guess, _already_guessed, _invalid_guess=false) do
    Map.put(game, :game_state, :invalid_string)
  end

  defp accept_move(game, letter_guess, _already_guessed, _valid_guess = true) do
    Map.put(game, :used, MapSet.put(game.used, letter_guess))
    |> score_guess(Enum.member?(game.letters, letter_guess))
  end

  defp score_guess(game, _good_guess=true) do
    new_state = MapSet.new(game.letters)
    |> MapSet.subset?(game.used)
    |> maybe_won()
    Map.put(game, :game_state, new_state)
  end

  defp score_guess(game = %{turns_left: 1 }, _bad_guess) do
    %{ game |
      turns_left: 0,
      game_state: :lost
      }
  end

  defp score_guess(game = %{turns_left: turns_left }, _bad_guess) do
    %{ game |
      turns_left: turns_left - 1,
      game_state: :bad_guess
      }
  end
  def maybe_won(true), do: :won
  def maybe_won(_), do: :good_guess

  defp reveal_guessed(letters, used) do
    letters |> Enum.map(fn letter -> reveal_letter(letter, MapSet.member?(used, letter)) end )
  end

  defp reveal_letter(letter, _in_word = true), do: letter
  defp reveal_letter(_letter, _not_in_word), do: "_"

end
