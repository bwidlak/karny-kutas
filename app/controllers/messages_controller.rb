class MessagesController < ApplicationController
	before_action :set_message, only: [:show]

	def search
		@messages = Message.search params[:target_email]
		redirect_to(new_message_path, notice: 'Theres no messages releated with that email address') if @messages.empty?
	end

	def index
		@messages = Message.paginate(:page => params[:page], :per_page => 20)
	end

	def show
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.new(message_params)

		respond_to do |format|
			if @message.save
				format.html { redirect_to @message, notice: 'Message was successfully created.' }
				format.json { render action: 'show', status: :created, location: @message }
			else
				format.html { render action: 'new' }
				format.json { render json: @message.errors, status: :unprocessable_entity }
			end
		end
	end

	private

		# Use callbacks to share common setup or constraints between actions.
		def set_message
			@message = Message.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def message_params
			params.require(:message).permit(:name, :target_name, :target_email, :body, :ip, :status)
		end
end
