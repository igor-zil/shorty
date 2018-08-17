module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then
      "alert alert-info"
    when 'success' then
      "alert alert-success"
    when 'error' then
      "alert alert-danger"
    when 'alert' then
      "alert alert-warning"
    end
  end

  def my_link_to(short)
    res = root_url.to_s.chomp('/') + links_path + '/x/' + short
    #"<a href='#{res}' id=#{element_id}>#{res}</a>".html_safe
    #ret = "<input readonly type='text' class='short' id=#{element_id} value='#{res}'>".html_safe
    #return ret
  end
end
