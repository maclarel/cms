require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest

  setup do
    @user = User.create(username: "johndoe", email: "johndoe@example.com", password: "password")
    sign_in_as(@user)
  end

  test "get new article form and create article" do
    get "/articles/new"
    assert_response :success
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: { title: "This is a test article", description: "This is the test description with my successful keyword." } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "successful", response.body
  end

end
