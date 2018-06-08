class DespesasController < ApplicationController
  include DespesasHelper
  before_action :set_despesa, only: [:show, :edit,:update, :destroy]
  before_action :authorize, except: []
  before_action :buscar_descricao_despesa, only: [:new, :edit, :update, :create]

  # GET /despesas
  # GET /despesas.json
  def index
    @despesas = Despesa.all
  end

  # GET /despesas/1
  # GET /despesas/1.json
  def show
  end

  # GET /despesas/new
  def new
    @despesa = Despesa.new
  end

  # GET /despesas/1/edit
  def edit
  end

  # POST /despesas
  # POST /despesas.json
  def create
    @despesa = Despesa.new(despesa_params)
    @despesa.ativo = true
    @despesa.data_inclusao = DateTime.now

    respond_to do |format|
      if @despesa.save
        calculo_saldo(@despesa, nil)
        format.html { redirect_to @despesa, notice: 'Despesa foi criada com sucesso!' }
        format.json { render :show, status: :created, location: @despesa }
      else
        format.html { render :new }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def mult_create
    despesasCadastradas = []
    @sucesso = true
    params["despesas"].each do |despesa|
      if despesa["valor"] != ""
        @despesa = Despesa.new(multi_despesa_params(despesa))
        @despesa.ativo = true
        @despesa.data_inclusao = DateTime.now
        if @despesa.save == false
          @sucesso = false
        else
            despesasCadastradas << @despesa
        end
      end
    end
    
    calcular_receitas(despesasCadastradas)
      
    respond_to do |format|
      if @sucesso
        format.html { redirect_to despesas_url, notice: 'Despesas foram criadas com sucesso!' }
        format.json { render :show, status: :created, location: despesas_url }
      else
        gerar_despesa_mensal
        format.html { render 'mensal' }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /despesas/1
  # PATCH/PUT /despesas/1.json
  def update
    @despesa.data_alteracao = DateTime.now
    old_valor = @despesa.valor
    respond_to do |format|
      if @despesa.update(despesa_params)
        calculo_saldo(@despesa, old_valor)
        format.html { redirect_to @despesa, notice: 'Despesa foi atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @despesa }
      else
        format.html { render :edit }
        format.json { render json: @despesa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /despesas/1
  # DELETE /despesas/1.json
  def destroy
    #@despesa.destroy
    @despesa.ativo = !@despesa.ativo
    @despesa.data_alteracao = DateTime.now
    respond_to do |format|
      if @despesa.update(@despesa.attributes)
        calculo_saldo(@despesa, nil)
        format.html { redirect_to despesas_url, notice: 'Despesa foi excluída com sucesso.' }
        format.json { head :no_content }
      else
        format.html { redirect_to despesas_url, notice: 'Despesa não foi excluída com sucesso.' }
        format.json { head :no_content }
      end
    end
  end
  
  def mensal
    gerar_despesa_mensal
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_despesa
      @despesa = Despesa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def despesa_params
      #params.require(:despesa).permit(:data, :valor, :natureza, :descricao_tipo_id)
      params.require(:despesa).permit(:data, :valor, :natureza, :descricao_tipo_id)
    end
    
    def multi_despesa_params(my_params)
      my_params.permit(:data, :valor, :natureza, :descricao_tipo_id)
    end
    
end
