require 'rails_helper'

RSpec.describe ReceitaRecebida, type: :model do
    
    
    it "é valido" do 
        i = ReceitaRecebida.new(valor: 100)
        i = ReceitaRecebida.new(data: 12/12/2012)
        i = ReceitaRecebida.new(ativo: 1)
        i = ReceitaRecebida.new(receita_a_receber: nil)
    
        #expect(i).to be_valid
    end
    
    it "é invalido sem valor" do 
        i = ReceitaRecebida.new(valor: nil)
        i = ReceitaRecebida.new(data: 12/12/2012)
        i = ReceitaRecebida.new(ativo: 1)
        i = ReceitaRecebida.new(receita_a_receber: nil)
    
        expect(i).to_not be_valid
    end
    
    it "é invalido sem Data" do 
        i = ReceitaRecebida.new(valor: 100)
        i = ReceitaRecebida.new(data: nil)
        i = ReceitaRecebida.new(ativo: 1)
        i = ReceitaRecebida.new(receita_a_receber: nil)
    
        expect(i).to_not be_valid
    end
    
    it "é invalido sem receita_a_receber" do 
        i = ReceitaRecebida.new(valor: 100)
        i = ReceitaRecebida.new(data: 12/12/2016)
        i = ReceitaRecebida.new(ativo: 1)
        i = ReceitaRecebida.new(receita_a_receber: nil)
    
        expect(i).to_not be_valid
    end


    
end


