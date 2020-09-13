require 'test_helper'

class EmergencyContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emergency_contact = emergency_contacts(:one)
  end

  test "should get index" do
    get emergency_contacts_url, as: :json
    assert_response :success
  end

  test "should create emergency_contact" do
    assert_difference('EmergencyContact.count') do
      post emergency_contacts_url, params: { emergency_contact: { first_name: @emergency_contact.first_name, last_name: @emergency_contact.last_name, phone_number: @emergency_contact.phone_number } }, as: :json
    end

    assert_response 201
  end

  test "should show emergency_contact" do
    get emergency_contact_url(@emergency_contact), as: :json
    assert_response :success
  end

  test "should update emergency_contact" do
    patch emergency_contact_url(@emergency_contact), params: { emergency_contact: { first_name: @emergency_contact.first_name, last_name: @emergency_contact.last_name, phone_number: @emergency_contact.phone_number } }, as: :json
    assert_response 200
  end

  test "should destroy emergency_contact" do
    assert_difference('EmergencyContact.count', -1) do
      delete emergency_contact_url(@emergency_contact), as: :json
    end

    assert_response 204
  end
end
