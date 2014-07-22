class CreateGroup < ActiveRecord::Migration
  def change
    create_table :groups do |t|
    	t.string 	:name
    	t.bool		:active
    	t.integer 	:matches_idmatches

     	-#t.belongs_to :user
     	-#t.belongs_to :post
    end
  end
end
