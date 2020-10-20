require "Oystercard"

describe Oystercard do

  let(:entry_station) { "Paddington" }

  before { subject.balance = 2 }

  describe "#view_balance" do
    it "calls the method to view the balance" do

      expect(subject.balance).to eq 2
    end
  end

  describe "#top_up" do
    it "tops up the balance on oystercard" do
      subject.balance = 0
      expect(subject.top_up(5)).to eq 5
    end

    it "caps the oystercard at £90" do
      subject.balance = 0
      expect { subject.top_up(91) }.to raise_error("maximum amount limit reached.")
    end
  end

  # describe "#deduct" do
  #   it "deducts the specified amount from balance" do
  #     subject.top_up(15)
  #     expect(subject.deduct(5)).to eq 10
  #   end
  # end

  describe "#in_journey?" do
    it "returns true if the user is in journey" do
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to eq true
    end
  end

  describe "#touch_in" do
    it "raises error if insufficient funds on card" do
      subject.balance = 0
      expect { subject.touch_in(entry_station) }.to raise_error("insufficient funds.")
    end
    it "remembers the station name when touching in" do
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq "Paddington"
    end
  end

  describe "#touch_out" do
    it "deducts fare when journey is complete" do
      expect { subject.touch_out }.to change { subject.balance }.by(-1)
    end
    it "changes the entry_station to nil" do
      subject.touch_in(entry_station)
      expect { subject.touch_out }.to change { subject.entry_station }.to nil
    end
  end

end
