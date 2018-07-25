require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!
require_relative 'cash_register'
require_relative 'transaction'
class CashRegisterTest < Minitest::Test

  def test_accept_money
    cash = CashRegister.new(0)
    transaction = Transaction.new(100)
    transaction.amount_paid = 40
    cash.accept_money(transaction)
    assert_equal 40, cash.total_money
  end

  def test_change
    cash = CashRegister.new(0)
    transaction = Transaction.new(40)
    transaction.amount_paid = 100
    assert_equal 60, cash.change(transaction)
  end

  def test_give_receipt
    cash = CashRegister.new(0)
    transaction = Transaction.new(40)
    transaction.amount_paid = 100
    assert_equal 40, transaction.item_cost
    assert_output(stdout = "You've paid $40.\n") { cash.give_receipt(transaction) }
  end

  def test_prompt_for_paiement
    cash = CashRegister.new(0)
    transaction = Transaction.new(40)
    input = StringIO.new("40")
    output = StringIO.new
    transaction.prompt_for_payment(input: input, output: output)
    assert_equal 40, transaction.amount_paid
  end
end
