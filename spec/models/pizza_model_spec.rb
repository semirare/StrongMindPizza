require "rails_helper"

describe Pizza, :type => :model do
    before do
        @pizza = create(:pizza_1)
    end

    it "is valid with valid name" do
        expect(Pizza.new(name: "Test")).to be_valid
    end

    it "is not valid with a name that is already in use" do
        expect(Pizza.new(name: "Cheese Pizza")).to_not be_valid
    end

    it "is not valid with blank name" do
        expect(Pizza.new(name: '')).to_not be_valid
        expect(Pizza.new(name: '                ')).to_not be_valid
    end

    it "is not valid with name over 50 chars" do
        expect(Pizza.new(name: 'a' * 51)).to_not be_valid
    end
end