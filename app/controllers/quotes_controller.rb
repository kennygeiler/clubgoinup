class QuotesController < ApplicationController

  def new
    if current_user
      @quote = Quote.new()
    else
      redirect_to root_path
    end
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      flash[:notice] = "Request successfully created"
      redirect_to conversations_path
    else
      redirect_to new_quote_path
    end
  end

  def index
    if current_user.promotor == nil
      redirect_to new_promotor_path
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
