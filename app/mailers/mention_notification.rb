class MentionNotification < ActionMailer::Base
  default from: "WhiteBoard @ FourAthens <jim@fourathens.com>"

    def mention_post(user_id, post)
	    @user = User.find_by_id(user_id)
	    @post = post
	    @url  = 'http://member.fourathens.com/'
	    mail(to: @user.email, subject: 'WhiteBoard: You were mentioned in a post.')
  	end


    def mention_comment(user_id, comment)
	    @user = User.find_by_id(user_id)
	    @comment = comment
	    @url  = 'http://member.fourathens.com/'
	    mail(to: @user.email, subject: 'WhiteBoard: You were mentioned in a comment.')
  	end

  	def mention_all_post(mention, mentioner)
 	    @url  = 'http://member.fourathens.com/'
  		@mention = mention
  		@mentioner = mentioner
  		members = User.where(role: "member").pluck(:email)
  		admin = User.where(role: "member").pluck(:email)
  		recips = members << admin
  		recips.flatten
  		mail(to: recips, subject: 'WhiteBoard: You were mentioned in a post.')

  	end

  	def mention_all_comment(mention, mentioner)
	    @url  = 'http://member.fourathens.com/'
  		@mention = mention
  		@mentioner = mentioner
  		members = User.where(role: "member").pluck(:email)
  		admin = User.where(role: "member").pluck(:email)
  		recips = members << admin
  		recips.flatten
  		mail(to: recips, subject: 'WhiteBoard: You were mentioned in a comment.')
  	end
 
  	def mention_thread(mention, mentioner)
	    @url  = 'http://member.fourathens.com/'  
  		@mention = mention
  		@mentioner = mentioner
  		post = @mention.post
  		recip_set = Set.new
  		recip_set.add post.user.email unless post.user.email == @mentioner.email
  		comments = post.comments
  		comments.each do |c|
  			unless c.user.email == @mentioner.email
  				recip_set.add c.user.email
        end
  		end
  		@recips = recip_set.to_a
  		mail(to: @recips, subject: 'WhiteBoard: You were mentioned in a comment.')
  	end

end
