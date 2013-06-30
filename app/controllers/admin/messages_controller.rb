class Admin::MessagesController < ApplicationController
	before_action :set_admin_message, only: [:show, :destroy]

	def index
		@admin_messages = Message.paginate(:page => params[:page], :per_page => 100)
	end

	def show
	end

	def destroy
		@admin_message.destroy
		respond_to do |format|
			format.html { redirect_to admin_messages_url }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_admin_message
			@admin_message = Message.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def admin_message_params
			params[:admin_message]
		end
end
