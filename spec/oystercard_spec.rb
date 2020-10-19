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

  describe "#deduct" do
    it "deducts the specified amount from balance" do
      subject.top_up(15)
      expect(subject.deduct(5)).to eq 10
    end
  end

  describe "#in_journey?" do
    it "returns true if the user is in journey" do
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end
  end

  describe "#touch_in" do
    it "changes the status to in use" do
      expect(subject.touch_in).to eq "in use"
    end
  end

  describe "#touch_out" do
    it "changes the status to not in use" do
      expect(subject.touch_out).to eq "not in use"
    end
  end


end
