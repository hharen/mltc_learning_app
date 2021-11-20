# frozen_string_literal: true

class VideoMaterial < Material
  def title
    'Video'
  end

  def show_body
    "<video controls width='600'>
      <source src='#{body}.mp4' type='video/mp4'>
      <source src='#{body}.mov' type='video/mov'>
      <p>Your browser doesn\'t support HTML5 video. Here is
         a <a href='#{body}.mp4'>link to the video</a> instead.</p>
    </video>"

    # FIXME: add a video tag
  end
end
