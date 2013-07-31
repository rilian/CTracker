$("#select_all").click(function () {
  var checked = this.checked;

  $(':checkbox').each(function () {
    this.checked = checked;
  });
});
