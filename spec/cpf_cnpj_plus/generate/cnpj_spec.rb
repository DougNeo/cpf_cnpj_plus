require 'cpf_cnpj_plus/format/cnpj'

RSpec.describe CpfCnpjPlus::Format::Cnpj do
  describe '.format' do
    it 'formata um CNPJ numérico para o padrão XX.XXX.XXX/XXXX-XX' do
      expect(described_class.format('12345678000195')).to eq('12.345.678/0001-95')
    end

    it 'não altera um CNPJ já formatado' do
      expect(described_class.format('12.345.678/0001-95')).to eq('12.345.678/0001-95')
    end

    it 'retorna string original se não tiver 14 dígitos' do
      expect(described_class.format('123')).to eq('123')
    end
  end

  describe '.desformatar' do
    it 'remove pontos, barra e traço de um CNPJ formatado' do
      expect(described_class.desformatar('12.345.678/0001-95')).to eq('12345678000195')
    end

    it 'retorna apenas números se houver caracteres extras' do
      expect(described_class.desformatar('12.345.678/0001-95abc')).to eq('12345678000195')
    end

    it 'retorna o próprio valor se já for numérico' do
      expect(described_class.desformatar('12345678000195')).to eq('12345678000195')
    end
  end

  describe '.alfanumerico?' do
    it 'retorna true para CNPJ com 14 dígitos' do
      expect(described_class.alfanumerico?('12345678000195')).to be true
    end

    it 'retorna false para CNPJ com menos de 14 dígitos' do
      expect(described_class.alfanumerico?('12345678')).to be false
    end

    it 'retorna false para CNPJ com caracteres não numéricos' do
      expect(described_class.alfanumerico?('12.345.678/0001-95')).to be false
    end
  end
end