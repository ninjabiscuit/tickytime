GOOGLE = YAML.load_file( Rails.root.to_s + "/config/google.yml" )[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, GOOGLE['client_id'], GOOGLE['client_secret'], { :access_type => 'online', scope: 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/calendar', :approval_prompt => ''}
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}