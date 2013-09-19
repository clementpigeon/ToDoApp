class Project < ActiveRecord::Base
  attr_accessible :description, :name, :team_id
end
