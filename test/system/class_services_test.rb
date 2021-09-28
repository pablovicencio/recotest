require "application_system_test_case"

class ClassServicesTest < ApplicationSystemTestCase
  setup do
    @class_service = class_services(:one)
  end

  test "visiting the index" do
    visit class_services_url
    assert_selector "h1", text: "Class Services"
  end

  test "creating a Class service" do
    visit class_services_url
    click_on "New Class Service"

    fill_in "Enable", with: @class_service.enable
    fill_in "Title", with: @class_service.title
    click_on "Create Class service"

    assert_text "Class service was successfully created"
    click_on "Back"
  end

  test "updating a Class service" do
    visit class_services_url
    click_on "Edit", match: :first

    fill_in "Enable", with: @class_service.enable
    fill_in "Title", with: @class_service.title
    click_on "Update Class service"

    assert_text "Class service was successfully updated"
    click_on "Back"
  end

  test "destroying a Class service" do
    visit class_services_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class service was successfully destroyed"
  end
end
