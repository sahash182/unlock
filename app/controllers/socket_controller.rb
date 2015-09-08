class SocketController < ApplicationController
	def ping
		student = User.find(params[:id])
		PrivatePub.publish_to("/profile/badge/#{params[:ins_id]}", "gapi.hangout.render('hangout', { 'render': 'createhangout', 'invites': [{'id': '#{student.email}', 'invite_type': 'EMAIL' }] });")
		PrivatePub.publish_to("/profile/badge/#{params[:ins_id]}", "alert('#{student.username} would like you to teach!')")
		PrivatePub.publish_to("/profile/badge/#{params[:ins_id]}", "$('.hangout-link').show()")
		PrivatePub.publish_to("/profile/badge/#{params[:ins_id]}", "$('.hangout-link').attr('id', '#{student.id}')")
		user = User.find(params[:ins_id])
		user.update_attributes(status: params[:status])
		redirect_to profile_path(student)
	end

	def pong
		PrivatePub.publish_to("/profile/badge/#{params[:socket][:student_id]}", "$('.connect').append('<a href=\"#{params[:socket][:holink]}\">START LEARNING</a>')")
		PrivatePub.publish_to("/profile/badge/#{params[:socket][:student_id]}", "alert('START LEARNING!')")
		current_user.update_attributes(status: nil)
		render json: {}
	end
end
