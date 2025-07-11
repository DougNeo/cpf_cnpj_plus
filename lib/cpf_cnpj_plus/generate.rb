# frozen_string_literal: true

module CpfCnpjPlus
  # Módulo responsável por agrupar métodos de formatação de CPF e CNPJ.
  # Fornece métodos para formatar documentos brasileiros,
  # incluindo suporte a formatos tradicionais e futuros (como CNPJ alfanumérico).
  module Generate
    require_relative "generate/cnpj"
    require_relative "generate/cpf"
  end
end
