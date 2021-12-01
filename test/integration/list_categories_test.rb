require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Future")
  end

  test "should show categories listing" do
    get '/categories'
    assert_select "a[href=?]", categories_path(@category), text: @category.name #look for these two links genereated by the path
    assert_select "a[href=?]", categories_path(@category2), text: @category2.name
  end



end
