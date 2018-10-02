class SessionsController < ApplicationController

  def new
    # No need for anything in here, we are just going to render our
    # new.html.erb AKA the login page
  end

  def createAdmin
    # Look up Admon in db by the email address submitted to the login form and
    # convert to lowercase to match email in db in case they had caps lock on:
    admin = Admin.find_by(email: params[:login][:email].downcase)
    
    # Verify Admin exists in db and run has_secure_password's .authenticate() 
    # method to see if the password submitted on the login form was correct: 
    if admin && admin.authenticate(params[:login][:password]) 
      # Save the admin.id in that admin's session cookie:
      session[:admin_id] = admin.id.to_s
      redirect_to show_path(admin), notice: 'Εχεις συνδεθεί με επιτυχία!'
    else
      # if email or password incorrect, re-render login page:
      flash.now.alert = "Έχετε εισάγει λάθος email ή κωδικό.Προσπαθήστε ξανά."
      render :new
    end
  end

  #arxikopoihsh tou user me ta stoixeia apo to omniauth
  #dhmiourgia tou cookie ths efarmoghs
  #anakateuthinsh sthn selida twn games
  def create
   user = User.from_omniauth(ENV["omniauth.auth"])
   print current_user
   session[:user_id] = user_id
   redirect_to games_path
  end

  #thetoume to cookie tou xrhsth sthn timh nil
  #anakateuthinsh sthn arxikh selida
  def destroy
    session.delete(current_user)
    redirect_to root_url, notice: "#{current_user.inspect}"
  end
  

  def destroyAdmin
    # delete the saved user_id key/value from the cookie:
    session.delete(current_admin)
    redirect_to login_path, notice: "Αποσυνδεθήκατε επιτυχώς!"
  end

  


end
