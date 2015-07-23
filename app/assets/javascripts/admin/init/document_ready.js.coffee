$(document).on 'ready page:load', ->


  $('.sidebar li a').tooltip()
  if $('.date').length >0
    $(".date").datetimepicker({
      timepicker:false,
      format:'d M Y'
      });

  if $("input.numeric").length > 0
    $("input.numeric").numeric()







# $(document).on 'ready page:fetch', ->
#   $("#overlay_loading").removeClass "hidden"

# $(document).on 'ready page:receive', ->
#   $("#overlay_loading").addClass "hidden"
