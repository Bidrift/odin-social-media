class ProfilesController < ApplicationController
    before_action :authenticate_user!

    before_action only: [ :bio, :avatar ] do
        authorize_user(Profile.find(params[:id]).user.id)
    end

    def bio
        @profile = Profile.find(params[:id])

        respond_to do |format|
            if @profile.update(profile_bio_params)
                flash.now["success"] = "Bio changed successfully"
                format.turbo_stream { render :bio, status: :ok }
            else
                flash.now["alert"] = "Failed to update bio"
                format.turbo_stream { render :bio, status: :unprocessable_entity }
            end
        end
    end

    def avatar
        @profile = Profile.find(params[:id])
        if @profile.avatar.attached?
            @profile.avatar.purge
        end
        if @profile.avatar.attach(params[:profile][:avatar])
            redirect_to user_path(current_user)
        else
            head(:unprocessable_entity)
        end
    end

    private

    def profile_avatar_params
        params.expect(profile: [ :avatar ])
    end
end
