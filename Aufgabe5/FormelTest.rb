require "formeln"
require "test/unit"

class FormelTest < Test::Unit::TestCase
  def setup()
    @anzahl_iterationen = 10000000
    @wert0 = 0.1
    @wert1 = 1.0
    @wert2 = 2.0
    @epsilon = 1*(10**(-5))
  end

  def test_wrong_arguments
    assert(approx_ln(0.0, 1) == -99, 'falsche Parameter')
    assert(approx_ln(2.1, 1) == -99, 'falsche Parameter')
    assert(approx_ln(1.0, 1) == -99, 'falsche Parameter')
    assert(approx_ln(1.0, 1.0) == -99, 'falsche Parameter')
    assert(approx_ln(1, 1) == -99, 'falsche Parameter')
  end

  def test_ln
    assert_in_epsilon(approx_ln(@wert0, @anzahl_iterationen), Math::log(@wert0), @epsilon)
    assert_in_epsilon(approx_ln(@wert1, @anzahl_iterationen), Math::log(@wert1), @epsilon)
    assert_in_epsilon(approx_ln(@wert2, @anzahl_iterationen), Math::log(@wert2), @epsilon)
  end

end