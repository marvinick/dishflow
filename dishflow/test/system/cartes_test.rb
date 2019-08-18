require "application_system_test_case"

class CartesTest < ApplicationSystemTestCase
  setup do
    @carte = cartes(:one)
  end

  test "visiting the index" do
    visit cartes_url
    assert_selector "h1", text: "Cartes"
  end

  test "creating a Carte" do
    visit cartes_url
    click_on "New Carte"

    fill_in "Description", with: @carte.description
    fill_in "Name", with: @carte.name
    click_on "Create Carte"

    assert_text "Carte was successfully created"
    click_on "Back"
  end

  test "updating a Carte" do
    visit cartes_url
    click_on "Edit", match: :first

    fill_in "Description", with: @carte.description
    fill_in "Name", with: @carte.name
    click_on "Update Carte"

    assert_text "Carte was successfully updated"
    click_on "Back"
  end

  test "destroying a Carte" do
    visit cartes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Carte was successfully destroyed"
  end
end
