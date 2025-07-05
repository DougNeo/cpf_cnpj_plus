module CpfCnpjPlus
  module Validator
    class Cpf
      def self.valid?(cpf)
        cpf = cpf.to_s.gsub(/[^0-9]/, "")
        return false unless cpf.length == 11 && cpf =~ /^\d{11}$/
        first_digit(cpf) && second_digit(cpf)
      end

      private

      def self.first_digit(cpf)
        first_digit = cpf[0..8]
        soma = 0
        ponteiro = 10
        first_digit.chars.each do |char|
          res = (char.to_i * ponteiro)
          soma += res
          ponteiro -= 1
        end
        soma * 10 % 11 == cpf[9].to_i
      end

      def self.second_digit(cpf)
        second_digit = cpf[0..9]
        soma = 0
        ponteiro = 11
        second_digit.chars.each do |char|
          res = (char.to_i * ponteiro)
          soma += res
          ponteiro -= 1
        end
        soma * 10 % 11 == cpf[10].to_i || (soma * 10 % 11 == 10 && cpf[10].to_i == 0)
      end
    end
  end
end