class ItemsController < ApplicationController
  before_action :set_action, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def update
    if current_user.id == @item.user.id
      if @item.update(item_params)
        redirect_to action: :show
      else
        render :edit
      end
    else
      redirect_to root_path
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :delivery_fee_id, :prefecture_id,
                                 :ship_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_action
    @item = Item.find(params[:id])
  end
end
