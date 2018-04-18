json.extract! usuario, :login, :senha
json.url logar_url(usuario, format: :json)
