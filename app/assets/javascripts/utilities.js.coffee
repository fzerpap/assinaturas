
$ ->
  $('#customer-autocomplete').autocomplete source: '/search_customers'
  return

$("#customer-autocomplete").autocomplete select: (event, i) ->
  console.log('entro')
  $.ajax
    type: "POST"
    url: "/customers/get_customer" 
    dataType: "JSON"
    data:
      customer: i.item.value
    success: (data) ->
      console.log(data)
      $(".box1").css('display','block')
      $("#customer-id").val(data[0]['id'])
      $("#customer-autocomplete").val(data[0]['code'])
      $("#customer-name").val(data[0]['name'])
      $("#customer-email").val(data[0]['email'])




    

