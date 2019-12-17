class RentsMailer < ApplicationMailer
  default from: 'rents@training.wolox.com.ar'

  def creation_email
    @rent = Rent.find(params[:rent_id])
    @user = @rent.user
    @book = @rent.book

    mail(to: @user.email, subject: 'New rent')
  end
end
