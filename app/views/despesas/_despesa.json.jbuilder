json.extract! despesa, :id, :data, :valor, :natureza, :ativo, :data_inclusao, :data_alteracao, :descricao_tipo_id, :created_at, :updated_at
json.url despesa_url(despesa, format: :json)
