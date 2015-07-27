class AddAddressToEvents < ActiveRecord::Migration
  def change
		add_column :events, :event_address, :string
		add_column :events, :event_venue, :string
		add_column :events, :tickets, :string
  end
end
