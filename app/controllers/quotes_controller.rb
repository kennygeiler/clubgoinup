class QuotesController < ApplicationController

  def new
    @quote = Quote.new()
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to conversations_path
    end
  end

  def index
    if current_user.promotor == nil
      redirect_to new_quote_path
    else
      @quotes = Quote.all
    end
  end

  def show
    @quote = Quote.find(params[:id])
  end

  private
  def quote_params
    params.require(:quote).permit(:user_id, :men, :women, :min, :max, :bottles, :venues, :date, :comments, :location)
  end

end
