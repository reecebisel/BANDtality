class Location < ActiveRecord::Base
 	# attr_accessible :address, :latitude, :longitude, :name
  acts_as_gmappable
 
  def gmaps4rails_address
      address
  end
end

# wasn't sure what is going on with the gmaps4rails_address method. Probably should ask tiffany about it tomrrow
