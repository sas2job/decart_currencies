require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  test 'valid currency' do
    currency = Currency.new(name: 'CAD', rate: '81.2087')
    assert currency.valid?
  end

  test 'invalid without name' do
    currency = Currency.new(rate: '81.2087')
    refute currency.valid?, 'currency is valid without a name'
    assert_not_nil currency.errors[:name], 'no validation error for name present'
  end

  test 'invalid without rate' do
    currency = Currency.new(name: 'CAD')
    refute currency.valid?, 'currency is valid without a rate'
    assert_not_nil currency.errors[:rate], 'no validation error for rate present'
  end
end
