# frozen_string_literal: true

module CpfCnpjPlus
  module Validator
    # Responsável por validar, formatar e manipular números de CPF.
    # Inclui métodos para checagem de validade, geração e formatação.
    class Cpf
      def self.valid?(cpf)
        cpf = cpf.to_s.gsub(/[^0-9]/, "")
        return false unless cpf.length == 11 && cpf =~ /^\d{11}$/
        return false if cpj_not_valid?(cpf)

        first_digit(cpf) && second_digit(cpf)
      end

      def self.first_digit(cpf)
        first_digits = cpf[0..8]
        soma = 0
        ponteiro = 10
        first_digits.chars.each do |char|
          soma += char.to_i * ponteiro
          ponteiro -= 1
        end
        resto = soma % 11
        digito = resto < 2 ? 0 : 11 - resto
        digito == cpf[9].to_i
      end

      def self.second_digit(cpf)
        second_digits = cpf[0..9]
        soma = 0
        ponteiro = 11
        second_digits.chars.each do |char|
          soma += char.to_i * ponteiro
          ponteiro -= 1
        end
        resto = soma % 11
        digito = resto < 2 ? 0 : 11 - resto
        digito == cpf[10].to_i
      end

      def self.cpj_not_valid?(cpf)
        cpf = cpf.to_s.gsub(/[^0-9]/, "")
        %w[00000000000 11111111111 22222222222 33333333333
           44444444444 55555555555 66666666666
           77777777777 88888888888 99999999999].include?(cpf)
      end
    end
  end
end
