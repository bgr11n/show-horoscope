class UsersController < ApplicationController  
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show_horoscope
    user = User.find(params[:id])

    @sign = user.define_sign
    @day = case params[:day]
    when 'tomorrow' then Date.tomorrow
    when 'yesterday' then Date.yesterday
    else Date.today
    end

    @horoscope = UserHoroscope.where(date: "#{@day.year}-#{@day.month}-#{@day.day}").first
    
    if @horoscope.nil?
      return @horoscope = "Sorry, there were no horoscope for you on this date. We sure you will fine :) Have a nice day!"
    end
    
    @horoscope = @horoscope.send(@sign)
    
    if @horoscope.empty?
      return @horoscope = "Sorry, there were no horoscope for you on this date. We sure you will fine :) Have a nice day!"
    end

  end

end
