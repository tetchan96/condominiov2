json.extract! receita_recebida, :id, :valor, :data, :ativo, :data_inclusao, :data_alteracao, :receita_a_receber_id, :created_at, :updated_at
json.url receita_recebida_url(receita_recebida, format: :json)
