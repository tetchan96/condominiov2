require 'test_helper'

class ReceitaRecebidasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receita_recebida = receita_recebidas(:one)
  end

  test "should get index" do
    get receita_recebidas_url
    assert_response :success
  end

  test "should get new" do
    get new_receita_recebida_url
    assert_response :success
  end

  test "should create receita_recebida" do
    assert_difference('ReceitaRecebida.count') do
      post receita_recebidas_url, params: { receita_recebida: { ativo: @receita_recebida.ativo, data: @receita_recebida.data, data_alteracao: @receita_recebida.data_alteracao, data_inclusao: @receita_recebida.data_inclusao, receita_a_receber_id: @receita_recebida.receita_a_receber_id, valor: @receita_recebida.valor } }
    end

    assert_redirected_to receita_recebida_url(ReceitaRecebida.last)
  end

  test "should show receita_recebida" do
    get receita_recebida_url(@receita_recebida)
    assert_response :success
  end

  test "should get edit" do
    get edit_receita_recebida_url(@receita_recebida)
    assert_response :success
  end

  test "should update receita_recebida" do
    patch receita_recebida_url(@receita_recebida), params: { receita_recebida: { ativo: @receita_recebida.ativo, data: @receita_recebida.data, data_alteracao: @receita_recebida.data_alteracao, data_inclusao: @receita_recebida.data_inclusao, receita_a_receber_id: @receita_recebida.receita_a_receber_id, valor: @receita_recebida.valor } }
    assert_redirected_to receita_recebida_url(@receita_recebida)
  end

  test "should destroy receita_recebida" do
    assert_difference('ReceitaRecebida.count', -1) do
      delete receita_recebida_url(@receita_recebida)
    end

    assert_redirected_to receita_recebidas_url
  end
end
