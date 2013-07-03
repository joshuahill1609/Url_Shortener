class UrlShortener
  include SecureRandom

  def self.login(email)
    @current_user_id = User.find_by_email(email).id
  end

  def self.shorten(long_url)
    short_url = SecureRandom.urlsafe_base64(5)

    if LongUrl.find_by_url(long_url).nil?
      long_url = LongUrl.new(:url => long_url)
      long_url.save!
    else
      long_url = LongUrl.find_by_url(long_url)
    end
    short = ShortUrl.new(
      :s_url => short_url, :long_url_id => long_urlshorten.id,
      :user_id => @current_user_id)
    short.save!
    short.s_url
  end

  def self.expand(s_url)
    short_url = ShortUrl.find_by_s_url(s_url)
    visit = Visit.new(:user_id => @current_user_id, :short_url_id => short_url.id)
    visit.save!
    long = LongUrl.find_by_id(short_url.long_url_id)

    puts UrlShortener.show_comments(short_url) if UrlShortener.show_comments(short_url)

    Launchy.open(long.url)
  end

  def self.num_visits(s_url)
    s_url_id = ShortUrl.find_by_s_url(s_url).id
    Visit.count(:id, :conditions => "short_url_id = #{s_url_id}", :group => :short_url_id)
  end

  def self.num_uniq_visits(s_url)
    s_url_id = ShortUrl.find_by_s_url(s_url).id
    Visit.count(:user_id, :distinct => :true, :conditions => "short_url_id = #{s_url_id}", :group => :short_url_id)
  end

  def self.num_recent_visits(s_url)
    s_url_id = ShortUrl.find_by_s_url(s_url).id

    Visit.where("created_at >= ? AND short_url_id = ?",
      Time.now - 600, s_url_id).length
  end

  def self.add_comment(s_url, comment)
    s_url_id = ShortUrl.find_by_s_url(s_url).id
    comment = Comment.new(:body => comment, :short_url_id => s_url_id, :user_id => @current_user_id )
    comment.save!
  end

  def self.show_comments(s_url)
    return nil if Comment.find_by_short_url_id(s_url.id).nil?
    Comment.find_by_short_url_id(s_url.id).body
  end

  def self.add_tag(s_url, tag)
    short = ShortUrl.find_by_s_url(s_url)
    short.tag_topic = TagTopic.find_by_tag(tag)
    short.save!
  end

  def self.build_tag_table
    sports = TagTopic.new(:tag => "sports")
    sports.save!
    social = TagTopic.new(:tag => "social")
    social.save!
    news = TagTopic.new(:tag => "news")
    news.save!
  end
end