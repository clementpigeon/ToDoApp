class Team < ActiveRecord::Base
  attr_accessible :name

  has_many :projects

  has_many(
  :team_memberships,
  class_name: 'TeamMembership',
  foreign_key: :team_id,
  primary_key: :id
  )

  has_many :members, through: :team_memberships, source: :user


end
