module CpfCnpjPlus
  module Validator
    class Cnpj
      def self.valid?(cnpj)
        cnpj = cnpj.to_s.upcase.gsub(/[^A-Z0-9]/, "")
        return false unless cnpj.length == 14
        return false unless cnpj[0..11] =~ /^[A-Z0-9]{12}$/ && cnpj[12..13] =~ /^[0-9]{2}$/

        base = cnpj[0..11].chars.map { |c| char_to_value(c) }
        dv = cnpj[12..13]

        dv_calc = calculate_cnpj_digits(base)
        dv == dv_calc
      end

      def self.char_to_value(char)
        if ("0".."9").include?(char)
          char.ord - 48
        elsif ("A".."Z").include?(char)
          char.ord - 48 # Ajuste para A=10, B=11, ..., Z=35
        else
          raise ArgumentError, "Caractere inválido"
        end
      end

      def self.calculate_cnpj_digits(base)
        first_digit = calculate_digit(base, fator_index_1d)
        second_digit = calculate_digit((base + [first_digit]), fator_index_2d)
        "#{first_digit}#{second_digit}"
      end


      def self.fator_index_1d
        [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
      end

      def self.fator_index_2d
        [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
      end

      def self.calculate_digit(base, fator_index)
        soma = 0
        fator_index.each_with_index do |fator, index|
          soma += base[index] * fator
        end
        digit = (soma * 10) % 11
        digit = 0 if digit == 10
        digit
      end
    end
  end
end