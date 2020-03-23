defmodule TextClient.Interact do
  @hangman_server :"hangman_server@laine-Aspire-F5-573G"

  alias TextClient.{State, Player}

  def start() do
    new_game()
    |> setup_state()
    |> Player.play()
  end

  defp setup_state(game) do
    %State{
      game_service: game,
      tally: Hangman.tally(game)
    }
  end

  defp new_game() do
    :rpc.call(@hangman_server, Hangman, :new_game, [])
  end
end
