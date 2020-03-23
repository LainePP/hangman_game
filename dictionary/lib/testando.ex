defmodule Testando do
  def trocando ({a, b}) do
    {b, a}
  end
  def validando(a, a) do
    true
  end

  def validando(a, b) do
    false
  end
  def sum([]), do: 0
  def sum([h | t]), do: h + sum(t)
end

defmodule Lists do
  def len([]), do: 0
  def len([ _ | tail]), do: 1 + len(tail)

  def sum([]), do: 0
  def sum([head|tail]), do: head + sum(tail)

  def double([]), do: []
  def double([head|tail]), do: [2*head | double(tail)]

  def square([]), do: []
  def square([head|tail]), do: [head*head|square(tail)]

  def sum_pairs([]), do: []
  def sum_pairs([head1, head2|tail]), do: [head1+head2|sum_pairs(tail)]
  def sum_pairs([head]), do: [head]

  def even_length?([]), do: true
  def even_length?([_|[]]), do: false
  def even_length([_, _| tail ]), do: even_length?(tail)
end


# TODO in the end
# (Difficult) If you’d like an interesting challenge, write another application where the computer plays the hangman game. For a simple implementation you could just blindly guess letters, starting at the most frequent.

# You could then optimize it by looking at the possible words. You’ll need to add a new API function to the dictionary to return all the words of a given length. You can then use that list to decide which letter
# will give you the most information based on the current game state.
