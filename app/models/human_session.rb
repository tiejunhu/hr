class HumanSession < Authlogic::Session::Base
  # configuration here, see documentation for sub modules of Authlogic::Session
  allow_http_basic_auth = false
end