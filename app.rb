require "cuba"
require "mote"
require "cuba/contrib"
require "rack/protection"
require "shield"
require "maruku"

APP_SECRET = ENV.fetch("APP_SECRET")

Cuba.plugin Cuba::Mote
Cuba.plugin Cuba::TextHelpers
Cuba.plugin Shield::Helpers

Dir["./models/**/*.rb"].each  { |rb| require rb }
Dir["./routes/**/*.rb"].each  { |rb| require rb }

Dir["./helpers/**/*.rb"].each { |rb| require rb }
Dir["./lib/**/*.rb"].each { |rb| require rb }

Cuba.plugin PostHelper

Cuba.use Rack::MethodOverride
Cuba.use Rack::Session::Cookie,
  key: "agpelliza",
  secret: APP_SECRET

Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer

Cuba.use Rack::Static,
  urls: %w[/js /css /img],
  root: "./public"

Cuba.define do
  persist_session!

  on root do
    run Posts
  end

  on default do
    run Posts
  end
end