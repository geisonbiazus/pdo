// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function collectionToArray(collection)
{
    var array = [];
    for(var i=0; i < collection.length; i++)
    {
        array.push(collection[i]);
    }
    return array;
}


function getInputsParameters(elemento) {

    var retorno = '';

    if ($(elemento)) {

        var elementos = $(elemento).getElementsByTagName('input');

        retorno = collectionToArray(elementos).findAll(function(input) {
            if ((input.type == 'checkbox' || input.type == 'radio') && ! input.checked) return false;
            return (input.type != 'submit' && input.name != 'authenticity_token');
        }).collect(function(input) {
            return input.name + '=' + input.value;
        }).join("&");

    }

    return retorno;
}

function removeElemento(elemento) {
    $(elemento).parentNode.removeChild($(elemento));
}