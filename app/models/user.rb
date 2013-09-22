class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :token, :team_ids

  has_many(
  :team_memberships,
  class_name: 'TeamMembership',
  foreign_key: :user_id,
  primary_key: :id
  )

  has_many :teams, through: :team_memberships, source: :team

end
