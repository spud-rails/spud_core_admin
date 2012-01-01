class Spud::Admin::UsersController < Spud::Admin::ApplicationController
	layout 'spud/admin/detail'
	add_breadcrumb "Users", :spud_admin_users_path

# filters
	before_filter :load_user,:only => [:edit,:update,:show,:destroy]

	def index
		@page_thumbnail = "spud/admin/users_thumb.png"
		@page_name = "Users"	

		@users = SpudUser.order(:login).paginate :page => params[:page]
		respond_to do |format|
			format.json {render :json => @users.to_json}
			format.js {render :json => @users.to_json}
			format.xml {render :xml => @users.to_xml}
			format.html { render }
		end
	end

	def show
			add_breadcrumb @user.full_name, :spud_admin_user_path
			@page_thumbnail = "spud/admin/users_thumb.png"
			@page_name = @user.full_name	
	end
	def new
		@user = SpudUser.new

		respond_to do |format|
			format.js { render :partial => "new"}
			format.html { render }
		end
		
	end

	def create
		status = 500
		@user = SpudUser.new(params[:spud_user])
		if @user.save
			status = 200
			flash[:notice] = "User created successfully"

		else
			flash[:error] = "There was an error while saving the user."
			render :action => "new"
		end

		respond_to do |format|
			format.js { render :status => status, :json => @user.to_json}
			format.html {
				if status == 200
					redirect_to spud_admin_users_url()
				else
					render :action => "new"
				end		
			}
		end
	end


	def edit
		respond_to do |format|
			format.js { render :partial => "edit"}
			format.html { render }
		end
	end

	def update
		if @user.update_attributes(params[:spud_user])
			flash[:notice] = "User saved successfully."
			redirect_to spud_admin_users_url()
		else
			flash[:error] = "There was an error while saving the user."
			render :action => "edit"
		end
	end

	def destroy
		status = 500
		if @user.destroy
			status = 200
			flash[:notice] = "User removed."
		else
			flash[:error] = "There was an error removing the user"
		end

		respond_to do |format|
			format.js { render :text => nil,:status => status }
			format.html {redirect_to spud_admin_users_url()}
		end
		
	end

private

	def load_user
		@user = SpudUser.where(:id => params[:id]).first
		if @user.blank?
			flash[:error] = "User not found!"
			redirect_to spud_admin_users_url() and return false
		end
		return true
	end

end
