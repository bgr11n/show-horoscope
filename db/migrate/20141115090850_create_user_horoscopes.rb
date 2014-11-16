class CreateUserHoroscopes < ActiveRecord::Migration
  def change
    create_table :user_horoscopes do |t|
      t.date :date

      t.text :Aries, :limit => nil
      t.text :Taurus, :limit => nil
      t.text :Gemini, :limit => nil
      t.text :Cancer, :limit => nil
      t.text :Leo, :limit => nil
      t.text :Virgo, :limit => nil
      t.text :Libra, :limit => nil
      t.text :Scorpio, :limit => nil
      t.text :Sagittarius, :limit => nil
      t.text :Capricorn, :limit => nil
      t.text :Aquarius, :limit => nil
      t.text :Pisces, :limit => nil
    end
  end
end
