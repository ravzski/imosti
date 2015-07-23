$(document).on "click", '.collapse-btn', (event) ->
  event.preventDefault()
  $this = $(this)

  if $this.hasClass("expand-sidebar")
    $('.logo').addClass("expanded")
    $('.sidebar').removeClass("small").addClass("expanded")
    $('.main').removeClass("small").addClass("expanded")
    $this.removeClass("expand-sidebar")
    $this.find('i').removeClass("fa-angle-right").addClass("fa-angle-left")
  else
    $('.logo').removeClass("expanded")
    $('.sidebar').removeClass("expanded").addClass("small")
    $('.main').removeClass("expanded").addClass("small")

    $this.addClass("expand-sidebar")
    
    $this.find('i').removeClass("fa-angle-left").addClass("fa-angle-right")