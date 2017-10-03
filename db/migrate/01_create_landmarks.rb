class CreateLandmarks < ActiveRecord::Migration
  create_table :landmarks do |t|
    t.string :name
  end
end
