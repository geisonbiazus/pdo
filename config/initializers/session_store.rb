# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pdo_session',
  :secret      => '14047c2079e8c38156d5a46096279ef5ad3f30f1e2b104030dd153f5353b03b5e76d9e84e6c92e6aca688eb7984aaf9b29e316860d64c0ecb2f8e31d8d722480'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
