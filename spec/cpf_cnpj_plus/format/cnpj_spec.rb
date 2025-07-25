require 'cpf_cnpj_plus/format/cnpj'

RSpec.describe CpfCnpjPlus::Format::Cnpj do
  describe '.format' do
    it 'formats a numeric CNPJ string correctly' do
      expect(described_class.format('12345678000195')).to eq('12.345.678/0001-95')
    end

    it 'does not change an already formatted CNPJ' do
      expect(described_class.format('12.345.678/0001-95')).to eq('12.345.678/0001-95')
    end

    it 'returns the original string if it does not match the expected pattern' do
      expect(described_class.format('123')).to eq('123')
    end
  end

  describe '.desformatar' do
    it 'removes formatting from a formatted CNPJ' do
      expect(described_class.desformatar('12.345.678/0001-95')).to eq('12345678000195')
    end

    it 'returns the same string if already unformatted' do
      expect(described_class.desformatar('12345678000195')).to eq('12345678000195')
    end

    it 'removes all non-digit characters' do
      expect(described_class.desformatar('12.345.678/0001-95abc')).to eq('12345678000195')
    end
  end

  describe '.alfanumerico?' do
    it 'returns true for a 14-digit numeric string' do
      expect(described_class.alfanumerico?('12345678000195')).to be true
    end

    it 'returns false for a string with less than 14 digits' do
      expect(described_class.alfanumerico?('12345678')).to be false
    end

    it 'returns false for a string with non-digit characters' do
      expect(described_class.alfanumerico?('12.345.678/0001-95')).to be false
    end

    it 'returns false for an empty string' do
      expect(described_class.alfanumerico?('')).to be false
    end
  end
end