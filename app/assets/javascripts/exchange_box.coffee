update_cot = ->
  if $('form').attr('action') == '/exchange'
    $.ajax '/exchange',
      type: 'POST'
      dataType: 'json'
      data: {
              currency: $("#currency").val(),
              currency_destination: $("#currency_destination").val(),
              quantity: $("#quantity").val()
            }
      error: (jqXHR, textStatus, errorThrown) ->
        alert textStatus
      success: (data, text, jqXHR) ->
        $('#result').val(data.value)
    return false;

$(document).ready ->
  $("#quantity").change ->
    update_cot()
  $("#currency").change ->
    update_cot()
  $("#currency_destination").change ->
    update_cot()

  $(".swap_currency").click ->
    currency = $("#currency").val()
    currency_destination = $("#currency_destination").val()
    $("#currency").val(currency_destination)
    $("#currency_destination").val(currency)
    update_cot()
