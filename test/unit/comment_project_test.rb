require 'test_helper'

class CommentProjectTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CommentProject.new.valid?
  end
end
