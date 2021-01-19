class LikesController < ApplicationController
    before_action :item_params

    def create
      Like.create(user_id: current_user.id, item_id: params[:id])
    end
  
    def destroy
      Like.find_by(user_id: current_user.id, item_id: params[:id]).destroy
    end
  
    private
  
    def item_params
      @item = Item.find(params[:id])
    end
end
