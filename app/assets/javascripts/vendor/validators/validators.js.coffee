@is_group_unique = (class_name, module_name) ->
  unique_flag = 0
  required_flag = 0
  flag = 0
  $(class_name).each (index) ->
    $this = $(this)
    value = $this.val().trim()
    bigger_index = index
    if value != ""
      if $(class_name).length != 1
        $(class_name).each (index) ->
          current_value = $(this).val().trim()
          if current_value !=""
            if bigger_index != index

              if current_value.toLowerCase() is value.toLowerCase()
                unique_flag = 1
                flag = 1
                $this.css "border", "1px solid #d43"
                $(this).css "border", "1px solid #d43"
              else
                $this.css "border", "1px solid #ddd"
                $(this).css "border", "1px solid #ddd"


          $(this).val current_value

      else
        $this.val value
        $this.css "border", "1px solid #ddd"
    else
      required_flag = 1
      flag = 1
      $this.css "border", "1px solid #d43"

  if unique_flag == 1
    $(".error-class").append module_name + " must be unique<Br/>"  
  if required_flag is 1
    $(".error-class").append module_name + " is Required<Br/>"

  if flag is 1
    $(".alert-danger").removeClass "hidden"
    return 1


@is_required = (class_name, module_name) ->
  $this = $(class_name)
  flag = 0

  $this.each ->
    value = $(this).val().trim()
    if value == ""
      $(this).css "border", "1px solid #d43"
      flag = 1
    else
      $(this).val value
      $(this).css "border", "1px solid #ddd"

  if flag is 1
    $(".error-class").append module_name + " is required<Br/>"
    $(".alert-danger").removeClass "hidden"
    return 1


@is_not_blank = (class_name) ->
  $this = $(class_name)
  flag = 0

  $this.each ->
    value = $(this).val().trim()
    if value == ""
      $(this).addClass("error")
      flag = 1
    else
      $(this).val value
      $(this).removeClass("error")

  if flag == 1
    return false
  else
    return true

@is_the_same = (value1, value2) ->
  if value1.trim() == value2.trim()
    return 1
  else
    return 0

@check_length = (value, length)->
  if value.trim().length < 6
    return 0
  else
    return 1





@is_email_valid = (class_name) ->
  email = $(class_name).val().trim()
  re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  
  if re.test email
    $(class_name).removeClass("error")
    return true
  else
    
    $(class_name).addClass("error")
    return false
    
@is_password_correct=(class_name,limit)->
  $('.error-class').html("")

  if $(class_name).length < 0
    return true
  else if $(class_name).eq(0).val().trim() == "" &&  $(class_name).eq(1).val().trim() == ""
    return true
  if $(class_name).eq(0).val().trim().length < limit || $(class_name).eq(1).val().trim().length < limit
    $(class_name).addClass('error')
    $('.alert').removeClass("hidden")
    $('.error-class').append("Password must be more than 8 characters");
    return false   
  else if $(class_name).eq(0).val().trim() == $(class_name).eq(1).val().trim()
    $(class_name).removeClass('error')
    return true
  else
    $(class_name).addClass('error')
    $('.alert').removeClass("hidden");
    $('.error-class').append("Password did not match");
    return false


@has_illegal_character=(class_name)->
  illegal_chars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?"; 
  $this = $(class_name)
  flag = 0

  $this.each ->
    value = $(this).val().trim()

    if  /[^A-Za-z\d]/.test(value) == true
      console.log value
      $(this).addClass("error")
      flag = 1
    else
      $(this).val value
      $(this).removeClass("error")

  if flag == 1
    return true
  else
    return false





escapeHtml = (text) ->
  text.replace(/&/g, "&amp;").
  replace(/</g, "&lt;").
  replace(/>/g, "&gt;").
  replace(/"/g, "&quot;").
  replace(/'/g, "&#039;").
  replace(/\./g, "")
