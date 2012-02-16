require 'test_helper'

class SubprojectTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Subproject.new.valid?
  end
end
