class CommentBroadcastJob < ApplicationJob
  queue_as :default

  def self.perform(comment)
    ActionCable.server.brodcast "blogs_#{comment.blog.id}_channel", comment: render_comment(comment)
  end

  private

  def render_comment(comment)
    CommentsController.render partial: 'comment/comments', locals: { comment: comment }
  end
end