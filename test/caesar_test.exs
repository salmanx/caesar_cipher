defmodule CaesarTest do
  use ExUnit.Case
  doctest Caesar.Cipher

  test "parse_args help" do
    argv = ["help"]
    assert Caesar.parse_args(argv) == {:help}
  end

  test "parse_args encrypt" do
    argv = ["encrypt", "abc", "--shift", "1"]
    assert Caesar.parse_args(argv) == {:encrypt, "abc", 1}
  end
end
