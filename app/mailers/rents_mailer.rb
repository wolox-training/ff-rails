class RentsMailer < ApplicationMailer
  default from: 'rents@training.wolox.com.ar'

  def creation_email
    @rent = Rent.find(params[:rent_id])
    @user = @rent.user
    @book = @rent.book
    @title = t('rents_mailer.creation_email.rent_title')

    I18n.with_locale(@user.locale) do
      mail(to: @user.email, subject: @title)
    end
  end
end
