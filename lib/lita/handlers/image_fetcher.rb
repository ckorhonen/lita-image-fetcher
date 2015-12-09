module Lita
  module Handlers
    class ImageFetcher < Handler
      config :pixabay_key, types: [String]

      route(/(?:image|img)(?:\s+me)? (.+)/i, :fetch, command: true, help: {
        "image QUERY" => "Displays an image matching the query."
      })

      def sources
        @sources ||= {}
        @sources[:pixabay] ||= Handlers::Pixabay.new(api_key: config.pixabay_key)
        @sources
      end

      def fetch(response)
        sources.each do |source_name, source_object|
          image_url = source_object.fetch(response)
          if validate(image_url)
            response.reply "#{image_url} (From #{source_name})"
            return
          end
        end

        response.reply "No images found from sources: #{sources.keys.join(', ')}"
      end

      def validate(url)
        return false if url.nil?
        if [".gif", ".jpg", ".jpeg", ".png"].any? { |ext| url.end_with?(ext) }
          url
        else
          "#{url}#.png"
        end
      end

      Lita.register_handler(ImageFetcher)
    end
  end
end
