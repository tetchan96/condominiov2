require 'rails_helper'

RSpec.describe Veiculo, type: :model do
    
    
    it "é valido" do 
        i = Veiculo.new(marca: "Ferrari")
        i = Veiculo.new(modelo: "456Spyder")
        i = Veiculo.new(cor: "Dourado")
        i = Veiculo.new(ativo: 1)
        i = Veiculo.new(placa: "0210")
        i = Veiculo.new(apartamento: nil)
        i = Veiculo.new(apartamento_id: 1)
        i = Veiculo.new(id: 1)
        
        #expect(i).to be_valid
    end
    
    it "é invalido sem placa" do 
        i = Veiculo.new(marca: nil)
        i = Veiculo.new(modelo: "456Spyder")
        i = Veiculo.new(cor: "Dourado")
        i = Veiculo.new(ativo: 1)
        i = Veiculo.new(placa: "0210")
        i = Veiculo.new(apartamento: nil)
        i = Veiculo.new(apartamento_id: 1)
        i = Veiculo.new(id: 1)
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem modelo" do 
        i = Veiculo.new(marca: "Ferrari")
        i = Veiculo.new(modelo: nil)
        i = Veiculo.new(cor: "Dourado")
        i = Veiculo.new(ativo: 1)
        i = Veiculo.new(placa: "0210")
        i = Veiculo.new(apartamento: nil)
        i = Veiculo.new(apartamento_id: 1)
        i = Veiculo.new(id: 1)
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem cor" do 
        i = Veiculo.new(marca: "Ferrari")
        i = Veiculo.new(modelo: "456Spyder")
        i = Veiculo.new(cor: nil)
        i = Veiculo.new(ativo: 1)
        i = Veiculo.new(placa: "0210")
        i = Veiculo.new(apartamento: nil)
        i = Veiculo.new(apartamento_id: 1)
        i = Veiculo.new(id: 1)
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem placa" do 
        i = Veiculo.new(marca: "Ferrari")
        i = Veiculo.new(modelo: "456Spyder")
        i = Veiculo.new(cor: "Prata")
        i = Veiculo.new(ativo: 1)
        i = Veiculo.new(placa: nil)
        i = Veiculo.new(apartamento: nil)
        i = Veiculo.new(apartamento_id: 1)
        i = Veiculo.new(id: 1)
        
        expect(i).to_not be_valid
    end
    
    

end