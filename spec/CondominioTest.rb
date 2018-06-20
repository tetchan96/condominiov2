require 'rails_helper'

RSpec.describe Condominio, type: :model do
    
    
    it "é valido" do
        i = Condominio.new
        i.saldo = 12.2
        i.fundo_reserva = 152
        
        expect(i).to be_valid
        
end

    it "é invalido SALDO NEGATIVO" do
        i = Condominio.new
        i.saldo = -12.2
        i.fundo_reserva = 152
       
       expect(Condominio.new).to be_valid
        
    end
    
    it "é invalido com fundo de reserva negativo" do
        
       i = Condominio.new
       i.saldo = 12.2
       i.fundo_reserva = -150
       
       expect(Condominio.new).to be_valid
        
    end
    
end