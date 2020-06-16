class ClientsController < ApplicationController
    
    def new
        @client = Client.new
    end

    def show
        @client = Client.find(params[:id])
    end

    def create
        @client = Client.new(client_params)
        @client.company_id = current_user.company_id.id
        if @client.save
            flash[:success] = "client added!"
            redirect_to company_path(current_user)   
          else
            render 'new'
          end
    end

    def delete
    end

    def update
    end

    private

  def client_params
    params.require(:client).permit(:name,
       :addres, :nip)
  end
end
