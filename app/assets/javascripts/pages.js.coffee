# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ -> 
  $('.slide:first').siblings('.slide').hide()
  speed = 2000
  pause = false  
  current_slide = $('.slide:first')

  slideshow = (slide) ->
    setTimeout( => 
      if slide.next('.slide').length
        next_slide = slide.next('.slide')
      else
        next_slide = $('.slide:first')
      slide.fadeOut('slow')
      next_slide.fadeIn('slow')
      slideshow next_slide
    , speed*2)

  slideshow(current_slide)

$ ->
  notice = $('#notice')
  notice.css('display', 'none')
  notice.click ->
    notice.fadeOut('slow')
  if (notice.html())
    notice.fadeIn('slow').delay(3000).fadeOut('slow')
