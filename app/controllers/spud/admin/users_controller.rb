class Spud::Admin::UsersController < Spud::Admin::ApplicationController
	layout 'spud/admin/detail'
	belongs_to_spud_app :users
	add_breadcrumb "Users", {:action => :index}

  # filters
	before_filter :load_user,:only => [:edit,:update,:show,:destroy]

	def index
		sort_order = "login asc"
		if sort_column
			if sort_column == 'first_name'
				sort_order = "first_name #{sort_direction}, last_name #{sort_direction}"
			else
				sort_order = "#{sort_column} #{sort_direction}"
			end
		end
		@users = SpudUser.order(sort_order).paginate :page => params[:page]
		respond_with @users
	end

	def show
    add_breadcrumb @user.full_name, 'spud_core.admin_user_path'
		respond_with @user
	end

	def new
		@user = SpudUser.new
		Spud::Core.admin_applications.each do |application|
			@user.spud_admin_permissions.new(:name => application[:name],:access => false)
		end
		respond_with @user do |format|
			format.js { render :partial => "new"}
		end
	end

	def create
		status = 500
		@user = SpudUser.new(params[:spud_user],:as => :admin)

		if @user.save
			status = 200
			flash[:notice] = "User created successfully"
		else
			flash[:error] = "There was an error while saving the user."
		end

		respond_with @user,:location => spud_core.admin_users_url do |format|
			format.js { render :status => status, :json => @user.to_json }
			format.html {
				if status == 200
					redirect_to spud_core.admin_users_url()
				else
					render :action => "new"
				end
			}
		end
	end

	def edit
		Spud::Core.admin_applications.each do |application|
			permission = @user.spud_admin_permissions.select {|perm| perm.name == application[:name]}
			if permission.blank?
				@user.spud_admin_permissions.new(:name => application[:name],:access => @user.super_admin)
			end
		end
		respond_to do |format|
			format.js { render :partial => "edit"}
			format.html { render }
		end
	end

	def update
		if @user.update_attributes(params[:spud_user], :as => :admin)
			flash[:notice] = "User saved successfully."
			redirect_to spud_core.admin_users_url()
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
			format.html {redirect_to spud_core.admin_users_url()}
		end
	end

private

	def load_user
		@user = SpudUser.where(:id => params[:id]).first
		if @user.blank?
			flash[:error] = "User not found!"
			redirect_to spud_core.admin_users_url() and return false
		end
		return true
	end

end
