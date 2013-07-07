class BaseController < ApplicationController
after_filter :flash_to_headers

    def flash_to_headers
        return unless request.xhr?
        response.headers['X-Message-Alert'] = flash[:alert]     unless flash[:alert].blank?
        response.headers['X-Message-Error'] = flash[:error]     unless flash[:error].blank?
        response.headers['X-Message-Warning'] = flash[:warning]   unless flash[:warning].blank?
        response.headers['X-Message-Notice'] = flash[:notice]    unless flash[:notice].blank?
        flash.discard  # don't want the flash to appear when you reload page
    end
end