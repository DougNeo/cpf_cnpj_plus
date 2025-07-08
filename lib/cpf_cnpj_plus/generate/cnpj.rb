module CpfCnpjPlus
  module Generate
    class Cnpj
      # Gera um CNPJ válido.
      # @return [String] CNPJ formatado.
      def self.generate
        base = Array.new(12) { rand(0..9) }.join
        digits = calculate_digits(base)
        "#{base}#{digits}".insert(2, '.').insert(6, '.').insert(10, '/').insert(15, '-')
      end

      private

      # Calcula os dígitos verificadores do CNPJ.
      # @param base [String] Base do CNPJ (12 dígitos).
      # @return [String] Dígitos verificadores (2 dígitos).
      def self.calculate_digits(base)
        digits = []
        2.times do |i|
          sum = 0
          weight = 5 + i
          base.chars.each_with_index do |char, index|
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