# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_myPHP_session',
  :secret      => 'e90d979ba93ba00de9c3b2d34e36c35a9bdd481f77302aa2d75d5adf4c0ce0d0dcff87cc362ca01728ada4704aa058e251e3f30cee507d078db0fc727ee10f6f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
