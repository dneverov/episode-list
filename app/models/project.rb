# == Schema Information
#
# Table name: projects
#
#  id         :bigint           not null, primary key
#  name       :string
#  path       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Project < ApplicationRecord
  before_validation :set_default_name

  validates :name, :path, presence: true, uniqueness: true

  private

    def set_default_name
      self.name = File.basename(self.path, ".*") if self.name.blank?
    end
end
