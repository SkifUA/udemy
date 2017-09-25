class PagesController < ApplicationController
  def home
  end

  def about
    @skills = Skill.all.default_order
  end

  def contact
  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end
end
