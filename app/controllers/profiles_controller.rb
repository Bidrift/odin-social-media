class ProfilesController < ApplicationController
    before_action :authenticate_user!

    before_action only: [ :bio ] do
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

    private

    def profile_bio_params
        params.expect(profile: [ :bio ])
    end
end
