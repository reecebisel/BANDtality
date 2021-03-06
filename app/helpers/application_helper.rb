module ApplicationHelper

  def find_parent_profile(profile_id)
    Profile.find(profile_id)
  end

  def name_parent_profile(profile_id)
    Profile.find(profile_id).name if profile_id.present?
  end

  def six_random_profiles
    Profile.all.sample(6)
  end

  def reply_to(message_id)
    receiver_id = Message.find(message_id).message_receiver_id
    Profile.find(receiver_id).name
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