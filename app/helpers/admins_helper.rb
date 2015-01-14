module AdminsHelper
  def login(admin)
    session[:admin_id] = admin.id
  end
end
