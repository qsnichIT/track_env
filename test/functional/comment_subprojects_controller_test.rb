require 'test_helper'

class CommentSubprojectsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => CommentSubproject.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    CommentSubproject.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    CommentSubproject.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to comment_subproject_url(assigns(:comment_subproject))
  end

  def test_edit
    get :edit, :id => CommentSubproject.first
    assert_template 'edit'
  end

  def test_update_invalid
    CommentSubproject.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CommentSubproject.first
    assert_template 'edit'
  end

  def test_update_valid
    CommentSubproject.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CommentSubproject.first
    assert_redirected_to comment_subproject_url(assigns(:comment_subproject))
  end

  def test_destroy
    comment_subproject = CommentSubproject.first
    delete :destroy, :id => comment_subproject
    assert_redirected_to comment_subprojects_url
    assert !CommentSubproject.exists?(comment_subproject.id)
  end
end
