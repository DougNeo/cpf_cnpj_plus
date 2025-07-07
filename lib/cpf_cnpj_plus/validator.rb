# frozen_string_literal: true

module CpfCnpjPlus
  # Módulo responsável por agrupar validadores de CPF e CNPJ.
  # Fornece métodos e classes auxiliares para validação de documentos brasileiros,
  # incluindo suporte a formatos tradicionais e futuros (como CNPJ alfanumérico).
  module Validator
    require_relative "validator/cnpj"
    require_relative "validator/cpf"
  end
end
