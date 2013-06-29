class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name
      t.string :target_name
      t.string :target_email
      t.text :body
      t.string :ip
      t.integer :status

      t.timestamps
    end
  end
end
