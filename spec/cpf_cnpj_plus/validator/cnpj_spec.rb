# frozen_string_literal: true

require "byebug"
RSpec.describe CpfCnpjPlus::Validator::Cnpj do
  describe ".valid?" do
    it "returns true for a valid CNPJ" do
      expect(described_class.valid?("12.345.678/0001-95")).to be true
    end

    it "returns false for an invalid CNPJ" do
      expect(described_class.valid?("12.345.678/0001-96")).to be false
    end

    it "returns false for a CNPJ with incorrect length" do
      expect(described_class.valid?("12345678")).to be false
    end

    it "returns false for a CNPJ with all digits the same" do
      expect(described_class.valid?("11.111.111/1111-11")).to be false
    end

    it "returns true for a valid CNPJ alphanumeric" do
      expect(described_class.valid?("12ABC34501DE35")).to be true
    end

    it "returns false for an empty string" do
      expect(described_class.valid?("")).to be false
    end

    it "returns false for nil" do
      expect(described_class.valid?(nil)).to be false
    end
  end
end
