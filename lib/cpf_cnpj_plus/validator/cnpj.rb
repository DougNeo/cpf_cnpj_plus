# frozen_string_literal: true

module CpfCnpjPlus
  module Validator
    # Responsável por validar, formatar e manipular números de CNPJ.
    # Inclui métodos para checagem de validade, geração e formatação.
    class Cnpj
      def self.valid?(cnpj)
        cnpj = normalize(cnpj)
        return false unless valid_length?(cnpj)
        return false if cnpj_not_valid?(cnpj)
        return false unless valid_structure?(cnpj)

        base = cnpj[0..11].chars.map { |c| char_to_value(c) }
        dv = cnpj[12..13]

        dv == calculate_cnpj_digits(base)
      end

      def self.normalize(cnpj)
        cnpj.to_s.upcase.gsub(/[^A-Z0-9]/, "")
      end

      def self.valid_length?(cnpj)
        cnpj.length == 14
      end

      def self.valid_structure?(cnpj)
        cnpj[0..11] =~ /^[A-Z0-9]{12}$/ && cnpj[12..13] =~ /^[0-9]{2}$/
      end

      def self.char_to_value(char)
        if ("0".."9").include?(char)
          char.ord - 48
        elsif ("A".."Z").include?(char)
          char.ord - 48 # Ajuste para A=17, B=18, ..., Z=42
        else
          raise ArgumentError, "Caractere inválido"
        end
      end

      def self.calculate_cnpj_digits(base)
        first_digit = calculate_digit(base, fator_index_1d)
        second_digit = calculate_digit(base + [first_digit], fator_index_2d)
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
        resto = soma % 11
        if resto == 0 || resto == 1
          0
        else
          11 - resto
        end
      end

      def self.cnpj_not_valid?(cnpj)
        # Não remova letras, só verifique se todos os caracteres são iguais
      normalized = normalize(cnpj)
      normalized.chars.uniq.size == 1
      end
    end
  end
end
