class Search < ActiveRecord::Base
	def search_profile
		profile=Profile.where(["name LIKE ? OR bio LIKE ?", "%#{keywords}%", "%#{keywords}%"]) if keywords.present?
		
		#finding musicians
		profile = Profile.joins(:musician).where(:musicians => { :instrument => "#{instrument}" }) if instrument.present?
		profile = Profile.joins(:musician).where(:musicians => { :genre => "#{genre}" }) if genre.present?
		
		# finding visual artist
		profile = Profile.joins(:visual_artist).where(:visual_artist => { :medium => "#{medium}"}) if medium.present?

		# finding venue rep
		profile = Profile.joins(:venue_rep).where(:venue_rep => { :venue_name => "#{venue}"}) if venue.present?

		
		return profile
	end
end 