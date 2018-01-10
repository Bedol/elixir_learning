defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello
      :world

  """
  def hello do
    :world
  end

  @doc """
    Generate a list of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "hearts", "Diamonds"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Shuffle a list of deck cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck) 
  end

  @doc """
    Check if given card is in deck
  """
  def contains?(deck, card) do
    Enum.member?(deck, card) 
  end

  @doc """
    Return a two list with cards. First list is cards in hand, second list is rest of cards in deck
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Save deck to file
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end 

  @doc """
    Load deck from file
  """
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "Can't load this file"
    end
  end

  @doc """
    Create hand from new deck
  """
  def create_hand(hand_size) do
    create_deck()
      |> shuffle
      |> deal(hand_size)
  end
end
