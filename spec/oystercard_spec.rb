require "Oystercard"

describe Oystercard do

  describe "#view_balance" do
    it "calls the method to view the balance" do
      expect(subject.balance).to eq 0
    end
  end

end
