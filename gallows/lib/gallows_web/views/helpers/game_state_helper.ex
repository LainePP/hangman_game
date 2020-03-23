defmodule Gallows.Views.Helpers.GameStateHelper do

  import Phoenix.HTML, only: [raw: 1]

  @responses %{
    :won => {:success, "Congratulations, you Won!"},
    :lost => {:danger, "Sorry, you Lost!"},
    :good_guess => {:primary, "Good guess, keep going!"},
    :bad_guess => {:warning, "Bad guess!"},
    :already_used => {:info, "You already guessed that!"},
  }

  def game_over?(%{ game_state: game_state} ) do
    game_state in [:won, :lost]
  end

  def game_state(state) do
    @responses[state]
    |> alert()
  end

  defp alert(nil), do: ""
  defp alert({class, msg}) do
    """
    <div class="alert alert-#{class}" role="alert">
      #{msg}
    </div>
    """
    |> raw()
  end
end
