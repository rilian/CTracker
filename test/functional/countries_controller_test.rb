require 'test_helper'

class CountriesControllerTest < ActionController::TestCase
  should_not_respond_to_actions :new => :get, :destroy => :get

  setup do
    @user = users(:admin)
    @country = countries(:one)
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
    assert_not_nil assigns(:countries)
  end

  test "should create country" do
    sign_in @user
    assert_difference('Country.count') do
      post :create, :country => @country.attributes.merge({ :code => Time.now.to_s }).except('created_at', 'updated_at')
    end

    assert_redirected_to country_path(assigns(:country))
  end

  test "should not create duplicate currency" do
    sign_in @user
    assert_no_difference('Currency.count') do
      post :create, :country => @country.attributes.except('created_at', 'updated_at')
    end

    assert !assigns[:country].errors[:code].empty?
  end

  test "should show country" do
    sign_in @user
    get :show, :id => @country.to_param
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, :id => @country.to_param
    assert_response :success
  end

  test "should update country" do
    sign_in @user
    put :update, :id => @country.to_param, :country => @country.attributes.except('created_at', 'updated_at')
    assert_redirected_to country_path(assigns(:country))
  end
end
