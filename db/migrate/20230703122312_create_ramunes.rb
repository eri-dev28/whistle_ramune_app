class CreateRamunes < ActiveRecord::Migration[7.0]
  def change
    create_table :ramunes do |t|

      t.integer :ramune_normal_girl,            null: false, default: 0
      t.integer :ramune_normal_boy,             null: false, default: 0
      t.integer :ramune_melon_girl,             null: false, default: 0
      t.integer :ramune_melon_boy,              null: false, default: 0
      t.integer :ramune_grape_girl,             null: false, default: 0
      t.integer :ramune_grape_boy,              null: false, default: 0
      t.integer :ramune_yogurt_girl,            null: false, default: 0
      t.integer :ramune_yogurt_boy,             null: false, default: 0
      t.integer :ramune_strawberry_ver1_girl,   null: false, default: 0
      t.integer :ramune_strawberry_ver1_boy,    null: false, default: 0
      t.integer :ramune_mixedfruit_girl,        null: false, default: 0
      t.integer :ramune_mixedfruit_boy,         null: false, default: 0
      t.integer :ramune_orange_girl,            null: false, default: 0
      t.integer :ramune_orange_boy,             null: false, default: 0
      t.integer :ramune_cola_girl,              null: false, default: 0
      t.integer :ramune_cola_boy,               null: false, default: 0
      t.integer :ramune_pancake_girl,           null: false, default: 0
      t.integer :ramune_pancake_boy,            null: false, default: 0
      t.integer :ramune_bluesoda_girl,          null: false, default: 0
      t.integer :ramune_bluesoda_boy,           null: false, default: 0
      t.integer :ramune_strawberry_ver2_girl,   null: false, default: 0
      t.integer :ramune_strawberry_ver2_boy,    null: false, default: 0
      t.integer :ramune_pineapplecandy_girl,    null: false, default: 0
      t.integer :ramune_pineapplecandy_boy,     null: false, default: 0
      t.integer :ramune_mixedjuice_girl,        null: false, default: 0
      t.integer :ramune_mixedjuice_boy,         null: false, default: 0
      t.integer :ramune_goldencola_girl,        null: false, default: 0
      t.integer :ramune_goldencola_boy,         null: false, default: 0
      t.integer :ramune_piratecola_girl,        null: false, default: 0
      t.integer :ramune_piratecola_boy,         null: false, default: 0
      t.integer :ramune_phantomthiefcola_girl,  null: false, default: 0
      t.integer :ramune_phantomthiefcola_boy,   null: false, default: 0
      t.integer :ramune_cuppyramune_girl,       null: false, default: 0
      t.integer :ramune_cuppyramune_boy,        null: false, default: 0
      t.integer :ramune_whistlealiencola_girl,  null: false, default: 0
      t.integer :ramune_whistlealiencola_boy,   null: false, default: 0
      t.integer :ramune_strawberry_ver3_girl,   null: false, default: 0
      t.integer :ramune_strawberry_ver3_boy,    null: false, default: 0
      t.integer :ramune_parasitecola_girl,      null: false, default: 0
      t.integer :ramune_parasitecola_boy,       null: false, default: 0
      t.integer :ramune_jumpingbattlecola_girl, null: false, default: 0
      t.integer :ramune_jumpingbattlecola_boy,  null: false, default: 0
      t.integer :ramune_inthefuturecola_girl,   null: false, default: 0
      t.integer :ramune_inthefuturecola_boy,    null: false, default: 0
      t.references :user, null: false, foreign_key: true
      
      t.timestamps

    end
    add_index  :ramunes, [:user_id, :created_at]
  end
end