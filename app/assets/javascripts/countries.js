$(".visit_countries").click(function (e) {
  e.preventDefault();

  $('form.countries_form').submit();

  $(':checkbox').each(function () {
    if (this.checked) {
      var container = $('tr[data-country_id=' + $(this).data('country_id') + ']');
      container.children('td.status').html('Visited');
      container.children('td.checker').html('');
    }
  });

  $.ajax({url: '/countries/pie_chart'});
  $.ajax({url: '/countries/line_chart'});
});


