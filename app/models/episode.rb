# == Schema Information
#
# Table name: episodes
#
#  id           :bigint           not null, primary key
#  completed_at :datetime
#  eid          :integer
#  file         :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Episode < ApplicationRecord
end
