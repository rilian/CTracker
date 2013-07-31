function bind_select_all() {
  $("#select_all").click(function () {
    var checked = this.checked;

    $(':checkbox').each(function () {
      this.checked = checked;
    });
  });
}

$(document).ready(function () {
  bind_select_all();
});
