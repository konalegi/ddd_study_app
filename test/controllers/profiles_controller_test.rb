require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
  end

  test 'should create user' do
    post :create, name: 'ramil', surname: 'Akhmentshin', phone: '+79061111718', format: :json
    assert_response :success
    resp = response_json

    # add car to profile
    post :add_car, mark: 'Kia', model: 'Rio', id: resp['id'], format: :json
    assert_response :success
  end

  def response_json
    JSON.parse(response.body || {}  )
  end
end