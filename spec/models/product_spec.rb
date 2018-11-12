require 'rails_helper'

RSpec.describe Product, type: :model do
  subject {
    described_class.new(name: "name", price_cents: 1.00, quantity: 20, category: Category.new(name: "name"))
  }

  describe "Validations" do
    it "is valid with all valid attributes" do
      expect(subject).to be_valid
    end

    it "it not be valid without a valid name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "it should not valid with a valid price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it "is valid with a valid quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is valid with a valid category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end

  end
end
