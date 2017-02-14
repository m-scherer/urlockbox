class Publisher
  attr_reader :channel, :lockbox_to_hotreads_queue_link, :lockbox_to_hotreads_queue_user

  def initialize
    # connection = Bunny.new(
    # host: "experiments.turing.io",
    # port: "5672",
    # user: "student",
    # pass: "PLDa{g7t4Fy@47H"
    # )
    connection = Bunny.new(ENV['RABBITMQ_BIGWIG_TX_URL'])
    connection.start
    @channel = connection.create_channel
    create_link_channel
    create_user_channel
  end

  def create_link_channel
    @lockbox_to_hotreads_queue_link = channel.queue("ms.lockbox.to.hotreads.link")
  end

  def create_user_channel
    @lockbox_to_hotreads_queue_user = channel.queue("ms.lockbox.to.hotreads.user")
  end

  def publish_link_to_queue(link)
    lockbox_to_hotreads_queue_link.publish(link.to_json)
    puts link.to_json
  end

  def publish_user_to_queue(user)
    lockbox_to_hotreads_queue_user.publish(user.to_json)
    puts user.to_json
  end

end
