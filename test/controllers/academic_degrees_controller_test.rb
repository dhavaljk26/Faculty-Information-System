require 'test_helper'

class AcademicDegreesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_degree = academic_degrees(:one)
  end

  test "should get index" do
    get academic_degrees_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_degree_url
    assert_response :success
  end

  test "should create academic_degree" do
    assert_difference('AcademicDegree.count') do
      post academic_degrees_url, params: { academic_degree: { min_duration: @academic_degree.min_duration, name: @academic_degree.name, programme: @academic_degree.programme } }
    end

    assert_redirected_to academic_degree_url(AcademicDegree.last)
  end

  test "should show academic_degree" do
    get academic_degree_url(@academic_degree)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_degree_url(@academic_degree)
    assert_response :success
  end

  test "should update academic_degree" do
    patch academic_degree_url(@academic_degree), params: { academic_degree: { min_duration: @academic_degree.min_duration, name: @academic_degree.name, programme: @academic_degree.programme } }
    assert_redirected_to academic_degree_url(@academic_degree)
  end

  test "should destroy academic_degree" do
    assert_difference('AcademicDegree.count', -1) do
      delete academic_degree_url(@academic_degree)
    end

    assert_redirected_to academic_degrees_url
  end
end
