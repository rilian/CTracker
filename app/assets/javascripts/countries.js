$(".visit_countries").click(function (e) {
  e.preventDefault();

  $('form.countries_form').submit();

  $(':checkbox').each(function () {
    if (this.checked) {
      alert('visited ' + $(this).data('country_id'));
    }
  });
});
