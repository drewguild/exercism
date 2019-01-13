defmodule Bob do
  def hey(input) do
    cond do
      silence?(input) -> "Fine. Be that way!"
      shouted?(input) && question?(input) -> "Calm down, I know what I'm doing!"
      question?(input) -> "Sure."
      shouted?(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  def shouted?(string) do
    #Match on any unicode letter (i.e not just English alphabet)
    Regex.match?(~r/.*[\p{L}].*/u, string) &&
      string == String.upcase(string)
  end

  def question?(string) do
    String.ends_with?(string, "?")
  end

  def silence?(string) do
    length = string
      |> String.trim
      |> String.length

    length == 0
  end
end
