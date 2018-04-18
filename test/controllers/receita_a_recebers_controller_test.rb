require 'test_helper'

class ReceitaARecebersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receita_a_receber = receita_a_recebers(:one)
  end

  test "should get index" do
    get receita_a_recebers_url
    assert_response :success
  end

  test "should get new" do
    get new_receita_a_receber_url
    assert_response :success
  end

  test "should create receita_a_receber" do
    assert_difference('ReceitaAReceber.count') do
      post receita_a_recebers_url, params: { receita_a_receber: { apartamento_id: @receita_a_receber.apartamento_id, ativo: @receita_a_receber.ativo, data: @receita_a_receber.data, data_alteracao: @receita_a_receber.data_alteracao, data_inclusao: @receita_a_receber.data_inclusao, descricao_tipo_id: @receita_a_receber.descricao_tipo_id, morador_id: @receita_a_receber.morador_id, natureza: @receita_a_receber.natureza, valor: @receita_a_receber.valor } }
    end

    assert_redirected_to receita_a_receber_url(ReceitaAReceber.last)
  end

  test "should show receita_a_receber" do
    get receita_a_receber_url(@receita_a_receber)
    assert_response :success
  end

  test "should get edit" do
    get edit_receita_a_receber_url(@receita_a_receber)
    assert_response :success
  end

  test "should update receita_a_receber" do
    patch receita_a_receber_url(@receita_a_receber), params: { receita_a_receber: { apartamento_id: @receita_a_receber.apartamento_id, ativo: @receita_a_receber.ativo, data: @receita_a_receber.data, data_alteracao: @receita_a_receber.data_alteracao, data_inclusao: @receita_a_receber.data_inclusao, descricao_tipo_id: @receita_a_receber.descricao_tipo_id, morador_id: @receita_a_receber.morador_id, natureza: @receita_a_receber.natureza, valor: @receita_a_receber.valor } }
    assert_redirected_to receita_a_receber_url(@receita_a_receber)
  end

  test "should destroy receita_a_receber" do
    assert_difference('ReceitaAReceber.count', -1) do
      delete receita_a_receber_url(@receita_a_receber)
    end

    assert_redirected_to receita_a_recebers_url
  end
end
