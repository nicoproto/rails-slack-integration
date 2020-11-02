class Review < ApplicationRecord
  after_create :send_notification

  def send_notification
    ReviewServices::SlackNotification.new.build_message(title, content, rating).deliver
  end
end
