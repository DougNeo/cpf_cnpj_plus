# frozen_string_literal: true

require_relative "cpf_cnpj_plus/version"
require_relative "cpf_cnpj_plus/validator"

module CpfCnpjPlus
  class Error < StandardError; end
  def self.valid_cnpj?(cnpj)
    CpfCnpjPlus::Validator::Cnpj.valid?(cnpj)
  end

  def self.valid_cpf?(cpf)
    CpfCnpjPlus::Validator::Cpf.valid?(cpf)
  end
end
