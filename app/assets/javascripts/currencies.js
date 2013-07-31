$(".collect_currencies").click(function (e) {
  e.preventDefault();

  $('form.currencies_form').submit();

  $(':checkbox').each(function () {
    if (this.checked) {
      var container = $('tr[data-currency_id=' + $(this).data('currency_id') + ']');
      container.children('td.status').html('Collected');
      container.children('td.checker').html('');
    }
  });

  $.ajax({url: '/currencies/pie_chart'});
  $.ajax({url: '/currencies/line_chart'});
});

// Render filter results
$(".search_btn").click(function (e) {
  e.preventDefault();

  $.ajax({
    url: '/currencies/index_table',
    data: $('form.currency_search').serialize()
  }).done(function (data) {
      $('#currencies_table').html(data);
    });
});
