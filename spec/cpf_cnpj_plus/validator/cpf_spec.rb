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

    it "returns false for a CPF with all digits the same" do
      expect(described_class.valid?("111.111.111-11")).to be false
    end

    it "returns false for a CPF with non-numeric characters" do
      expect(described_class.valid?("abc.def.ghi-jk")).to be false
    end

    it "returns false for an empty string" do
      expect(described_class.valid?("")).to be false
    end

    it "returns false for nil" do
      expect(described_class.valid?(nil)).to be false
    end
  end
end