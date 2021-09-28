require 'test_helper'

class ClassServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_service = class_services(:one)
  end

  test "should get index" do
    get class_services_url
    assert_response :success
  end

  test "should get new" do
    get new_class_service_url
    assert_response :success
  end

  test "should create class_service" do
    assert_difference('ClassService.count') do
      post class_services_url, params: { class_service: { enable: @class_service.enable, title: @class_service.title } }
    end

    assert_redirected_to class_service_url(ClassService.last)
  end

  test "should show class_service" do
    get class_service_url(@class_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_service_url(@class_service)
    assert_response :success
  end

  test "should update class_service" do
    patch class_service_url(@class_service), params: { class_service: { enable: @class_service.enable, title: @class_service.title } }
    assert_redirected_to class_service_url(@class_service)
  end

  test "should destroy class_service" do
    assert_difference('ClassService.count', -1) do
      delete class_service_url(@class_service)
    end

    assert_redirected_to class_services_url
  end
end
