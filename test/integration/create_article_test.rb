require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: "atomic", email: "atomic@example.com", password: "atomic", admin: true)
  end

  test "get new article form and create article" do
    sign_in_as(@user, "atomic")
    get new_article_path
    assert_template "articles/new"
    assert_difference 'Article.count', 1 do
      post articles_path, params:{article:{title:"Test Article", description: "This is a test article", category: "Home"}}
      follow_redirect!
    end
    assert_template 'articles/show'
    assert_match "Test Article", response.body
  end


end