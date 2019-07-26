require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../Bar.rb")

class BarTest < MiniTest::Test

  def setup()
    @bar = Bar.new()
  end

  def test_total_starts_at_zero()
    assert_equal(0, @bar.total)
  end
end
