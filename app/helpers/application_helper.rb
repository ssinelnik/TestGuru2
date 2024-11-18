# frozen_string_literal: true

module ApplicationHelper
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

  CSS_CLASS_TYPES = {
    notice:  'info',
    alert:   'warning',
    error:   'danger'
  }.freeze

  def class_for_flash_message(key)
    CSS_CLASS_TYPES.fetch(key.to_sym, key)
  end
end
