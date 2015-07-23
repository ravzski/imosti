$(document).on "click", '.submit-btn', (event) ->
  event.preventDefault()
  if is_not_blank('.required') 
    $("#overlay").removeClass "hidden"
    $('form').submit()



$(document).on "click", '.submit-summernote', (event) ->
  event.preventDefault()

  if is_not_blank('.required') 
    $('.note-editable').each ->
      $(this).parents().eq(1).find('textarea').val($(this).html())

    $("#overlay").removeClass "hidden"
    $('form').eq(0).submit()


$(document).on "click", '.submit-modal-btn', (event) ->
  event.preventDefault()
  $parent = $(this).parents().eq(2)
  if is_not_blank($parent.find('.required')) 
    $("#overlay").removeClass "hidden"
    $parent.find('form').submit()



$(document).on "click", '.search-btn', (event) ->
  event.preventDefault()
  $form = $('.search-form')
  $form.find('input').each ->
    if $(this).val().trim() == ""
      $(this).prop("disabled",true)

  $form.find('select').each ->
    if $(this).val() == ""
      $(this).prop("disabled",true)
  $("#overlay").removeClass "hidden"
  $form.submit()


# $(document).on "change", '.unit-type-field', (event) ->
#   event.preventDefault();
#   generate_product_item_name($(this).parents().eq(1))


# $(document).on "keyup", '#product_name', (event) ->
#   event.preventDefault();
#   $('.nested-product-item-fields').each ->
#     generate_product_item_name($(this))

# $(document).on "keyup", '.quantity-field', (event) ->
#   event.preventDefault();
#   generate_product_item_name($(this).parents().eq(1))

# generate_product_item_name =(element) ->
#   product_name = $('#product_name').val()
#   unit_type_name = element.find('.unit-type-field :selected').text()
#   quantity_name = element.find('.quantity-field').val()
#   product_item_name = product_name+" ("+quantity_name+" "+unit_type_name+")"
#   element.find('.product-name-field').val(product_item_name)

@success = ->

  setTimeout (->
    $.bootstrapGrowl "Update Successful",
      type: "info"

    return
  ), 5