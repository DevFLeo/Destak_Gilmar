require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'colorize'

# Configuração para o Sinatra rodar no WSL e ser acessível pelo navegador do Windows
set :bind, '0.0.0.0'

# Simulação da nossa Tese: Um banco de dados temporário (em memória)
# Futuramente, trocaremos isso por um banco de dados real.
ESTOQUE_FINANCEIRO = [
  { id: 1, item: "Consultoria Gilmar", valor: 5000.00, tipo: "Receita" },
  { id: 2, item: "Servidor Web", valor: -150.00, tipo: "Despesa" }
]

get '/' do
  @saldo = ESTOQUE_FINANCEIRO.sum { |t| t[:valor] }
  @transacoes = ESTOQUE_FINANCEIRO
  erb :dashboard
end

puts "\n" + "--- [DOMÍNIO FINANCEIRO ATIVADO] ---".bold.green
puts "Acesse o seu sistema em: ".cyan + "http://localhost:4567"