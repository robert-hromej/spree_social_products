Spree::Product.class_eval do
  def facebook_shares(url)
    data = open("http://graph.facebook.com/?ids=#{URI.escape(url)}").read
    data = JSON.parse(data)
    unless data == [] || data[url]['shares'].nil?
      data[url]['shares']
    else
      0
    end
  end

  def facebook(url)
    data = open("https://graph.facebook.com/fql?q=SELECT%20like_count,%20total_count,%20share_count,%20click_count,%20comment_count%20FROM%20link_stat%20WHERE%20url%20=%20%27#{URI.escape(url)}%27").read
    data = JSON.parse(data)
    unless data == []
      data['data'][0]
    else
      {}
    end
  end

  def twitter_shares(url)
    data = open("http://urls.api.twitter.com/1/urls/count.json?url=#{URI.escape(url)}").read
    data = JSON.parse(data)
    data['count'] 
  end
end