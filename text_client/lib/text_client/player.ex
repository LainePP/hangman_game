defmodule TextClient.Player do
  alias TextClient.{State, Summary, Prompter, Mover}

  def play(_game = %State{tally: %{ game_state: :won }}) do
    exit_with_message("Congrats, You WON!")
  end

  def play(game = %State{tally: %{ game_state: :lost }}) do
    exit_with_message("Sorry, You LOST! \nThe word was #{game.game_service.letters}")
  end

  def play(game = %State{tally: %{ game_state: :good_guess }}) do
    continue_with_message("Good Guess", game)
  end

  def play(game = %State{ tally: %{ game_state: :bad_guess }}) do
    continue_with_message("Sorry, that isn in the word!", game)
  end

  def play(game = %State{ tally: %{ game_state: :already_used }}) do
    continue_with_message("You've already tried this letter", game)
  end

  def play(game) do
    continue(game)
  end

  defp continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_moves()
    |> Mover.make_move()
    |> play()
  end

  defp continue_with_message(msg, game) do
    IO.puts(msg)
    continue(game)
  end

  defp exit_with_message(msg) do
    IO.puts(msg)
    exit(:normal)
  end
end
