require 'test_helper'

class CommentSubprojectTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert CommentSubproject.new.valid?
  end
end
