class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
    	t.string 
      t.timestamps null: false
    end
  end
end
