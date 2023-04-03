require "test_helper"

class ImageAlbumsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get image_albums_index_url
    assert_response :success
  end
end
