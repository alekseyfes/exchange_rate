class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.string :from
      t.string :to
      t.float :value
      t.timestamps
    end
  end
end
