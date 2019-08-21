class LoginPage < SitePrism::Page
  include Capybara::DSL

  #Texto da pagina
  element :div_span_text, "#header_block"

  #Login
  element :input_user, "#email"
  element :input_pass, "#pass"
  element :button_login, "#loginbutton"

  element :div_notifica_login, "div[role='alert']"


  def faz_login(login, senha)
    input_user.set(login)
    input_pass.set(senha)
    button_login.click
  end

  def notifica_login(mensagem)
    expect(div_notifica_login.text()).to include mensagem
  end


  def valida_pag_inicial
    expect(div_span_text.text()).to include "Entrar no Facebook"
  end

end