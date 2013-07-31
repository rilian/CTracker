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

// Render filter results
$(".search_btn").click(function (e) {
  e.preventDefault();

  $.ajax({
    url: '/countries/index_table',
    data: $('form.country_search').serialize()
  }).done(function(data) {
    $('#countries_table').html(data);
    bind_select_all();
  });
});
