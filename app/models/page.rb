# == Schema Information
#
# Table name: pages
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  content      :string(255)
#  published_on :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Page < ActiveRecord::Base
  attr_accessible :content, :published_on, :title

  validates :content, :title, presence: true
  validates :title, uniqueness: true
end
