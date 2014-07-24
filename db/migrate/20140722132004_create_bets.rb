class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
    	t.belongs_to :match
  		t.belongs_to :user
  		t.belongs_to :group
  		t.integer :team_score1
  		t.integer :team_score2
  		t.integer :points
    end
  end
end
