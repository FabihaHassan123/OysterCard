require "station"

describe Station do

  let(:subject) { Station.new("Paddington", 1) }

  describe "#initialize" do

    it "creates a new instance of station with station name" do
      expect(subject.name).to eq "Paddington"
    end

    it "creates a new instance of station with zone" do
      expect(subject.zone).to eq 1
    end

  end

end
