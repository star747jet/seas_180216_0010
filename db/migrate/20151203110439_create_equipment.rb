class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :equip_name
      t.string :equip_id
      t.string :type

      t.timestamps
    end
  end
end
