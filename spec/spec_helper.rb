# frozen_string_literal: true

require "cpf_cnpj_plus"
require "simplecov"
SimpleCov.start do
  add_filter "/spec/" # Ignora a pasta de testes nos relatórios
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
