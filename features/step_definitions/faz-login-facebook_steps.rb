include RSpec::Matchers


Dado("que eu acesse a página de login") do
  @LoginPage = LoginPage.new
  @LoginPage.valida_pag_inicial
end

Quando("quando faço a tentativa de login com {string} e {string} inválidos") do |login, senha|
  @LoginPage = LoginPage.new
  @LoginPage.faz_login(login, senha)
end

Então("o sistema deve impedir a tentativa de login e apresentar uma {string} de erro") do |mensagem|
  @LoginPage = LoginPage.new
  @LoginPage.notifica_login(mensagem)
end