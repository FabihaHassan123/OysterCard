require "journey"
require 'oystercard'
describe Journey do



  describe "#in_journey?" do
    let(:entry_station) { double("Bank") }
    it "returns true if the user is in journey" do
      subject.entry_station = entry_station
      expect(subject.in_journey?).to eq true
    end
  end

end
