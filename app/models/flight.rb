class Flight < ActiveRecord::Base
  attr_accessible :arrive, :coach, :depart, :first_class, :flight_num, :routing

end
