require "Oystercard"

describe Oystercard do

  let(:entry_station) { "Paddington" }
  let(:exit_station) { "Bank" }

  before { subject.balance = 2 }

  describe "#view_balance" do
    it "calls the method to view the balance" do
      expect(subject.view_balance).to eq 2
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

  describe "#touch_in" do
    it "raises error if insufficient funds on card" do
      subject.balance = 0
      expect { subject.touch_in(entry_station) }.to raise_error("insufficient funds.")
    end
    it "remembers the station name when touching in" do
      subject.touch_in(entry_station)
      expect(subject.current_journey.entry_station).to eq "Paddington"
    end
    it "creates a journey" do
      subject.touch_in(entry_station)
      expect(subject.current_journey).not_to eq nil
    end
  end

  describe "#touch_out" do
    it "deducts minimum fare when journey is complete" do
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-1)
    end
    it "deducts penalty fare when journey is complete" do
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-6)
    end
    it "changes the exit_station to the exit station given" do
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.history[-1].exit_station).to eq "Bank"
    end
    it "updates the history with the current journey" do
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change { subject.history.count }.by(1)
    end
    it "sets the current journey back to nil" do
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change {subject.current_journey}.to(nil)
    end

  end

  describe "#journey_history" do
    it "logs the journey history" do
      expect(subject.journey_history).to eq subject.history
    end
  end

  # describe "#deduct" do
  #   it "deducts the specified amount from balance" do
  #     subject.top_up(15)
  #     expect(subject.deduct(5)).to eq 10
  #   end
  # end

end
