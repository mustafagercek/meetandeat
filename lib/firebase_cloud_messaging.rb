
module FirebaseCloudMessaging
  class UserNotificationSender

    attr_reader :message, :user_device_ids

    # Firebase works with up to 1000 device_ids per call
    MAX_USER_IDS_PER_CALL = 1000

    def initialize(user_device_ids, message)
      @user_device_ids = user_device_ids
      @message = message
    end

    def call
      user_device_ids.each_slice(MAX_USER_IDS_PER_CALL) do |device_ids|
        res = fcm_client.send(device_ids, options)
        return res
      end

    end

    private

    def options
      {
          priority: 'high',
          data: {
              message: message
          },
          notification: {
              body: message,
              sound: 'default'
          }
      }
    end

    def fcm_client
      @fcm_client ||= FCM.new('AAAAFLmwLco:APA91bHH8mI8YsaZFKIRvnW57A9wNHXYt0JOA4yn4qtnmVYem_V678Ci0ZtlcPA8LmEzoS7X5K4toxqsCBRYhI4ow-U1KBVaOOvb8QYqWoAagl-sspehexXDuxC2d7DPB6a-rluIWImN')
    end
  end
end