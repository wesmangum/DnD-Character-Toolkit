OmniAuth.config.test_mode = true
def sign_into_facebook_as(user_or_username, token: nil)
  if user_or_username.is_a? User
    user = user_or_username
  end

  token = token || ENV["FACEBOOK_ACCESS_TOKEN"]
  username = user_or_username.try(:name) || user_or_username
  uid = user_or_username.try(:uid) || '12345'
  email = user.try(:email) || "#{username}smith@example.com"

  OmniAuth.config.add_mock(:facebook, {
    uid: uid,
    credentials: {
      token: token
    },
    info: {
      email: email,
      name: "#{username.capitalize} Smith",
    },
    extra: {
      raw_info: {
        location: 'San Francisco',
        gravatar_id: '123456789'
      }
    }
  })
end

def sign_into_twitter_as(user_or_username, token: nil)
  if user_or_username.is_a? User
    user = user_or_username
  end

  token = token || ENV["FACEBOOK_ACCESS_TOKEN"]
  username = user_or_username.try(:name) || user_or_username
  uid = user_or_username.try(:uid) || '12345'
  email = user.try(:email) || "#{username}smith@example.com"

  OmniAuth.config.add_mock(:twitter, {
    uid: uid,
    credentials: {
      token: token
    },
    info: {
      nickname: username,
      email: email,
      name: "#{username.capitalize} Smith",
    },
    extra: {
      raw_info: {
        location: 'San Francisco',
        gravatar_id: '123456789'
      }
    }
  })
end
