require "rails_helper"

describe Topping, :type => :model do
    before do
        @topping = create(:topping_1)
    end

    it "is valid with valid name" do
        expect(Topping.new(name: "Test")).to be_valid
    end

    it "is not valid with a name that is already in use" do
        expect(Topping.new(name: "Cheese")).to_not be_valid
    end

    it "is not valid with blank name" do
        expect(Topping.new(name: '')).to_not be_valid
        expect(Topping.new(name: '                ')).to_not be_valid
    end

    it "is not valid with name over 50 chars" do
        expect(Topping.new(name: 'a' * 51)).to_not be_valid
    end
end