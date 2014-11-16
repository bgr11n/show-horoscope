class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates_presence_of :birth_date, :name
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def define_sign
    result = {}
    result["year"], result["month"], result["day"] = self.birth_date.strftime("%Y %m %d").split(/[^\d]+/)
    date = Date.new(result["year"].to_i, result["month"].to_i, result["day"].to_i)

    if date.is_a?(Date)
      if ((Date.new(date.year, 1, 1)..Date.new(date.year, 1, 19)).to_a.include? date)
        "Capricorn" 
      elsif ((Date.new(date.year, 3, 21)..Date.new(date.year, 4, 20)).to_a.include? date)
        "Aries"
      elsif ((Date.new(date.year, 4, 21)..Date.new(date.year, 5, 20)).to_a.include? date)
        "Taurus"
      elsif ((Date.new(date.year, 5, 21)..Date.new(date.year, 6, 20)).to_a.include? date)
        "Gemini"
      elsif ((Date.new(date.year, 6, 21)..Date.new(date.year, 7, 22)).to_a.include? date)
        "Cancer"
      elsif ((Date.new(date.year, 7, 23)..Date.new(date.year, 8, 22)).to_a.include? date)
        "Leo"
      elsif ((Date.new(date.year, 8, 23)..Date.new(date.year, 9, 22)).to_a.include? date)
        "Virgo"
      elsif ((Date.new(date.year, 9, 23)..Date.new(date.year, 10, 22)).to_a.include? date)
        "Libra"
      elsif ((Date.new(date.year, 10, 23)..Date.new(date.year, 11, 21)).to_a.include? date)
        "Scorpio"
      elsif ((Date.new(date.year, 11, 22)..Date.new(date.year, 12, 21)).to_a.include? date)
        "Sagittarius"
      elsif ((Date.new(date.year, 12, 22)..Date.new(date.year, 12, 31)).to_a.include? date)
        "Capricorn"
      elsif ((Date.new(date.year, 1, 20)..Date.new(date.year, 2, 18)).to_a.include? date)
        "Aquarius"
      elsif ((Date.new(date.year, 2, 19)..Date.new(date.year, 3, 20)).to_a.include? date)
        "Pisces"
      end
    else
      false
    end
  end
end
