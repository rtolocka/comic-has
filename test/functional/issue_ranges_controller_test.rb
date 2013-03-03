require 'test_helper'

class IssueRangesControllerTest < ActionController::TestCase
  setup do
    @issue_range = issue_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:issue_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create issue_range" do
    assert_difference('IssueRange.count') do
      post :create, issue_range: { high: @issue_range.high, low: @issue_range.low }
    end

    assert_redirected_to issue_range_path(assigns(:issue_range))
  end

  test "should show issue_range" do
    get :show, id: @issue_range
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @issue_range
    assert_response :success
  end

  test "should update issue_range" do
    put :update, id: @issue_range, issue_range: { high: @issue_range.high, low: @issue_range.low }
    assert_redirected_to issue_range_path(assigns(:issue_range))
  end

  test "should destroy issue_range" do
    assert_difference('IssueRange.count', -1) do
      delete :destroy, id: @issue_range
    end

    assert_redirected_to issue_ranges_path
  end
end
