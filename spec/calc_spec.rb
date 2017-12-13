require 'calc'

RSpec.describe Calc, "#inputs" do
  context "on loading" do
    it "returns a single input" do
      calc = Calc.new
      expect calc.take(1) == 1
    end
  end
end