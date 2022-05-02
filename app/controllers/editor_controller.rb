require 'open-uri'

class EditorController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :set_default_response_format
  # before_action :sign_request, only: [:image]

  def image
    if params[:image].present? && S3_BUCKET.present?
      image = params[:image]
      object = S3_BUCKET.put_object(
        key: "#{SecureRandom.uuid}-#{Time.now.to_i}.#{image.content_type.split('/')[1]}",
        acl: 'public-read',
        content_type: image.content_type,
        body: image
      )
      url = "#{S3_BUCKET_URL}/#{object.key}"
    elsif params[:url].present?
      image = URI.open(params[:url])
      url = params[:url]
    end

    respond_to do |format|
      format.html { "Nothing to do here..." }
      format.json { render json: {
        :success => 1,
        :file => {
          :url => url,
          :content_type => image.content_type
        }
      }}
    end
  end

  def link
    url = params[:url]
    url = 'https://' + url unless url.start_with?(/^http(s)?:\/\//)

    doc = Nokogiri::HTML(URI.open(url))

    title = params[:url]
    description = ''

    doc.search('meta').each do |tag|
      meta_name = tag.attributes['name']
      if !meta_name.nil?
        p tag.attributes['content']
        if meta_name.value == 'description'
          description = tag.attributes['content'].value
        elsif meta_name.value == 'og:description' && description == ''
          description = tag.attributes['content'].value
        end
      end
    end

    doc.search('title').each do |tag|
      if tag.content.present?
        title = tag.content
      end
    end




    respond_to do |format|
      format.html { "Nothing to do here..." }
      format.json { render json: {
        :success => 1,
        :meta => {
          :title => title,
          :description => description,
          :domain => URI.parse(url).host
        }
      }}
    end
  end

  private

  def set_default_response_format
    request.format = :json
  end

  # def sign_request
  #   @signed_request = .presigned_post(, success_action_status: '201',)
  # end

end
