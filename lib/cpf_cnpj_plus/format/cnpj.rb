module CpfCnpjPlus
  module Format
    # Classe responsável por formatar e desformatar CNPJ.
    # Formata e desformata um CNPJ para o formato tradicional com pontos, traço e barra e vice-versa.
    class Cnpj
    # @param cnpj [String] O CNPJ alfanumérico a ser formatado.
    # @return [String] O CNPJ formatado no padrão "XX.XXX.XXX/XXXX-XX".
    def self.format(cnpj)
      cnpj.gsub(/(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})/, '\1.\2.\3/\4-\5')
    end
    # @param cnpj [String] O CNPJ formatado a ser desformatado.
    # @return [String] O CNPJ desformatado, contendo apenas números.
    def self.desformatar(cnpj)
      cnpj.gsub(/[^\d]/, '')
    end

    # Método auxiliar para verificar se o CNPJ está no formato alfanumérico.
    # @param cnpj [String] O CNPJ a ser verificado.
    # @return [Boolean] Retorna true se o CNPJ estiver no formato alfanumérico, false caso contrário.
    def self.alfanumerico?(cnpj)
      cnpj.match?(/\A\d{14}\z/)
    end
  end
end