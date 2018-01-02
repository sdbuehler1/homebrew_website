class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string  "name",               limit: 50
      t.date    "brew_date"
      t.date    "bottle_date"
      t.float   "og"
      t.float   "fg"
      t.float   "ibu"
      t.float   "srm"
      t.float   "volume"
      t.integer "bottles"
      t.string  "bottle_conditioned", limit: 3,   default: "no"
      t.string  "notes",              limit: 250
      t.string  "description",        limit: 250
      t.string  "awards",             limit: 250
      t.string  "ontap",              limit: 11,  default: "no"
    end
  end
end
