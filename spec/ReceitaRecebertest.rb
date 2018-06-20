    require 'rails_helper'

RSpec.describe ReceitaAReceber, type: :model do
    
    
    it "é valido" do 
        i = ReceitaAReceber.new
        
        i.valor = 100
        i.data = 12/12/2012
        i.natureza = "Fundo de Reserva"
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        i.apartamento = nil
        i.morador = nil
        i = Apartamento.new
        i = Condominio.new
        
        expect(i).to be_valid
    end
    
    it "é invalido sem valor" do 
        i = ReceitaAReceber.new
        i.valor = nil
        i.data = 12/12/2012
        i.natureza = "Fundo de Reserva"
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        i.apartamento = nil
        i.morador = nil
        
        
        expect(i).to_not be_valid
    end
    it "é invalido sem Data para Receber" do 
        i = ReceitaAReceber.new
        i.valor = 100
        i.data = nil
        i.natureza = "Fundo de Reserva"
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        i.apartamento = nil
        i.morador = nil
        
        
        expect(i).to_not be_valid
    end
    it "é invalido sem ter natureza" do 
        i = ReceitaAReceber.new
       i.valor = 100
        i.data = 12/12/2012
        i.natureza = nil
        i.ativo = 1
        i.data_inclusao = 10/12/2016
        i.data_alteracao = 11/12/2016
        i.apartamento = nil
        i.morador = nil
        
        
        expect(i).to_not be_valid
    end
    

end
    
    