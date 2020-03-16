class RentsMailer < ApplicationMailer
  def creation_email
    @rent = Rent.find(params[:rent_id])
    @user = @rent.user
    @book = @rent.book

    I18n.with_locale(@user.locale) do
      @title = t('rents_mailer.creation_email.rent_title')
      mail(to: @user.email, subject: @title)
    end
  end

  def rent_end_email
    @rents = Rent.ending_today
    @rents.each do |rent|
      @rent = rent
      @user = rent.user
      @book = rent.book

      I18n.with_locale(@user.locale) do
        @title = t('rents_mailer.rent_end_email.title')
        mail(to: @user.email, subject: @title)
      end
    end
  end
end
