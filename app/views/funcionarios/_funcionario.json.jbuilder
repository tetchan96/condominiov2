json.extract! funcionario, :id, :nome, :tel, :dias_autorizados, :ativo, :data_inclusao, :data_alteracao, :apartamento_id, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
