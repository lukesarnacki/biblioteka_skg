class ReservationsController < ApplicationController

  respond_to :html, :js

  def create
    auth = :register if params[:register]
    auth = :login if params[:login]

    @reservation_builder = ReservationBuilder.new(params[:reservation_builder], auth, current_user)
    @reservation = @reservation_builder.reservation
    @book = @reservation.book

    unless @reservation_builder.save
      flash_message(:error, t("flash.actions.create.error"))
    else
      sign_in(@reservation_builder.user)
    end

    respond_with @reservation_builder, :layout => !request.xhr?
  end

  private
end
