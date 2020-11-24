module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :guest_token

    def connect
      self.guest_token = find_guest_token
    end

    private
      def find_guest_token
        cookies[:guest_token] || generate_token
      end

      def generate_token
        SecureRandom.urlsafe_base64
      end
  end
end
