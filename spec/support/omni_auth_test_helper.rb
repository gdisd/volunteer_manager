module OmniAuthTestHelper
  def valid_meetup_login_setup
    if Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:meetup] = OmniAuth::AuthHash.new({
        provider: 'meetup',
        uid: '123545',
        info: {
          first_name: "Gaius",
          last_name:  "Baltar",
          email:      "test@example.com"
        },
        credentials: {
          token: "123456",
          expires_at: Time.now + 1.week
        },
        extra: {
          raw_info: {
            gender: 'male'
          }
        }
      })
    end
  end
end
