class UsersController < Clearance::UsersController


def new
	@user = User.new
	render template :"users/new"
end 

def create 
  @user = User.new(users_params) 
  if @user.save 
  	sign_in @user
	redirect_back_or url_after_create
   else
     render template: "users/new"
   end

end 


private 

	def users_params
		params.require(:user).permit(:email, :name, :password)
	end 

end