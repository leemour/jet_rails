require 'test_helper'

class FlightsControllerTest < ActionController::TestCase
  setup do
    @flight = flights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flight" do
    assert_difference('Flight.count') do
      post :create, flight: { arrive: @flight.arrive, coach: @flight.coach, depart: @flight.depart, first_class: @flight.first_class, flight_num: @flight.flight_num, routing: @flight.routing }
    end

    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should show flight" do
    get :show, id: @flight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flight
    assert_response :success
  end

  test "should update flight" do
    put :update, id: @flight, flight: { arrive: @flight.arrive, coach: @flight.coach, depart: @flight.depart, first_class: @flight.first_class, flight_num: @flight.flight_num, routing: @flight.routing }
    assert_redirected_to flight_path(assigns(:flight))
  end

  test "should destroy flight" do
    assert_difference('Flight.count', -1) do
      delete :destroy, id: @flight
    end

    assert_redirected_to flights_path
  end
end
