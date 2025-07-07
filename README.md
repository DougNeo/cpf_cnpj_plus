# CPF CNPJ Plus

**cpf_cnpj_plus** é uma biblioteca Ruby para **validar, gerar e formatar** números de CPF e CNPJ brasileiros, tanto via código Ruby quanto pela linha de comando.

---

## 🚀 Novidade: Suporte a CNPJ Alfanumérico

> **Atenção:** Esta gem já está atualizada para validar e formatar os novos CNPJs alfanuméricos, conforme a alteração anunciada pela Receita Federal para julho de 2026.  
> Assim, seu sistema estará pronto para lidar tanto com o formato tradicional quanto com o novo padrão de CNPJ.

---

## Instalação

Adicione esta linha ao seu Gemfile:

```ruby
gem "cpf_cnpj_plus"
```


E execute:

```bash
bundle install
```
Ou instale diretamente com:

```bash
gem install cpf_cnpj_plus
```

## Uso Básico

### API Ruby

A gem oferece uma API unificada para CPF e CNPJ. Exemplos:

```ruby
require "cpf_cnpj_plus"

CPF
CPFPlus.format("12345678909") # => "123.456.789-09"
CPFPlus.valid?("123.456.789-09") # => true ou false
CPFPlus.generate # => Gera um CPF válido

CNPJ
CNPJPlus.format("12345678000195") # => "12.345.678/0001-95"
CNPJPlus.valid?("12.345.678/0001-95") # => true ou false
CNPJPlus.generate # => Gera um CNPJ válido

CNPJ Alfanumérico (novo formato)
CNPJPlus.valid?("A1234567B00195") # => true ou false
CNPJPlus.format("A1234567B00195") # => "A12.345.67B/0019-5"
CNPJPlus.generate # => Gera um CNPJ alfanumérico válido
```


### Linha de comando

A gem fornece comandos CLI:

```bash
$ cpf_plus --check 123.456.789-09
$ cpf_plus --format 12345678909
$ cpf_plus --generate
$ cnpj_plus --check 12.345.678/0001-95
$ cnpj_plus --check A12.345.67B/0019-5
$ cnpj_plus --generate
```

## Compatibilidade

- Ruby >= 3.1.0

## Contribuição

1. Faça um fork do projeto
2. Crie sua branch (`git checkout -b minha-feature`)
3. Commit suas alterações (`git commit -am 'Adiciona nova feature'`)
4. Faça push para a branch (`git push origin minha-feature`)
5. Abra um Pull Request

## Licença

MIT

---

*Para dúvidas ou sugestões, abra uma issue ou envie um pull request!*


