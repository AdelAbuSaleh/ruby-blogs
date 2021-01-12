require "application_system_test_case"

class HomePagesTest < ApplicationSystemTestCase
  setup do
    @home_page = home_pages(:one)
  end

  test "visiting the index" do
    visit home_pages_url
    assert_selector "h1", text: "Home Pages"
  end

  test "creating a Home page" do
    visit home_pages_url
    click_on "New Home Page"

    fill_in "Home", with: @home_page.home
    click_on "Create Home page"

    assert_text "Home page was successfully created"
    click_on "Back"
  end

  test "updating a Home page" do
    visit home_pages_url
    click_on "Edit", match: :first

    fill_in "Home", with: @home_page.home
    click_on "Update Home page"

    assert_text "Home page was successfully updated"
    click_on "Back"
  end

  test "destroying a Home page" do
    visit home_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Home page was successfully destroyed"
  end
end
