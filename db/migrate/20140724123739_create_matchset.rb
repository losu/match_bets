class CreateMatchset < ActiveRecord::Migration
  def change
    create_table :matchsets do |t|
      t.belongs_to :group
      t.belongs_to :match
    end
  end
end
