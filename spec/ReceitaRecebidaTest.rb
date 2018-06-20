require 'rails_helper'

RSpec.describe ReceitaRecebida, type: :model do
    
    
    it "é valido" do 
        
        i = ReceitaRecebida.new
        i.valor = 100
        i.data = 12/12/2012
        i.ativo = 1
        i.receita_a_receber = nil
        i = ReceitaAReceber.new
        i = Apartamento.new
        i = Condominio.new
    
        expect(i).to be_valid
    end
    
    it "é invalido sem valor" do 
        i = ReceitaRecebida.new
        i.valor = nil
        i.data = 12/12/2012
        i.ativo = 1
        i.receita_a_receber = nil
    
        expect(i).to_not be_valid
    end
    
    it "é invalido sem Data" do 
        i = ReceitaRecebida.new
        i.valor = 100
        i.data = nil
        i.ativo = 1
        i.receita_a_receber = nil
    
        expect(i).to_not be_valid
    end
    
    it "é invalido sem receita_a_receber" do 
        i = ReceitaRecebida.new
        i.valor = 100
        i.data = 12/12/2012
        i.ativo = 1
        i.receita_a_receber = nil
    
        expect(i).to_not be_valid
    end


    
end


