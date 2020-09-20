# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show update destroy]

  # POST /contacts
  def create
    @contact = Contact.create!(contact_params)

    json_response(@contact, :created)
  end

  def index
    @contacts = Contact.order(created_at: :desc).page params[:page]
    json_response @contacts
  end

  # GET /contacts/:id
  def show
    json_response @contact
  end

  # PUT /contacts/:id
  def update
    contact.update(contact_params)

    head :no_content
  end

  # DELETE /contacts/:id
  def destroy
    @contact.destroy
  end

  private

  attr_accessor :contact

  def contact_params
    params.permit(:email, :first_name, :last_name, :phone)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
