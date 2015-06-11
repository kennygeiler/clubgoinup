class QuotesController < ApplicationController

  def new
    @quote = Quote.new()
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to new_quote_path
    end
  end

  def index
  end

  def show
  end

  private
  def quote_params
    params.require(:quote).permit(:user_id, :men, :women, :min, :max, :bottles, :venues, :date, :comments)
  end

end
