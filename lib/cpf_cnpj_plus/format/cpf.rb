# frozen_string_literal: true

module CpfCnpjPlus
  module Format
    # Classe responsável por formatar e desformatar CPFs.
    # Fornece métodos para formatar um CPF no padrão tradicional (XXX.XXX.XXX-XX)
    # e desformatar um CPF, removendo pontos e traços.
    class Cpf
      # Formata um CPF no padrão XXX.XXX.XXX-XX.
      # @param cpf [String] O CPF a ser formatado.
      # @return [String] O CPF formatado.
      def self.format(cpf)
        cpf.gsub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\1.\2.\3-\4')
      end

      # Desformata um CPF, removendo pontos e traços.
      # @param cpf [String] O CPF a ser desformatado.
      # @return [String] O CPF desformatado, contendo apenas números.
      def self.desformatar(cpf)
        cpf.gsub(/[^\d]/, "")
      end
    end
  end
end
