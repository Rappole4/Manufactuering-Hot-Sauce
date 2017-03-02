require 'test_helper'

class NewOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_order = new_orders(:one)
  end

  test "should get index" do
    get new_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_new_order_url
    assert_response :success
  end

  test "should create new_order" do
    assert_difference('NewOrder.count') do
      post new_orders_url, params: { new_order: { destination: @new_order.destination, quantity: @new_order.quantity, sauce_name: @new_order.sauce_name } }
    end

    assert_redirected_to new_order_url(NewOrder.last)
  end

  test "should show new_order" do
    get new_order_url(@new_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_order_url(@new_order)
    assert_response :success
  end

  test "should update new_order" do
    patch new_order_url(@new_order), params: { new_order: { destination: @new_order.destination, quantity: @new_order.quantity, sauce_name: @new_order.sauce_name } }
    assert_redirected_to new_order_url(@new_order)
  end

  test "should destroy new_order" do
    assert_difference('NewOrder.count', -1) do
      delete new_order_url(@new_order)
    end

    assert_redirected_to new_orders_url
  end
end
