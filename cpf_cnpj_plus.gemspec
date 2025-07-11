# frozen_string_literal: true

require_relative "lib/cpf_cnpj_plus/version"

Gem::Specification.new do |spec|
  spec.name          = "cpf_cnpj_plus"
  spec.version       = CpfCnpjPlus::VERSION
  spec.authors       = ["DougNeo"]
  spec.email         = ["doug.neo@gmail.com"]

  spec.summary       = "Validação, geração e formatação de números de CPF e CNPJ para o Brasil."
  spec.description   = "Fornece métodos práticos para validar, gerar e formatar números de CPF e CNPJ, incluindo
                        ferramentas de linha de comando para facilitar integrações em sistemas bancários,
                        governamentais e aplicações Ruby em geral."

  spec.homepage      = "https://github.com/DougNeo/cpf_cnpj_plus.git"

  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"]     = spec.homepage
  spec.metadata["source_code_uri"]  = "https://github.com/DougNeo/cpf_cnpj_plus.git"
  spec.metadata["changelog_uri"]    = "https://github.com/DougNeo/cpf_cnpj_plus.git/blob/main/CHANGELOG.md"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "simplecov"
end
