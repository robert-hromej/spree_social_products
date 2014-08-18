Spree::Product.class_eval do
  def facebook_shares(url)
    count = 0
    get_urls_for_both_protocols(url).each do url
      data = get_counts_for_social_media_api("http://graph.facebook.com/?ids=#{URI.escape(url)}")
      unless data == [] || data[url]['shares'].nil?
        count += data[url]['shares']
      end
    end
    count
  end

  def facebook(url)
    data = get_counts_for_social_media_api("https://graph.facebook.com/fql?q=SELECT%20like_count,%20total_count,%20share_count,%20click_count,%20comment_count%20FROM%20link_stat%20WHERE%20url%20=%20%27#{URI.escape(url)}%27")
    unless data == []
      data['data'][0]
    else
      {}
    end
  end

  def twitter_shares(url)
    get_counts_for_social_media_api(
      "http://urls.api.twitter.com/1/urls/count.json?url=#{URI.escape(url)}"
      )['count'] 
  end

  private

  def get_urls_for_both_protocols(url)
    urls = {}
    urls[:http] = url.sub(/https:/, "http:")
    urls[:https] = url.sub(/http:/, "https:")
    urls
  end

  def get_counts_for_social_media_api(url_api_call)
    JSON.parse(open(url_api_call).read)
  end 
end