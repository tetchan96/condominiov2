json.extract! veiculo, :id, :marca, :modelo, :cor, :placa, :ativo, :data_inclusao, :data_alteracao, :apartamento_id, :created_at, :updated_at
json.url veiculo_url(veiculo, format: :json)
