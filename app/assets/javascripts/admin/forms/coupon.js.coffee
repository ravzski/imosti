$(document).on "change", '.coupon-type-select', (event) ->
  event.preventDefault()
  val = $(this).val()

  # if val == "0"
  #   $('.discount-amount-field').addClass("hidden")
  # else
  #   $('.discount-amount-field').removeClass("hidden")
  
  if val == "2" || val == "4"
    $('#discount-label').text("Percent (%)")
  else if val == "0"
    $('#discount-label').text("Amount Threshold")
  else
    $('#discount-label').text("Amount")

  if val == "3" || val == "4"
    $('.product-mapping-field').removeClass("hidden")
