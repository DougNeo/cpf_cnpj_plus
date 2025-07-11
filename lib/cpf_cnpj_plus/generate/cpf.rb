# frozen_string_literal: true

module CpfCnpjPlus
  module Generate
    # Classe responsável por gerar CPFs válidos.
    # Fornece métodos para gerar CPFs no padrão tradicional (XXX.XXX.XXX-XX).
    class Cpf
      # Gera um CPF válido.
      # @return [String] CPF formatado.
      def self.generate(base = nil)
        Array.new(9) { rand(0..9) }.join
        digits = calculate_digits(base)
        "#{base}#{digits}".insert(3, ".").insert(7, ".").insert(11, "-")
      end

      # Calcula os dígitos verificadores do CPF.
      def self.calculate_digits(base)
        sum1 = base.chars.each_with_index.sum { |digit, index| digit.to_i * (10 - index) }
        resto = sum1 % 11
        digit1 = resto < 2 ? 0 : 11 - resto

        sum2 = (base + digit1.to_s).chars.each_with_index.sum { |digit, index| digit.to_i * (11 - index) }
        resto2 = sum2 % 11
        digit2 = resto2 < 2 ? 0 : 11 - resto2

        "#{digit1}#{digit2}"
      end
    end
  end
end
