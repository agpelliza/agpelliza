require "cuba/test"
require_relative "../app"

scope do
  test "should display homepage" do
    get "/"

    assert_equal 302, last_response.status
  end
end