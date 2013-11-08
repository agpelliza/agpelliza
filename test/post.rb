require "cuba/test"
require_relative "../app"

scope do
  test "should display posts list" do
    get "/posts"

    assert_equal 200, last_response.status
  end
end