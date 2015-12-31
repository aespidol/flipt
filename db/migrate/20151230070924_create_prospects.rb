class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :name
      t.string :phone
      t.references :client, index: true

      t.timestamps
    end
  end
end
