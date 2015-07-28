module ApplicationHelper

  def find_parent_profile(profile_id)
    Profile.find(profile_id)
  end

  def name_parent_profile(profile_id)
    Profile.find(profile_id).name if profile_id?
  end

  def six_random_profiles
    Profile.all.sample(6)
  end

  def profile_type(profile)
    if profile.musician.present?
      'Musician'
    elsif profile.venue_rep.present?
      'Venue Rep.'
    elsif profile.visual_artist.present?
      'Visual Artist'
    else
      ' '
    end
  end
end
