json.extract! receita_a_receber, :id, :valor, :data, :natureza, :ativo, :data_inclusao, :data_alteracao, :apartamento_id, :descricao_tipo_id, :morador_id, :created_at, :updated_at
json.url receita_a_receber_url(receita_a_receber, format: :json)
