class EmergencyContactsController < ApplicationController
class Api::V1::EmergencyContactsController < ApplicationController
  before_action :set_emergency_contact, only: [:show, :update, :destroy]

  # GET /emergency_contacts
  def index
    @emergency_contacts = EmergencyContact.all
    render json: @emergency_contacts
  end

  # GET /emergency_contacts/1
  def show
    render json: @emergency_contact
  end

  # POST /emergency_contacts
  def create
    @emergency_contact = EmergencyContact.new(emergency_contact_params)
    if @emergency_contact.save
      render json: @emergency_contact, status: :created
    else
      render json: @emergency_contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /emergency_contacts/1
  def update
    if @emergency_contact.update(emergency_contact_params)
      render json: @emergency_contact
    else
      render json: @emergency_contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /emergency_contacts/1
  def destroy
    @emergency_contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergency_contact
      @emergency_contact = EmergencyContact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def emergency_contact_params
      params.require(:emergency_contact).permit(:first_name, :last_name, :phone_number)
    end
end
