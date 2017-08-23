class CreateTehnologies < ActiveRecord::Migration[5.1]
  def change
    create_table :tehnologies do |t|
      t.string :name
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
