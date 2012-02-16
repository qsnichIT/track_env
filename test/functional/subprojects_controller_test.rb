require 'test_helper'

class SubprojectsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Subproject.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Subproject.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Subproject.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to subproject_url(assigns(:subproject))
  end

  def test_edit
    get :edit, :id => Subproject.first
    assert_template 'edit'
  end

  def test_update_invalid
    Subproject.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Subproject.first
    assert_template 'edit'
  end

  def test_update_valid
    Subproject.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Subproject.first
    assert_redirected_to subproject_url(assigns(:subproject))
  end

  def test_destroy
    subproject = Subproject.first
    delete :destroy, :id => subproject
    assert_redirected_to subprojects_url
    assert !Subproject.exists?(subproject.id)
  end
end
