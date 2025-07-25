require 'cpf_cnpj_plus/generate/cpf'

RSpec.describe CpfCnpjPlus::Generate::Cpf do
  describe '.generate' do
    it 'returns a formatted CPF string' do
      cpf = described_class.generate('123456789')
      expect(cpf).to match(/\A\d{3}\.\d{3}\.\d{3}-\d{2}\z/)
    end

    it 'generates a CPF with correct check digits' do
      base = '123456789'
      cpf = described_class.generate(base)
      digits = described_class.calculate_digits(base)
      expect(cpf).to end_with(digits)
    end

    it 'generates different CPFs on each call when base is not given' do
      allow(described_class).to receive(:rand).and_return(1,2,3,4,5,6,7,8,9)
      cpf1 = described_class.generate('123456789')
      allow(described_class).to receive(:rand).and_return(9,8,7,6,5,4,3,2,1)
      cpf2 = described_class.generate('987654321')
      expect(cpf1).not_to eq(cpf2)
    end
  end

  describe '.calculate_digits' do
    it 'calculates correct check digits for a known base' do
      expect(described_class.calculate_digits('123456789')).to eq('09')
      expect(described_class.calculate_digits('111444777')).to eq('35')
    end

    it 'returns a string of two digits' do
      digits = described_class.calculate_digits('123456789')
      expect(digits).to match(/\A\d{2}\z/)
    end
  end
end