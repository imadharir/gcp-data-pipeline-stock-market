resource "google_pubsub_topic" "stockMarketTopic" {
    name = "stockMarketTopic"
}

resource "google_pubsub_subscription" "stockMarketSubscription" {
    name  = "stockMarketSubscription"
    topic = google_pubsub_topic.stockMarketTopic.name
}