require 'test_helper'

class BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get bookmarks_show_url
    assert_response :success
  end

  test "should get new" do
    get bookmarks_new_url
    assert_response :success
  end

  test "should get edit" do
    get bookmarks_edit_url
    assert_response :success
  end

end
