class PeopleImageJSAdapter < JSAdapter
  ASPECT_RATIO = 3/2.to_f

  def initialize(pictures)
    @id = pictures.id
    # @listing_id = pictures.listing_id
    # @ready = !pictures.image_processing && pictures.image_downloaded;
    @ready = true
    # @errored = pictures.error.present?
    @images = {
      thumb: pictures.image.url(:thumb),
      big: pictures.image.url(:big)
    }
    # @aspect_ratio = if pictures.correct_size? ASPECT_RATIO
    #     "correct-ratio"
    #   elsif pictures.too_narrow? ASPECT_RATIO
    #     "too-narrow"
    #   else
    #     "too-wide"
    #   end
  end

  #json style hash with camelized keys
  def to_hash
    hash = HashUtils.object_to_hash(self)
    HashUtils.camelize_keys(hash)
  end
end
