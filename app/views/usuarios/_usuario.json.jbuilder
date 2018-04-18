json.extract! usuario, :id, :nome, :login, :senha, :ativo, :data_inclusao, :data_alteracao, :condominio_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
