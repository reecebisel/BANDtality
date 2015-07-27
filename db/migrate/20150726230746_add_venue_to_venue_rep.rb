class AddVenueToVenueRep < ActiveRecord::Migration
  def change
    add_column :venue_reps, :venue_name, :string
  end
end
