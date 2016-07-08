module Dashboard
  class SeoAnalyzer < WordsCounted::Counter
    attr_accessor :string

    def initialize(string)
      @string = string
    end

    def tokenize_words(string = @string, exclude = html_tags)
      @counter = WordsCounted.count(string, exclude: exclude)
    end

    def word_count
      tokenize_words(@string)
      @counter.token_count
    end

    def word_analysis(string = @string)
      @analysis = {}
      tokenize_words(string, html_and_stop_words)
      @counter.token_frequency.each { |word, freq| @analysis[word] = {frequency: freq} }
      @counter.token_density.each   { |word, dens| @analysis[word][:density] = dens }
      @analysis
    end

    def words
      @words = []
      word_analysis(@string)
      @analysis.each_pair { |word, values| @words.push SeoWord.new(word, values[:frequency], values[:density])}
      @words
    end

    def word_density(string)
      tokenize_words(string, html_and_stop_words)
      @counter.token_density
    end

    def word_frequency(string)
      tokenize_words(string, html_and_stop_words)
      @counter.token_frequency
    end

    def html_tags
      ["figcaption", "figure", "amazonaws", "https", "booqcms", "class",
        "inline-image", "id", "src", "href", "alt", "title", "description",
        "allowfullscreen", "frameborder", "www", "png", "jpg", "gif", "iframe",
        "youtube", "uploads", "target", "blank", "embed", "xs", "''", "'blank'",
        "video", "video-wrapper"]
    end

    def stop_words
        %w(a about above after again against all am an and any are aren't as at be because
        been before being below between both but by can't cannot could couldn't did
        didn't do does doesn't doing don't down during each few for from further had
        hadn't has hasn't have haven't having he he'd he'll he's her here here's hers
        herself him himself his how how's i i'd i'll i'm i've if in into is isn't it
        it's its itself let's me more most mustn't my myself no nor not of off on once
        only or other ought our ours 	ourselves out over own same shan't she she'd
        she'll she's should shouldn't so some such than that that's the their theirs
        them themselves then there there's these they they'd they'll they're they've
        this those through to too under until up very was wasn't we we'd we'll we're
        we've were weren't what what's when when's where where's which while who who's
        whom why why's with won't would wouldn't you you'd you'll you're you've your
        yours yourself yourselves)
    end

    def html_and_stop_words
      stop_words.concat html_tags
    end

    class SeoWord < SeoAnalyzer
      attr_accessor :word, :frequency, :density

      def initialize(word, frequency, density)
        @word = word
        @frequency = frequency
        @density = density
      end

      # def frequency(word)
      #   @analysis[word][:frequency]
      # end
      #
      # def density(word)
      #   @analysis[word][:density]
      # end

    end

  end
end
