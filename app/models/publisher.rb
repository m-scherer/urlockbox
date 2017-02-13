class Publisher
  attr_reader :channel, :lockbox_to_hotreads_queue

  def initialize
    connection = Bunny.new(
    host: "experiments.turing.io",
    port: "5672",
    user: "student",
    pass: "PLDa{g7t4Fy@47H"
    )
    connection.start
    @channel = connection.create_channel
    create_channel
  end

  def create_channel
    @lockbox_to_hotreads_queue = channel.queue("ms.lockbox.to.hotreads")
  end

  def publish_to_queue(link)
    lockbox_to_hotreads_queue.publish(link.to_json)
    puts link.to_json
  end

end
