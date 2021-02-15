#= require bootstrapValidator/bootstrapValidator


jQuery(document).ready ->

  $("#dttb").dataTable();

  
  $('#form-cliente-assinatura').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'submitted'
    fields:
      "nome":
        validators:
          notEmpty:
            message: 'Por favor, insira o nome do cliente'
      "cpf":
        validators:
          notEmpty:
            message: 'Por favor, insira o CPF'
      "email":
        validators:
          notEmpty:
            message: 'Por favor, insira o email'
          emailAddress: 
            message: 'Por favor, insira um email válido'  
      "assinatura[modelo_id]":
        validators:
          notEmpty:
            message: 'Por favor, selecione a marca do telefone'
      "assinatura[imei]":
        validators:
          notEmpty:
            message: 'Por favor, insira o IMEI do telefone'
      "assinatura[preco_anual]":
        validators:
          notEmpty:
            message: 'Por favor, insira o preco anual do contrato'
      "assinatura[num_parcelas]":
        validators:
          notEmpty:
            message: 'Por favor, insira o numero de parcelas'
            
  $("#select-marca").on "change", ->
    console.log('entro')
    $.ajax
      type: "POST"
      url: "/modelos/get_modelos" 
      dataType: "JSON"
      data:
        marca_id: $("#select-marca").val()
      success: (data) ->
        console.log(data)
        $(".box").css("display", "block")
        $("#select-modelo").empty()
        if data.length > 0
          $("#select-modelo").append('<option value= 0'+'>'+'Select o Modelo</option>')
          $.each data, (index, item) ->
            $("#select-modelo").append('<option value='+item.id+'>'+item.nome+'</option>')
        else
          $("#select-modelo").append('<option value= 0'+'>'+'A marca selecionada nao tem modelos</option>')
      error: (data) ->
        alert('A marca selecionada nao tem modelos de telefone')

