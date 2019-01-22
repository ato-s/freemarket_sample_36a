class BuysController < ApplicationController

  def show
    @item=Item.find(1)
    @image=Picture.find(1)
    @address=Address.find(1)
  end

end
