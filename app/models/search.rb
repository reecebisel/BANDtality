class Search < ActiveRecord::Base
	def search_profile
		profiles = Profile.all
		profile = profiles.where(["name LIKE ? OR bio LIKE ?", "%#{keywords}%", "%#{keywords}%"]) if keywords.present?
		
		#finding musicians
		profile = Profile.joins(:musician).where(:musicians => { :instrument => "#{instrument}" }) if instrument.present?
		profile = Profile.joins(:musician).where(:musicians => { :genre => "#{genre}" }) if genre.present?

		#find by address
		profile = Profile.joins(:musician).where(:musicians => { :instrument => "#{instrument}" }) if instrument.present?
		
		musician = Musician.joins(:addresses).where(addresses: { :zip => "#{zip}" }) if zip.present?
		Musician.includes(:addresses).references(:addresses).to_a
		return profile
	end

	def search_address
		# musician = Musician.joins(:addresses).where(addresses: {"state LIKE ?", "#{state}"}) if zip.present?
		# venue_rep = VenueRep.joins(:addresses).where(addresses: {"zip LIKE ?", "#{zip}"}) if zip.present?
		# venue_rep = VenueRep.joins(:addresses).where(addresses: {"state LIKE ?", "#{state}"}) if zip.present?
		# visual_artist = VisualArtist.joins(:addresses).where(addresses: {"zip LIKE ?", "#{zip}"}) if zip.present?
		# visual_artist = VisualArtist.joins(:addresses).where(addresses: {"state LIKE ?", "#{state}"}) if zip.present?
	end
end 