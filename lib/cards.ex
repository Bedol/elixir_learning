defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
  Generate a list of cards

  ## Examples

      iex> Cards.create_deck
      ["Ace of Spades", "Two of Spades", "Three of Spades", "Four of Spades",
      "Five of Spades", "Ace of Clubs", "Two of Clubs", "Three of Clubs",
      "Four of Clubs", "Five of Clubs", "Ace of hearts", "Two of hearts",
      "Three of hearts", "Four of hearts", "Five of hearts", "Ace of Diamonds",
      "Two of Diamonds", "Three of Diamonds", "Four of Diamonds", "Five of Diamonds"]

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
  Check if the card is in the collection

  ## Examples
  
      iex> Cards.contains?(["Ace of Spades", "Two of Clubs"], "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card) 
  end

  @doc """
  Draw cards from deck and return tuple with hand and rest of deck

  ## Examples

      iex> Cards.deal([1, 2, 3, 4, 5], 2)
      {[1, 2], [3, 4, 5]}
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
