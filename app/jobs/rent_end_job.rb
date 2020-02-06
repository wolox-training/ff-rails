require 'sidekiq-scheduler'

class RentEndJob
  include Sidekiq::Worker

  def perform
    RentsMailer.rent_end_email.deliver_later
  end
end
