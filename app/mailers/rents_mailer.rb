class RentsMailer < ApplicationMailer
  default from: 'rents@training.wolox.com.ar'

  def creation_email
    @rent = Rent.find(params[:rent_id])
    @user = @rent.user
    @book = @rent.book
    @title = I18n.t 'rent_title'

    mail(to: @user.email, subject: @title)
  end
end
