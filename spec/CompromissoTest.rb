require 'rails_helper'

RSpec.describe Compromisso, type: :model do
    
    
    it "é valido" do 
        i = Compromisso.new
        i.titulo = "100"
        i.texto = "1"
        i.date = 10/12/2016
        
        expect(i).to be_valid
    end
    
    it "é invalido sem título" do 
        i = Compromisso.new
        i.titulo = nil
        i.texto = "1"
        i.date = 10/12/2016
        
            expect(i).to_not be_valid
    end
    
    it "é invalido sem texto" do 
        i = Compromisso.new
        i.titulo = "Testando"
        i.texto = nil
        i.date = 10/12/2016
        
        expect(i).to_not be_valid
    end
    
    it "é invalido sem data de realização" do 
        i = Compromisso.new
        i.titulo = "Teste"
        i.texto = "1"
        i.date = nil
        
        expect(i).to_not be_valid
    end

end

