# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
    $('#product_subcategory_id').hide()
    subcategories = $('#product_subcategory_id').html()
    $('#product_category_id').change ->
        category = $('#product_category_id :selected').text()
        options = $(subcategories).filter("optgroup[label='#{category}']").html()
        if options
            $('#product_subcategory_id').html(options)
            $('#product_subcategory_id').show()
        else
            $('#product_subcategory_id').empty()
            $('#product_subcategory_id').hide()