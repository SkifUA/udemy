module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_default
  end

  def set_page_default
    @page_title = "Valerii Kuzin | My Portfolio Website"
    @seo_keywords = "Valerii Kuzin portfolio"
  end
end