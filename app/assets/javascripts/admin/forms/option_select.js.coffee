#on change question type
$(document).on "change", "#product_product_category_id", (event) ->
  event.preventDefault()
  $.ajax
    url: "/admin/product_sub_categories/fetch_list/" + $(this).val() + ".json"
    success: (data) ->
      $target = $("#product_product_sub_category_id")
      $target.html ""
      i = 0
      while i < data.length
        $target.append "<option value=" + data[i].id + ">" + data[i].name + "</option>"
        i++
  