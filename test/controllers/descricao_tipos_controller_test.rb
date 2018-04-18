require 'test_helper'

class DescricaoTiposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @descricao_tipo = descricao_tipos(:one)
  end

  test "should get index" do
    get descricao_tipos_url
    assert_response :success
  end

  test "should get new" do
    get new_descricao_tipo_url
    assert_response :success
  end

  test "should create descricao_tipo" do
    assert_difference('DescricaoTipo.count') do
      post descricao_tipos_url, params: { descricao_tipo: { ativo: @descricao_tipo.ativo, data_alteracao: @descricao_tipo.data_alteracao, data_inclusao: @descricao_tipo.data_inclusao, natureza: @descricao_tipo.natureza, nome: @descricao_tipo.nome, valor_fixo: @descricao_tipo.valor_fixo } }
    end

    assert_redirected_to descricao_tipo_url(DescricaoTipo.last)
  end

  test "should show descricao_tipo" do
    get descricao_tipo_url(@descricao_tipo)
    assert_response :success
  end

  test "should get edit" do
    get edit_descricao_tipo_url(@descricao_tipo)
    assert_response :success
  end

  test "should update descricao_tipo" do
    patch descricao_tipo_url(@descricao_tipo), params: { descricao_tipo: { ativo: @descricao_tipo.ativo, data_alteracao: @descricao_tipo.data_alteracao, data_inclusao: @descricao_tipo.data_inclusao, natureza: @descricao_tipo.natureza, nome: @descricao_tipo.nome, valor_fixo: @descricao_tipo.valor_fixo } }
    assert_redirected_to descricao_tipo_url(@descricao_tipo)
  end

  test "should destroy descricao_tipo" do
    assert_difference('DescricaoTipo.count', -1) do
      delete descricao_tipo_url(@descricao_tipo)
    end

    assert_redirected_to descricao_tipos_url
  end
end
