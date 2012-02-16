require 'test_helper'

class CommentProjectsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => CommentProject.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    CommentProject.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    CommentProject.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to comment_project_url(assigns(:comment_project))
  end

  def test_edit
    get :edit, :id => CommentProject.first
    assert_template 'edit'
  end

  def test_update_invalid
    CommentProject.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CommentProject.first
    assert_template 'edit'
  end

  def test_update_valid
    CommentProject.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CommentProject.first
    assert_redirected_to comment_project_url(assigns(:comment_project))
  end

  def test_destroy
    comment_project = CommentProject.first
    delete :destroy, :id => comment_project
    assert_redirected_to comment_projects_url
    assert !CommentProject.exists?(comment_project.id)
  end
end
