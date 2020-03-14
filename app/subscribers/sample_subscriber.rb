class SampleSubscriber
  include ActiveSupport
  
  # Rails6以降では以下のようeventインスタンスの作成を省略して書ける
  #
  # Notifications.subscribe('event.library') do |event|
  #   Rails.logger.info "#{event.name} Received!"
  # end
  Notifications.subscribe('event.library') do |*args|
    event = ActiveSupport::Notifications::Event.new *args
   
    event.name
    event.payload
   
    Rails.logger.info "#{event.name} Received!"
  end

  Notifications.subscribe('output_logger.sample.SampleSubscriber') do |*args|
    event = ActiveSupport::Notifications::Event.new *args
   
    event.name
    event.payload 
   
    Rails.logger.info "#{event.name} Received!"
  end
end