defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.split(sentence)
    |> count_word_in_list
  end

  def count_word_in_list(list) when length(list) == 0, do: %{}

  def count_word_in_list(list) do
    [word | remainder] = list

    count = %{word => 1}
    
    Map.merge(count, count_word_in_list(remainder))
  end
end
