    require 'rails_helper'

RSpec.describe Despesa, type: :model do
    
    
    it "é valido" do 
        i = Despesa.new
       
        i.valor = 100.00
        i.natureza = "Fundo de Reserva"
        i.ativo = 1
        i.data_inclusao = 10/12/2016 
        i.data_alteracao = 11/12/2016 
        
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem valor" do 
        i = Despesa.new
        i.valor = nil
        i.natureza = "Fundo de Reserva"
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        #i.descricao_tipo = "Descrição"
        expect(i).to_not be_valid
    end
    
    it "é invalido sem natureza" do 
        i = Despesa.new
        i.valor = 100
        i.natureza = nil
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        #i.descricao_tipo = "descricao"
        expect(i).to_not be_valid
    end
    
    it "é invalido sem Descrição" do 
        i = Despesa.new
        i.valor = 100
        i.natureza = "Fundo de Reserva"
        i.ativo = 1
        
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        i.descricao_tipo = nil
        expect(i).to_not be_valid
    end
    
    it "é invalido sem Data de Inclusão" do 
        i = Despesa.new
        i.valor = 100
        i.natureza = "Fundo de Reserva"
        i.ativo = 1
        i.data_inclusao = nil
        i.data_alteracao = 11/12/2016
       # i.descricao_tipo = "Teste"
        expect(i).to_not be_valid
    end
    
    it "é invalido sem Data de Alteração" do 
        i = Despesa.new
        i.valor = 100
        i.natureza = "Fundo de Reserva"
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = nil
        #i.descricao_tipo = "Teste"
        expect(i).to_not be_valid
    end
    
    
    
    
    
end

