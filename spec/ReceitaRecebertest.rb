    require 'rails_helper'

RSpec.describe ReceitaAReceber, type: :model do
    
    
    it "é valido" do 
        i = ReceitaAReceber.new(valor: 100)
        i = ReceitaAReceber.new(data: 12/12/2012)
        i = ReceitaAReceber.new(natureza: "Fundo de Reserva")
        i = ReceitaAReceber.new(ativo: 1)
        i = ReceitaAReceber.new(data_inclusao: 10/12/2016)
        i = ReceitaAReceber.new(data_alteracao: 11/12/2016)
        i = ReceitaAReceber.new(apartamento: nil)
        i = ReceitaAReceber.new(morador: nil)
        
        
        expect(Condominio.new).to be_valid
    end
    
    it "é invalido sem valor" do 
        i = ReceitaAReceber.new(valor: nil)
        i = ReceitaAReceber.new(data: 12/12/2012)
        i = ReceitaAReceber.new(natureza: "Fundo de Reserva")
        i = ReceitaAReceber.new(ativo: 1)
        i = ReceitaAReceber.new(data_inclusao: 10/12/2016)
        i = ReceitaAReceber.new(data_alteracao: 11/12/2016)
        i = ReceitaAReceber.new(apartamento: nil)
        i = ReceitaAReceber.new(morador: nil)
        
        
        expect(i).to_not be_valid
    end
    it "é invalido sem Data para Receber" do 
        i = ReceitaAReceber.new(valor: 100)
        i = ReceitaAReceber.new(data: nil)
        i = ReceitaAReceber.new(natureza: "Fundo de Reserva")
        i = ReceitaAReceber.new(ativo: 1)
        i = ReceitaAReceber.new(data_inclusao: 10/12/2016)
        i = ReceitaAReceber.new(data_alteracao: 11/12/2016)
        i = ReceitaAReceber.new(apartamento: nil)
        i = ReceitaAReceber.new(morador: nil)
        
        
        expect(i).to_not be_valid
    end
    it "é invalido sem ter natureza" do 
        i = ReceitaAReceber.new(valor: 100)
        i = ReceitaAReceber.new(data: 12/12/2012)
        i = ReceitaAReceber.new(natureza: nil)
        i = ReceitaAReceber.new(ativo: 1)
        i = ReceitaAReceber.new(data_inclusao: 10/12/2016)
        i = ReceitaAReceber.new(data_alteracao: 11/12/2016)
        i = ReceitaAReceber.new(apartamento: nil)
        i = ReceitaAReceber.new(morador: nil)
        
        
        expect(i).to_not be_valid
    end
    

end
    
    