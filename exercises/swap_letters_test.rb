require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require_relative "swap_letters"

class SwapLettersTest < Minitest::Test
  def setup
    sample = File.read 'sample_text.txt'
    @text = Text.new(sample)
  end

  def test_swap_letters
    result = File.read 'expected_text.txt'
    assert_equal result, @text.swap("a", "e")
  end

  def test_count_words
    assert_equal 72, @text.word_count
  end

end