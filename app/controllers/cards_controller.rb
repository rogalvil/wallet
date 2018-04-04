class CardsController < ApplicationController

  before_action :authenticate_request!

  def create
    card = Card.new(card_params)
    card.user = @current_user
    if card.save
      render json: { success: true, card: { id: card.id } }, status: :created
    else
      render json: { errors: card.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    card = Card.find(params[:id]) rescue nil
    unless card.nil?
      card.delete
      render json: { success: true }, status: :destroy
    else
      render json: { error: "Objeto ya fue eliminado" }, status: :bad_request

    end
  end

  private

  def card_params
    params.require(:card).permit(:card_number, :name, :card_type, :expirate_date, :cvv)
  end

end
