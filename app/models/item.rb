class Item < ActiveRecord::Base
  attr_accessible :title, :description, :completed, :project_id

  validates :title, :project_id, presence: true

  belongs_to :project



end
