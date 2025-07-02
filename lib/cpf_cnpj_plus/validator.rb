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
      first_part = cpf[0..8]
      soma = 0
      first_part.chars.each do |char|

      
      false
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
