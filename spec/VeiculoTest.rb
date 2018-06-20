require 'rails_helper'

RSpec.describe Veiculo, type: :model do
    
    
    it "é valido" do 
        i = Veiculo.new
        i.marca = "Ferrari"
        i.modelo = "456Spyder"
        i.cor = "Dourado"
        i.ativo = 1
        i.placa = "0210"
        i.id = 1
        i = Apartamento.new
        i = Condominio.new
        expect(i).to be_valid
    end
    it "é invalido sem marca " do
        i = Veiculo.new
        i.marca = nil
        i.modelo = "456Spyder"
        i.cor = "Dourado"
        i.ativo = 1
        i.placa = "0210"
        i.id = 1
    end
    
    it "é invalido sem placa" do 
        i = Veiculo.new
        i.marca = "Ferrari"
        i.modelo = "456Spyder"
        i.cor = "Dourado"
        i.ativo = 1
        i.placa = nil
        i.id = 1
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem modelo" do 
        i = Veiculo.new
        i.marca = "FUSCÃO DE AÇO"
        i.modelo = nil
        i.cor = "Dourado"
        i.ativo = 1
        i.placa = "0210"
        i.id = 1
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem cor" do 
        i = Veiculo.new
        i.marca = "Ferrari"
        i.modelo = "456Spyder"
        i.cor = nil
        i.ativo = 1
        i.placa = "0210"
        i.id = 1
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem placa" do 
    i = Veiculo.new
        i.marca = "Teste"
        i.modelo = "456Spyder"
        i.cor = "Dourado"
        i.ativo = 1
        i.placa = nil
        i.id = 1
        
        expect(i).to_not be_valid
    end
    
    

end