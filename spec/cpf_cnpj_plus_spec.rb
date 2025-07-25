# frozen_string_literal: true

RSpec.describe CpfCnpjPlus do
  it "has a version number" do
    expect(CpfCnpjPlus::VERSION).not_to be nil
  end

  describe ".valid_cpf?" do
    it "returns true for a valid CPF" do
      expect(CpfCnpjPlus.valid_cpf?("529.982.247-25")).to be true
    end

    it "returns false for an invalid CPF" do
      expect(CpfCnpjPlus.valid_cpf?("123.456.789-00")).to be false
    end
  end

  describe ".valid_cnpj?" do
    it "returns true for a valid CNPJ" do
      expect(CpfCnpjPlus.valid_cnpj?("04.252.011/0001-10")).to be true
    end

    it "returns false for an invalid CNPJ" do
      expect(CpfCnpjPlus.valid_cnpj?("00.000.000/0000-00")).to be false
    end
  end

  describe ".format_cpf" do
    it "formats a CPF correctly" do
      expect(CpfCnpjPlus.format_cpf("52998224725")).to eq("529.982.247-25")
    end
  end

  describe ".format_cnpj" do
    it "formats a CNPJ correctly" do
      expect(CpfCnpjPlus.format_cnpj("04252011000110")).to eq("04.252.011/0001-10")
    end
  end

  describe ".generate_cpf" do
    it "generates a valid CPF" do
      cpf = CpfCnpjPlus.generate_cpf
      expect(CpfCnpjPlus.valid_cpf?(cpf)).to be true
    end
  end

  describe ".generate_cnpj" do
    it "generates a valid numeric CNPJ" do
      debugger
      cnpj = CpfCnpjPlus.generate_cnpj
      expect(CpfCnpjPlus.valid_cnpj?(cnpj)).to be true
    end

    it "generates a valid alphanumeric CNPJ when alfa: true" do
      cnpj = CpfCnpjPlus.generate_cnpj(true)
      expect(CpfCnpjPlus.valid_cnpj?(cnpj)).to be true
    end
  end
end
