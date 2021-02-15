#= require bootstrapValidator/bootstrapValidator


jQuery(document).ready ->

  $("#dttb").dataTable();

  $('#form-modelo').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'submitted'
    fields:
      "modelo[nome]":
        validators:
          notEmpty:
            message: 'Por gentileza, insiar o nome do modelo do telefone'
      "modelo[marca_id]":
        validators:
          notEmpty:
            message: 'Por gentileza, selecione a marca do telefone'
