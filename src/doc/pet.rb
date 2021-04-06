class Pet
    attr_reader :name
    def initialize(name)
        @name = name
    end
end

describe Pet do
    it "should have a name" do
        pet = Pet.new("Poto")
        expect(pet.name).to eq "Poto"
        expect(pet.name).to match /^P/
        expect(pet).to be_instance_of Pet
    end
end
