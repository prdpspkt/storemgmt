require 'test_helper'

class OfficeReleasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @office_release = office_releases(:one)
  end

  test "should get index" do
    get office_releases_url
    assert_response :success
  end

  test "should get new" do
    get new_office_release_url
    assert_response :success
  end

  test "should create office_release" do
    assert_difference('OfficeRelease.count') do
      post office_releases_url, params: { office_release: { fiscal_year_id: @office_release.fiscal_year_id, fy: @office_release.fy, office_cheif_name: @office_release.office_cheif_name, office_cheif_signed_date: @office_release.office_cheif_signed_date, office_id: @office_release.office_id, release_date: @office_release.release_date, release_no: @office_release.release_no, store_chief_name: @office_release.store_chief_name, store_chief_signed_date: @office_release.store_chief_signed_date, user_id: @office_release.user_id } }
    end

    assert_redirected_to office_release_url(OfficeRelease.last)
  end

  test "should show office_release" do
    get office_release_url(@office_release)
    assert_response :success
  end

  test "should get edit" do
    get edit_office_release_url(@office_release)
    assert_response :success
  end

  test "should update office_release" do
    patch office_release_url(@office_release), params: { office_release: { fiscal_year_id: @office_release.fiscal_year_id, fy: @office_release.fy, office_cheif_name: @office_release.office_cheif_name, office_cheif_signed_date: @office_release.office_cheif_signed_date, office_id: @office_release.office_id, release_date: @office_release.release_date, release_no: @office_release.release_no, store_chief_name: @office_release.store_chief_name, store_chief_signed_date: @office_release.store_chief_signed_date, user_id: @office_release.user_id } }
    assert_redirected_to office_release_url(@office_release)
  end

  test "should destroy office_release" do
    assert_difference('OfficeRelease.count', -1) do
      delete office_release_url(@office_release)
    end

    assert_redirected_to office_releases_url
  end
end
