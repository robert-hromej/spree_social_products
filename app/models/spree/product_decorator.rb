Spree::Product.class_eval do
  def facebook_likes(url)
    data = open("http://graph.facebook.com/?ids=#{URI.escape(url)}").read
    data = JSON.parse(data)
    unless data == []
      data[url]['shares']
    else
      0
    end
  end

  def twitter_shares(url)
    data = open("http://urls.api.twitter.com/1/urls/count.json?url=#{URI.escape(url)}").read
    data = JSON.parse(data)
    data['count'] 
  end
end