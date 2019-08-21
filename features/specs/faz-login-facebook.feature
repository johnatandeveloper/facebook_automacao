#language:pt
@login
Funcionalidade: Login - Facebook

  Para verificar as tentativas de acesso
  Como um usuário do Facebook
  Quero validar os acessos realizados

  Contexto: Página principal
    Dado que eu acesse a página de login

  Esquema do Cenário: Login com dados inválidos

    Quando quando faço a tentativa de login com "<login>" e "<senha>" inválidos
    Então o sistema deve impedir a tentativa de login e apresentar uma "<mensagem>" de erro

    Exemplos:

      |login                |senha      |mensagem |
      |teste@teste.com      |123456     |A senha inserida está incorreta. Esqueceu a senha?                                                           |
      |                     |123456     |O email ou o número de telefone inserido não corresponde a nenhuma conta.                                    |
      |teste@teste.com      |           |A senha inserida está incorreta. Esqueceu a senha?                                                           |
      |teste*teste.com      |123456     |O email ou o número de telefone inserido não corresponde a nenhuma conta. Cadastre-se para abrir uma conta.  |

