require "f/Brief"
require "f/Adresse"
require "Set"
require "test/unit"

class BriefTest < Test::Unit::TestCase
  def setup()

    @b1 = Brief.new(Adresse.new("Hilli","Strasse 1","Ort 1"), Adresse.new("Milli","Strasse 2", "Ort 2"),"HI")
    @b2 = Brief.new(Adresse.new("Hilli","Strasse 1","Ort 1"), Adresse.new("Milli","Strasse 2", "Ort 2"),"HI")
    b3 = Brief.new(Adresse.new("Hans","Strasse 1","Ort 1"), Adresse.new("Milli","Strasse 2", "Ort 2"),"HI")
    b4 = Brief.new(Adresse.new("Hilli","Strasse 3","Ort 1"), Adresse.new("Milli","Strasse 2", "Ort 2"),"HI")
    b5 = Brief.new(Adresse.new("Hilli","Strasse 1","Ort 3"), Adresse.new("Milli","Strasse 2", "Ort 2"),"HI")
    b6 = Brief.new(Adresse.new("Hilli","Strasse 1","Ort 1"), Adresse.new("Milli","Strasse 2", "Ort 2"),"HO")

    @ary = [@b1,b3,b4,b5,b6,@b1.clone()]
    @set = Set.new([@b1,b3,b4,b5,b6])
    @hash = {}
    @set.each(){|e| @hash[e] = e.inhalt()}

  end

  def test_with_array
    assert(@ary.include?(@b2))
    assert_equal(2,@ary.count(@b2))
  end

  def test_with_set
    assert(@set.include?(@b2))
    assert(!@set.add?(@b2))
  end

  def test_with_hash
    assert(@hash.has_key?(@b2))
    assert_equal(@b2.inhalt(),@hash[@b1])
  end

end