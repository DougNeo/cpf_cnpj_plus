# frozen_string_literal: true

module CpfCnpjPlus
  module Generate
    class Cnpj
      # Gera um CNPJ válido.
      # @return [String] CNPJ formatado.
      def self.generate(alfa = false)
        return generate_alfa if alfa

        generate_numeric
      end

      def self.generate_numeric
        # Gera um CNPJ numérico válido.
        base = Array.new(12) { rand(0..9) }.join
        digits = calculate_digits(base)
        "#{base}#{digits}".insert(2, ".").insert(6, ".").insert(10, "/").insert(15, "-")
      end

      def self.generate_alfa
        # Gera um CNPJ alfanumérico válido.
        base = Array.new(12) { rand(0..9) }.join
        digits = calculate_digits(base)
        cnpj = "#{base}#{digits}"
        cnpj = cnpj.insert(2, ".").insert(6, ".").insert(10, "/").insert(15, "-")
        cnpj + ("A".."Z").to_a.sample(3).join
      end

      # Calcula os dígitos verificadores do CNPJ.
      # @param base [String] Base do CNPJ (12 dígitos).
      # @return [String] Dígitos verificadores (2 dígitos).
      def self.calculate_digits(base)
        digits = []
        2.times do |i|
          sum = 0
          weight = 5 + i
          base.chars.each_with_index do |char, _index|
            sum += char.to_i * weight
            weight -= 1
            weight = 9 if weight < 2
          end
          digit = (sum * 10) % 11
          digit = 0 if digit == 10
          digits << digit
        end
        digits.join
      end
    end
  end
end
