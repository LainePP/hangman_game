defmodule Hangman do

  def new_game() do
    { :ok, pid } = Supervisor.start_child(Hangman.Supervisor, [])
    IO.inspect Supervisor.count_children(Hangman.Supervisor).workers
    IO.inspect(Node.list)
    pid
  end

  def tally(game_pid) do
    GenServer.call(game_pid, { :tally })
  end
  @spec make_move(atom | pid | {atom, any} | {:via, atom, any}, any) :: any
  def make_move(game_pid, guess) do
    GenServer.call(game_pid, { :make_move, guess })
  end
end
