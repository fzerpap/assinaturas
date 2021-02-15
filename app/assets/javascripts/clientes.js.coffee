#= require bootstrapValidator/bootstrapValidator


jQuery(document).ready ->

  $("#dttb").dataTable();

  $('#form-cliente').bootstrapValidator
    feedbackIcons:
      valid: 'fa fa-check ',
      invalid: 'fa fa-times',
      validating: 'fa fa-refresh'
    live: 'submitted'
    fields:
      "cliente[nome]":
        validators:
          notEmpty:
            message: 'Por gentileza, insira o nome do cliente'
      "cliente[cpf]":
        validators:
          notEmpty:
            message: 'Por gentileza, insira o CPF'
      "cliente[email]":
        validators:
          notEmpty:
            message: 'Por gentileza, insira o email'
          emailAddress: 
            message: 'Por gentileza, insira um email válido'  
