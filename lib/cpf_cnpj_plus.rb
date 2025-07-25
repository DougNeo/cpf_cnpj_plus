# frozen_string_literal: true

require_relative "cpf_cnpj_plus/version"
require_relative "cpf_cnpj_plus/validator"
require_relative "cpf_cnpj_plus/format"
require_relative "cpf_cnpj_plus/generate"

# Módulo principal da gem cpf_cnpj_plus.
# Fornece métodos para validação, geração e formatação de CPFs e CNPJs,
# incluindo suporte ao novo padrão de CNPJ alfanumérico.
module CpfCnpjPlus
  class Error < StandardError; end

  def self.valid_cnpj?(cnpj)
    CpfCnpjPlus::Validator::Cnpj.valid?(cnpj)
  end

  def self.valid_cpf?(cpf)
    CpfCnpjPlus::Validator::Cpf.valid?(cpf)
  end

  def self.format_cpf(cpf)
    CpfCnpjPlus::Format::Cpf.format(cpf)
  end

  def self.unformat_cpf(cpf)
    CpfCnpjPlus::Format::Cpf.desformatar(cpf)
  end

  def self.format_cnpj(cnpj)
    CpfCnpjPlus::Format::Cnpj.format(cnpj)
  end

  def self.unformat_cnpj(cnpj)
    CpfCnpjPlus::Format::Cnpj.desformatar(cnpj)
  end

  def self.generate_cpf
    CpfCnpjPlus::Generate::Cpf.generate
  end

  def self.generate_cnpj(alfa = false)
    CpfCnpjPlus::Generate::Cnpj.generate(alfa)
  end
end
