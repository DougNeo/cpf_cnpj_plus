# frozen_string_literal: true
require 'byebug'
RSpec.describe CpfCnpjPlus::Validator::Cpf do
  describe ".valid?" do
    
    it "returns true for a valid CPF" do
      expect(described_class.valid?("103.212.557-80")).to be true
    end

    it "returns false for a valid CPF" do
      expect(described_class.valid?("103.212.557-85")).to be false
    end

    it "returns false for a CPF with incorrect length" do
      expect(described_class.valid?("12345678")).to be false
    end
  end
end