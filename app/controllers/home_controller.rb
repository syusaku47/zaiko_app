class HomeController < ApplicationController
  before_action :forbid_login_user,{only:[:top]}

  def top
  end

  def howto
  end

  def test
  end
end
