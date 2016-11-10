class RankingController < ApplicationController
  
  # Haveのランキングデータを取得
  def have
    @title = "have ranking" 
    @ranking = Have.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = @ranking.keys
    @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
    render 'ranking'
  end

  # Wantのランキングデータを取得
  def want
    @title = "want ranking" 
    @ranking = Want.group(:item_id).order('count_item_id desc').limit(10).count('item_id')
    item_ids = @ranking.keys
    @items = Item.find(item_ids).sort_by{|o| item_ids.index(o.id)}
    render 'ranking'
  end

end
