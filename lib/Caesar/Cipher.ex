defmodule Caesar.Cipher do

  @moduledoc """
  Caesar Cipher module, which maps characters to  a new characters
  """

  @aphabet_size Application.get_env(:caesar, :alphabet_size)


  @doc """
  Encrypt the message by applying a mapping that shfits the alphabet by
  the 'shift' value

  ## Examples from iex repl
      iex> Caesar.Cipher.encrypt("hello world", 1)
      "gdkkn vnqkc"

  ## Examples from cli
      ./caesar encrypt "hello world" --shift 1
      "gdkkn vnqkc"
  """


  def encrypt(msg, shift) do
    # convert msg to char_list
    msg
      |> to_char_list
      # iterate over list apply shift mapping
      |> Enum.map(&shift_char(&1, shift))
      # return list as binary string
      |> List.to_string()
  end

  defp shift_char(character, shift) do
    case character do
      char when char in (?a..?z) -> calculate_mapping(?a, char, shift)
      char when char in (?A..?Z) -> calculate_mapping(?A, char, shift)
      char -> char
    end
  end

  def calculate_mapping(base_ltter, char, shift) do
    # find the ASCII interger of the char and normalize it
    # by subtracting the size of the alphabet
    normalize = &(&1 - @aphabet_size)
    # ensure shift number is within the alphabet size
    shift_num = rem(shift, @aphabet_size)
    # calculate the shifted value
    base_ltter + rem(char - normalize.(base_ltter) - shift_num, 26)
  end

end
