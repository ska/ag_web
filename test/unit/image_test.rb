require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: images
#
#  id         :integer         not null, primary key
#  house_id   :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  image      :string(255)
#

