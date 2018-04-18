class FuncionariosController < ApplicationController
  include FuncionariosHelper
  before_action :set_funcionario, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: []
  before_action :buscar_apartamentos, only: [:new, :edit]
  # GET /funcionarios
  # GET /funcionarios.json
  def index
    @funcionarios = Funcionario.all
  end

  # GET /funcionarios/1
  # GET /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
    @funcionario.apartamento = current_apartamento
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios
  # POST /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)
    @funcionario.ativo = true
    @funcionario.data_inclusao = DateTime.now

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to @funcionario, notice: 'Funcionario was successfully created.' }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1
  # PATCH/PUT /funcionarios/1.json
  def update
    @funcionario.data_alteracao = DateTime.now
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to @funcionario, notice: 'Funcionario was successfully updated.' }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1
  # DELETE /funcionarios/1.json
  def destroy
    #@funcionario.destroy
    @funcionario.ativo = !@funcionario.ativo
    @funcionario.data_alteracao = DateTime.now
    respond_to do |format|
      if @funcionario.update(@funcionario.attributes)
        format.html { redirect_to @funcionario.apartamento, notice: 'Funcionario was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to @funcionario.apartamento, notice: 'Funcionario wasn\'t successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcionario_params
      params.require(:funcionario).permit(:nome, :tel, :dias_autorizados, :apartamento_id)
    end
end
