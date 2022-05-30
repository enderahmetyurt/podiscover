require "test_helper"

class CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get comment_index_url
    assert_response :success
  end
end
