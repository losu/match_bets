class CreateGroup < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string :name
    	t.boolean :active
    	t.integer :matches_idmatches
    end
  end
end
