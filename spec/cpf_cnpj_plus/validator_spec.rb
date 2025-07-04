# frozen_string_literal: true
require 'byebug'
RSpec.describe CpfCnpjPlus::Validator do
  describe ".valid_cnpj?" do
    xit "returns true for a valid CNPJ" do
      expect(described_class.valid_cnpj?("12.345.678/0001-95")).to be true
    end

    xit "returns false for an invalid CNPJ" do
      expect(described_class.valid_cnpj?("12.345.678/0001-96")).to be false
    end

    xit "returns false for a malformed CNPJ" do
      expect(described_class.valid_cnpj?("12345678000195")).to be false
    end

    xit "returns false for a CNPJ with incorrect length" do
      expect(described_class.valid_cnpj?("12345678")).to be false
    end
  end
  
  describe ".valid_cpf?" do
    it "validates CPF with correct format" do
      expect(described_class.valid_cpf?("103.212.557-80")).to be true
    end
    
    it "returns true for a valid CPF" do
      expect(described_class.valid_cpf?("103.212.557-80")).to be true
    end

    it "returns false for a CPF with incorrect length" do
      expect(described_class.valid_cpf?("12345678")).to be false
    end
  end
end