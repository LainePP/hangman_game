defmodule Proc do
  def greeter(count) do
    receive do
      {:add, n} ->
        greeter(count+n)
      :reset ->
        greeter(0)
      {what_to_say, msg} ->
        IO.puts "#{count} #{inspect what_to_say}: #{inspect msg}"
    end
    greeter(count)
  end
end
