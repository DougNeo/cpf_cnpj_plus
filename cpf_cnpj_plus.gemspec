# frozen_string_literal: true

require_relative "lib/cpf_cnpj_plus/version"

Gem::Specification.new do |spec|
  spec.name = "cpf_cnpj_plus"
  spec.version = CpfCnpjPlus::VERSION
  spec.authors = ["DougNeo"]
  spec.email = ["doug.neo@gmail.com"]

  spec.summary = "TODO: Write a short summary, because RubyGems requires one."
  spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "simplecov"


  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end







# frozen_string_literal: true

require_relative "lib/cpf_cnpj_plus/version"

Gem::Specification.new do |spec|
  spec.name          = "cpf_cnpj_plus"
  spec.version       = CpfCnpjPlus::VERSION
  spec.authors       = ["DougNeo"]
  spec.email         = ["doug.neo@gmail.com"]

  spec.summary       = "Validação, geração e formatação de números de CPF e CNPJ para o Brasil."
  spec.description   = "Fornece métodos práticos para validar, gerar e formatar números de CPF e CNPJ, incluindo ferramentas de linha de comando para facilitar integrações em sistemas bancários, governamentais e aplicações Ruby em geral."
  

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
  spec.add_development_dependency "simplecov"

  # Perguntas:
  # - Seu projeto é um fork ou extensão de alguma gem existente? Se sim, cite a gem base.
  # - Qual o endereço do repositório público (GitHub, GitLab, etc.)?
  # - Há dependências obrigatórias além do próprio Ruby?
end
