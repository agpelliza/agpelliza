require "cuba"
require "mote"
require "cuba/contrib"
require "rack/protection"
require "shield"

Cuba.plugin Cuba::Mote
Cuba.plugin Cuba::TextHelpers
Cuba.plugin Shield::Helpers

# Require all application files.
Dir["./models/**/*.rb"].each  { |rb| require rb }
Dir["./routes/**/*.rb"].each  { |rb| require rb }

# Require all helper files.
Dir["./helpers/**/*.rb"].each { |rb| require rb }
Dir["./filters/**/*.rb"].each { |rb| require rb }

Cuba.use Rack::MethodOverride
Cuba.use Rack::Session::Cookie,
  key: "agpelliza",
  secret: "f38e07c008d362437645627c8886afeb67e45798"

Cuba.use Rack::Protection
Cuba.use Rack::Protection::RemoteReferrer

Cuba.use Rack::Static,
  urls: %w[/js /css /img],
  root: "./public"

Cuba.define do
  persist_session!

  on root do
    render("home")
  end
end
