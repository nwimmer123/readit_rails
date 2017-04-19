class ReviewMailer < ApplicationMailer

  def review_notification(review)
    @review = review
    @user = @review.user
    mail(to: @user.email, subject: "Someone commented on your post!")

  end
end
