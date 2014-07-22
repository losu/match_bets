class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
    	t.string:team_name_1
    	t.string:team_name_2
    	t.datetime:deadline
    	t.integer:team_score_1
    	t.integer:team_score_2
    end
  end
end
