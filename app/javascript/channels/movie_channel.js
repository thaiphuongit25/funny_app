import consumer from "channels/consumer"

consumer.subscriptions.create("MovieChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const result = data.data;
    $(".notify-email").html(result.email);
    $('.notify-title').html(result.movie.title);
    $('.notify-title').attr('href', result.movie.youtube_url);
    $('#notify').modal('show');
  }
});
