require 'rails_helper'

RSpec.describe Usuario, type: :model do
    
    
    it "é valido" do 
        i = Condominio.new(saldo: 12.2)
        i = Condominio.new(fundo_reserva: 152)
        expect(i).to be_valid
end

    it "é invalido SALDO NEGATIVO" do
        
        i = Condominio.new(saldo: -1)
        i = Condominio.new(fundo_reserva: 150)
      
      expect(Condominio.new).to be_valid
        
    end
    
    it "é invalido FUndo de Reserva NEGATIVO" do
        
        i = Condominio.new(saldo: 1)
        i = Condominio.new(fundo_reserva: -150)
      
      expect(Condominio.new).to be_valid
        
    end
    
end