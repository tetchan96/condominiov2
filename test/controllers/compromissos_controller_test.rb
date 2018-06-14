require 'test_helper'

class CompromissosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compromisso = compromissos(:one)
  end

  test "should get index" do
    get compromissos_url
    assert_response :success
  end

  test "should get new" do
    get new_compromisso_url
    assert_response :success
  end

  test "should create compromisso" do
    assert_difference('Compromisso.count') do
      post compromissos_url, params: { compromisso: { date: @compromisso.date, texto: @compromisso.texto, titulo: @compromisso.titulo } }
    end

    assert_redirected_to compromisso_url(Compromisso.last)
  end

  test "should show compromisso" do
    get compromisso_url(@compromisso)
    assert_response :success
  end

  test "should get edit" do
    get edit_compromisso_url(@compromisso)
    assert_response :success
  end

  test "should update compromisso" do
    patch compromisso_url(@compromisso), params: { compromisso: { date: @compromisso.date, texto: @compromisso.texto, titulo: @compromisso.titulo } }
    assert_redirected_to compromisso_url(@compromisso)
  end

  test "should destroy compromisso" do
    assert_difference('Compromisso.count', -1) do
      delete compromisso_url(@compromisso)
    end

    assert_redirected_to compromissos_url
  end
end
