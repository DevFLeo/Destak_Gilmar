require 'bundler/setup'
require 'colorize'

puts "\n" + "--- [INICIANDO: DESTAK_GILMAR] ---".bold.cyan
puts "Analisando Git status".italic

status_do_git = `git status --short`.strip

if status_do_git.empty?
  puts "Tudo limpo".green
  puts "Status: ".white + "ATIVO".green.on_black.bold
else
  puts "ALERTA: Arquivos não monitorados ou alterados encontrados!".red.bold
  puts "------------------------------------------------"
  puts status_do_git.yellow
  puts "------------------------------------------------"
  puts "Sugestão: ".cyan + "Sincronize as alterações."
end

puts "--- [CONCLUÍD] ---".bold.cyan + "\n\n"