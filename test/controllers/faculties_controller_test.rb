require 'test_helper'

class FacultiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @faculty = faculties(:one)
  end

  test "should get index" do
    get faculties_url
    assert_response :success
  end

  test "should get new" do
    get new_faculty_url
    assert_response :success
  end

  test "should create faculty" do
    assert_difference('Faculty.count') do
      post faculties_url, params: { faculty: { admin: @faculty.admin, birth_date: @faculty.birth_date, department_id: @faculty.department_id, designation: @faculty.designation, email: @faculty.email, first_name: @faculty.first_name, gender: @faculty.gender, home_address_city: @faculty.home_address_city, home_address_country: @faculty.home_address_country, home_address_locality: @faculty.home_address_locality, home_address_pin_code: @faculty.home_address_pin_code, home_address_state: @faculty.home_address_state, joining_date: @faculty.joining_date, last_name: @faculty.last_name, middle_name: @faculty.middle_name, mobile_no: @faculty.mobile_no, office_address_city: @faculty.office_address_city, office_address_country: @faculty.office_address_country, office_address_locality: @faculty.office_address_locality, office_address_pin_code: @faculty.office_address_pin_code, office_address_state: @faculty.office_address_state, office_phone_no: @faculty.office_phone_no, password_digest: @faculty.password_digest } }
    end

    assert_redirected_to faculty_url(Faculty.last)
  end

  test "should show faculty" do
    get faculty_url(@faculty)
    assert_response :success
  end

  test "should get edit" do
    get edit_faculty_url(@faculty)
    assert_response :success
  end

  test "should update faculty" do
    patch faculty_url(@faculty), params: { faculty: { admin: @faculty.admin, birth_date: @faculty.birth_date, department_id: @faculty.department_id, designation: @faculty.designation, email: @faculty.email, first_name: @faculty.first_name, gender: @faculty.gender, home_address_city: @faculty.home_address_city, home_address_country: @faculty.home_address_country, home_address_locality: @faculty.home_address_locality, home_address_pin_code: @faculty.home_address_pin_code, home_address_state: @faculty.home_address_state, joining_date: @faculty.joining_date, last_name: @faculty.last_name, middle_name: @faculty.middle_name, mobile_no: @faculty.mobile_no, office_address_city: @faculty.office_address_city, office_address_country: @faculty.office_address_country, office_address_locality: @faculty.office_address_locality, office_address_pin_code: @faculty.office_address_pin_code, office_address_state: @faculty.office_address_state, office_phone_no: @faculty.office_phone_no, password_digest: @faculty.password_digest } }
    assert_redirected_to faculty_url(@faculty)
  end

  test "should destroy faculty" do
    assert_difference('Faculty.count', -1) do
      delete faculty_url(@faculty)
    end

    assert_redirected_to faculties_url
  end
end
