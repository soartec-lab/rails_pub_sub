class SampleSubscriber
  include ActiveSupport
  
  Notifications.subscribe('event.library') do |*args|
    event = ActiveSupport::Notifications::Event.new *args
   
    event.name
    event.payload
   
    Rails.logger.info "#{event.name} Received!"
  end
end