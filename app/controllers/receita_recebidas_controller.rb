class ReceitaRecebidasController < ApplicationController
  include ReceitaRecebidasHelper
  before_action :set_receita_recebida, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: []
  # GET /receita_recebidas
  # GET /receita_recebidas.json
  def index
    @receita_recebidas = ReceitaRecebida.all
  end

  # GET /receita_recebidas/1
  # GET /receita_recebidas/1.json
  def show
  end

  # GET /receita_recebidas/new
  def new
    @receita_recebida = ReceitaRecebida.new
  end

  # GET /receita_recebidas/1/edit
  def edit
  end

  # POST /receita_recebidas
  # POST /receita_recebidas.json
  def create
    @receita_recebida = ReceitaRecebida.new(receita_recebida_params)
    @receita_recebida.ativo = true
    @receita_recebida.data_inclusao = DateTime.now
    respond_to do |format|
      if @receita_recebida.save
        format.html { redirect_to @receita_recebida, notice: 'Receita recebida was successfully created.' }
        format.json { render :show, status: :created, location: @receita_recebida }
      else
        format.html { render :new }
        format.json { render json: @receita_recebida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receita_recebidas/1
  # PATCH/PUT /receita_recebidas/1.json
  def update
    @receita_recebida.data_alteracao = DateTime.now
    respond_to do |format|
      if @receita_recebida.update(receita_recebida_params)
        format.html { redirect_to @receita_recebida, notice: 'Receita recebida was successfully updated.' }
        format.json { render :show, status: :ok, location: @receita_recebida }
      else
        format.html { render :edit }
        format.json { render json: @receita_recebida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receita_recebidas/1
  # DELETE /receita_recebidas/1.json
  def destroy
    #@receita_recebida.destroy
    @receita_recebida.ativo = !@receita_recebida.ativo
    @receita_recebida.data_alteracao = DateTime.now
    respond_to do |format|
      if @receita_recebida.update(@receita_recebida.attributes)
        format.html { redirect_to receita_recebidas_url, notice: 'Receita recebida was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to receita_recebidas_url, notice: 'Receita recebida wasn\'t successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receita_recebida
      @receita_recebida = ReceitaRecebida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receita_recebida_params
      params.require(:receita_recebida).permit(:valor, :data, :ativo, :data_inclusao, :data_alteracao, :receita_a_receber_id)
    end
end
