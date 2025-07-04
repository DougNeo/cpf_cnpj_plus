require 'byebug'
module CpfCnpjPlus
  class Validator
    def self.valid_cnpj?(cnpj)
      cnpj = cnpj.to_s.upcase.gsub(/[^A-Z0-9]/, "")
      return false unless cnpj.length == 14
      return false unless cnpj[0..11] =~ /^[A-Z0-9]{12}$/ && cnpj[12..13] =~ /^[0-9]{2}$/

      base = cnpj[0..11].chars.map { |c| char_to_value(c) }
      dv = cnpj[12..13]

      dv_calc = calculate_cnpj_digits(base)
      dv == dv_calc
    end

    def self.valid_cpf?(cpf)
      cpf = cpf.to_s.gsub(/[^0-9]/, "")
      return false unless cpf.length == 11 && cpf =~ /^\d{11}$/
      first_digit(cpf) && second_digit(cpf)      
    end

    def self.first_digit(cpf)
      first_digit = cpf[0..8]
      soma = 0
      ponteiro = 10
      first_digit.chars.each do |char|
        res = (char.to_i * ponteiro)
        soma += res
        ponteiro -= 1
      end
      if soma * 10 % 11 == cpf[9].to_i
        true
      else      
        false
      end
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
      if soma * 10 % 11 == cpf[10].to_i || (soma * 10 % 11 == 10 && cpf[10].to_i == 0)
        true
      else      
        false
      end
    end

    # Conversão de caractere para valor numérico (novo padrão)
    def self.char_to_value(char)
      if ("0".."9").include?(char)
        char.ord - 48
      elsif ("A".."Z").include?(char)
        char.ord - 48
      else
        raise ArgumentError, "Caractere inválido"
      end
    end

    # Cálculo dos dígitos verificadores do CNPJ (novo padrão)
    def self.calculate_cnpj_digits(base)
      # Implemente o cálculo do módulo 11 conforme as regras da Receita Federal
      # Retorne os dois dígitos verificadores como string
      "00" # Placeholder
    end
  end
end
