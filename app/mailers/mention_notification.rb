class MentionNotification < ActionMailer::Base
  default from: "WhiteBoard @ FourAthens <jim@fourathens.com>"

    def mention_post(user_id, post)
	    @user = User.find_by_id(user_id)
	    @post = post
	    @url  = 'http://54.88.180.136/'
	    mail(to: @user.email, subject: 'WhiteBoard: You were mentioned in a post.')
  	end


    def mention_comment(user_id, comment)
	    @user = User.find_by_id(user_id)
	    @comment = comment
	    @url  = 'http://54.88.180.136/'
	    mail(to: @user.email, subject: 'WhiteBoard: You were mentioned in a comment.')
  	end

end
