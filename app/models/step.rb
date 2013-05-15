class Step < ActiveRecord::Base
  attr_accessible :description, :number, :tutorial_id

  belongs_to :tutorial
end
