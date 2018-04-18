require 'test_helper'

class MoradorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @morador = moradors(:one)
  end

  test "should get index" do
    get moradors_url
    assert_response :success
  end

  test "should get new" do
    get new_morador_url
    assert_response :success
  end

  test "should create morador" do
    assert_difference('Morador.count') do
      post moradors_url, params: { morador: { apartamento_id: @morador.apartamento_id, ativo: @morador.ativo, cpf: @morador.cpf, data_alteracao: @morador.data_alteracao, data_inclusao: @morador.data_inclusao, email: @morador.email, nome: @morador.nome, parentesco: @morador.parentesco, ramal: @morador.ramal, rg: @morador.rg, tel_celular: @morador.tel_celular, tel_comercial: @morador.tel_comercial, tel_residencial: @morador.tel_residencial, tipo: @morador.tipo } }
    end

    assert_redirected_to morador_url(Morador.last)
  end

  test "should show morador" do
    get morador_url(@morador)
    assert_response :success
  end

  test "should get edit" do
    get edit_morador_url(@morador)
    assert_response :success
  end

  test "should update morador" do
    patch morador_url(@morador), params: { morador: { apartamento_id: @morador.apartamento_id, ativo: @morador.ativo, cpf: @morador.cpf, data_alteracao: @morador.data_alteracao, data_inclusao: @morador.data_inclusao, email: @morador.email, nome: @morador.nome, parentesco: @morador.parentesco, ramal: @morador.ramal, rg: @morador.rg, tel_celular: @morador.tel_celular, tel_comercial: @morador.tel_comercial, tel_residencial: @morador.tel_residencial, tipo: @morador.tipo } }
    assert_redirected_to morador_url(@morador)
  end

  test "should destroy morador" do
    assert_difference('Morador.count', -1) do
      delete morador_url(@morador)
    end

    assert_redirected_to moradors_url
  end
end
