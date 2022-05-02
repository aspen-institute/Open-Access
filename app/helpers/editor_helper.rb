module EditorHelper

  def self.interpolate_icons(text)
    text.gsub(/:([a-zA-Z0-9-]+\s[a-zA-Z0-9-]+):/, '<i class="\1"></i>')
  end

  def self.alignment(block)
    if block['tunes'].present?
      if block['tunes']['alignmentTune'].present?
        return block['tunes']['alignmentTune']['alignment']
      end
    end

    return 'left'
  end

end
