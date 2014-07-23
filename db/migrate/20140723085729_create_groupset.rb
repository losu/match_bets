class CreateGroupset < ActiveRecord::Migration
  def change
    create_table :groupsets do |t|
    	t.belongs_to :group
    	t.belongs_to :user
    	t.integer :points_in_group
    end
  end
end
