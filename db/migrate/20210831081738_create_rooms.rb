class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :description
      t.string :body

      t.timestamps
    end
  end
end
