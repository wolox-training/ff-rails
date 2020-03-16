class RentEndJob
  include Sidekiq::Worker
  sidekiq_options queue: 'mailers'

  def perform
    RentsMailer.rent_end_email.deliver_later
  end
end
