require 'test_helper'

class TestRunsControllerTest < ActionController::TestCase

  setup do
    @api_key = ApiKey.create_api_token
    @encoded = token_header(@api_key.token)
    request.headers['Authorization'] = @encoded  # set to nil to test non-auth access
    request.headers['Accept'] = 'application/json'
  end

  test 'invalid auth token' do
    request.headers['Authorization'] = nil
    get :index, {}
    assert_response 401
    assert_equal response.content_type, Mime::JSON, "response.content_type = #{response.content_type.inspect}"
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should not create unless authenticated" do
    request.headers['Authorization'] = nil
    get :create
    assert_response 401
    assert_equal response.content_type, Mime::JSON, "response.content_type = #{response.content_type.inspect}"
  end

  test "should create" do
    get :create, { name: 'Test name', url: 'http://127.0.0.1/somewhere' }
    assert_response :success, response.body
  end

end
