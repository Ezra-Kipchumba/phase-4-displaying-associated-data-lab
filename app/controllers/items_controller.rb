class ItemsController < ApplicationController
    
    def index
      items = Item.all.order(price: :desc)
      render json: items, include: :user, except: [:created_at, :updated_at]
    end
end
