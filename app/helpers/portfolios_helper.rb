module PortfoliosHelper
  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end

  def portfolio_img img, type
    if type == 'thumb'
      img.model.thumb_image? ? img : image_generator(height: '350', width: '200')
    elsif type == 'main'
      img.model.main_image? ? img : image_generator(height: '600', width: '400')
    end
  end
end
