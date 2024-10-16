# frozen_string_literal: true

module ApplicationHelper
  MESSAGE = { 'notice': 'alert alert-info',
              'success': 'alert alert-success',
              'error': 'alert alert-danger', 
              'alert': 'alert alert-warning' }

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to author, "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener'
  end

  def full_title(page_title = '')
    base_title = 'Test Guru'
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end

  def flash_class(level)
    MESSAGE[level.to_sym]
  end
end
