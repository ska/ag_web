require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  object     :string(255)
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  read       :boolean         default(FALSE)
#  house_id   :integer
#  name       :string(255)
#  email      :string(255)
#

