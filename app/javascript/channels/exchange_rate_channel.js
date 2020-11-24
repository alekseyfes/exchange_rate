import consumer from "./consumer"

consumer.subscriptions.create("ExchangeRateChannel", {
  connected() {
    this.updateRate();
  },

  updateRate() {
    this.perform("current_rate")
  },
  
  received(data) {
    document.querySelector("#exchange-rate").innerHTML = data["rate"];
  }
});
