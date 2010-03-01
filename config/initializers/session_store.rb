# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dinner_party_todo_session',
  :secret      => 'f5e76b6238f8bab6f52360c2689ecf7d7282331c0846ffe6125045c0a7696e9ceb3f0103435a3cebafb76647647588e1e5fc053dca660efd0bd1a8443a42249d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
