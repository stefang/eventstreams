module TalksHelper
  def talk_has_speaker?(speaker)
    @talk.speakers.include?(speaker)
  end
end
