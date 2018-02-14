Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, ENV['facebookappid'], ENV['facebooksecretkey']
end