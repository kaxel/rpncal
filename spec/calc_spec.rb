require 'calc'

RSpec.describe Calc, "#inputs" do
  context "on loading" do
    it "returns a single input" do
      calc = Calc.new
      expect(calc.take("1")).to eq(1)
    end
    
    it "returns the last of two or more subsequent inputs" do
      calc = Calc.new
      expect(calc.take("1 3")).to eq(3)
      expect(calc.take("1 3 7 7 2")).to eq(2) 
      expect(calc.take("1 3 44 66 9999")).to eq(9999) 
    end
  end
  
  context " with action" do
    it "uses operators correctly" do
      calc = Calc.new
      expect(calc.take("1 3 +")).to eq(4)
      expect(calc.take("9 4 66 13 -")).to eq(-53)
    end
    
    it "errors when operator cannot find enough inputs" do
      calc = Calc.new
      expect(calc.take("3 +")).to eq("ERROR")
    end
  end
end