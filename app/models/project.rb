class Project < ActiveRecord::Base
  attr_accessible :description, :name, :team_id

  validates :name, presence: true, uniqueness: { scope: :nameteam_id }

  has_many :items



end
