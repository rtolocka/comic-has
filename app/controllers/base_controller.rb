class BaseController < ApplicationController
after_filter :flash_to_headers

    def flash_to_headers
        return unless request.xhr?
        response.headers['X-Message'] = flash[:error]     unless flash[:error].blank?
        response.headers['X-Message'] = flash[:warning]   unless flash[:warning].blank?
        response.headers['X-Message'] = flash[:notice]    unless flash[:notice].blank?
        # repeat for other flash types...
        flash.discard  # don't want the flash to appear when you reload page
    end
end