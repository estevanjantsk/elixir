defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  def handle_file_read({:ok, result}) do
    result
    |> String.split(",")
    |> Enum.map(&convert_and_evaluate_numbers/1)
  end
  def handle_file_read({:error, reason}), do: "Error reading the file due to: #{reason}"

  def convert_and_evaluate_numbers(elem) do
    elem
    |> String.to_integer()
  end
end
