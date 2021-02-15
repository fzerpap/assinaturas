#= require bootstrapValidator/bootstrapValidator


jQuery(document).ready ->

  $("#dttb").dataTable();

  $('#form-marca').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'submitted'
    fields:
      "marca[nome]":
        validators:
          notEmpty:
            message: 'Por gentileza, insira o nome da marca de telefone'
