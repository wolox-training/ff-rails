class RentsMailer < ApplicationMailer
  def creation_email
    @rent = Rent.find(params[:rent_id])
    @user = @rent.user
    @book = @rent.book
    @title = t('rents_mailer.creation_email.rent_title')

    I18n.with_locale(@user.locale) do
      mail(to: @user.email, subject: @title)
    end
  end

  def rent_end_email
    @rents = Rent.where(end_date: Date.current)
    @title = t('rents_mailer.rent_end_email.title')

    @rents.each do |r|
      I18n.with_locale(r.user.locale) do
        mail(to: r.user.email, subject: @title)
      end
    end
  end
end
