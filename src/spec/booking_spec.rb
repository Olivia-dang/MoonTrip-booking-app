require_relative '../models/Booking.rb'

RSpec.describe Booking do
    let(:trip) {Booking.new("testie", "76", "10 October 2022", "Luxury")}
    it "should respond to attributes" do 
        expect(trip).to respond_to(:reference)
        expect(trip).to respond_to(:name)
        expect(trip).to respond_to(:age)
        expect(trip).to respond_to(:package)
        expect(trip).to respond_to(:date)
    end

    it 'should respond to save' do
        expect(trip).to respond_to :save
    end

    describe "#save" do
        it "should increase the length of db by 1" do 
            expect {trip.save}.to change {Booking.all.length}.by(1)
        end
    end
    describe "#age" do
        let(:trip) {Booking.new("testie", "76", "10 October 2022", "Luxury")}        
        it "should not be nil" do 
            expect(trip.age).not_to be_nil
        end
        it "should be equal to  76" do
            expect(trip.age).to eq "76"
        end
    end 
    describe "delete" do
        let(:trip) {Booking.new("delete", "20", "10 October 2022", "Luxury")}        
        it "should set reference to nil" do
            trip.save
            trip.delete
            expect(trip.reference).to be_nil
        end
    end
end
