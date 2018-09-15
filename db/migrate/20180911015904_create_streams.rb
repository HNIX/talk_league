class CreateStreams < ActiveRecord::Migration[5.2]
  def change
    create_table :streams do |t|
      t.string :title
      t.text :go_live
      t.timestamps
    end
  end
end
