class State < ActiveRecord::Base
  def abbreviation
    state_name.downcase
  end
end
