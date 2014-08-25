require 'sidekiq/api'

class ResetWorker
  include Sidekiq::Worker

  sidekiq_options :retry => false

  def perform
  	Sidekiq::Queue.new.clear
		Sidekiq::RetrySet.new.clear
		Sidekiq::ScheduledSet.new.clear
  end
end