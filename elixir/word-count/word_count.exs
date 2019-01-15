defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    unpunctuate(sentence)
    |> String.split
    |> count_word_in_list
  end

  def count_word_in_list(list) when length(list) == 0, do: %{}

  def count_word_in_list(list) do
    [word | remainder] = list

    tally = count_word_in_list(remainder)

    Map.update(tally, word, 1, &(&1 + 1))
  end

  def unpunctuate(sentence) do
    punctuation_to_ignore = ~r/[!-,.-\/:-@[-^{-~]+/
    punctuation_as_space = "_"


    String.replace(sentence, punctuation_to_ignore, "")
    |> String.replace(punctuation_as_space, " ")
  end
end
