json.extract! morador, :id, :nome, :rg, :cpf, :tel_residencial, :tel_celular, :tel_comercial, :ramal, :email, :parentesco, :tipo, :ativo, :data_inclusao, :data_alteracao, :apartamento_id, :created_at, :updated_at
json.url morador_url(morador, format: :json)
