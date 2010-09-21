## Contexts

def logged_in_with_http_basic_as_session_bot_context(&blk)
  context "Logged in with HTTP Basic as session_bot" do
    setup do
      sign_in_with_http_basic_as "session_bot", "dbfSbhbsd"
    end
    merge_block(&blk)
  end
end

def public_context(&blk)
  context "The public" do
    setup { sign_out }
    merge_block(&blk)
  end
end

## Helpers

def sign_out
  @request.session[:user_id] = nil
  @request.env.delete("HTTP_AUTHORIZATION")
end

def sign_in_with_http_basic_as(username = nil, password = nil)
  unless username
    user = Factory.build(:user)
    username = user.login_name
    password = user.password
    user.save
  end
  @request.env["HTTP_AUTHORIZATION"] = ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
end