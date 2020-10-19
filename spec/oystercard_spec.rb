require "Oystercard"

describe Oystercard do

  describe "#view_balance" do
    it "calls the method to view the balance" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "tops up the balance on oystercard" do
      expect(subject.top_up(5)).to eq 5
    end

    it "caps the oystercard at £90" do
      expect { subject.top_up(91) }.to raise_error("maximum amount limit reached.")
    end
  end


end
