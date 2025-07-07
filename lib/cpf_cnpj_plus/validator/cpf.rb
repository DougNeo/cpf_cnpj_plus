module CpfCnpjPlus
  module Validator
    class Cpf
      def self.valid?(cpf)
        cpf = cpf.to_s.gsub(/[^0-9]/, "")
        return false unless cpf.length == 11 && cpf =~ /^\d{11}$/
        return false if cpj_not_valid?(cpf)
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

      def self.cpj_not_valid?(cpf)
        cpf = cpf.to_s.gsub(/[^0-9]/, "")
        ["00000000000", "11111111111", "22222222222", "33333333333",
         "44444444444", "55555555555", "66666666666",
         "77777777777", "88888888888", "99999999999"].include?(cpf)
      end
    end
  end
end