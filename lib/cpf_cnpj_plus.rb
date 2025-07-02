# frozen_string_literal: true

require_relative "cpf_cnpj_plus/version"
require_relative "cpf_cnpj_plus/validator"

module CpfCnpjPlus
  class Error < StandardError; end
  def self.valid_cnpj?(cnpj)
    Validator.valid_cnpj?(cnpj)
  end

  def self.valid_cpf?(cpf)
    Validator.valid_cpf?(cpf)
  end
end
