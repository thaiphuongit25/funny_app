class NotifyNewMovieJob < ApplicationJob
  queue_as :default

  def perform(user, movie)
    ActionCable.server.connections.each do |connect|
      active_user = connect.current_user
      next if active_user.id == user.id

      ActionCable.server.broadcast("movie_user_#{active_user.id}", { action: 'new_movie', data: { email: user.email, movie: movie } })
    end
  end
end
