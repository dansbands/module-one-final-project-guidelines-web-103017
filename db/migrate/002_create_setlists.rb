class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.string :name
    end
  end
end
