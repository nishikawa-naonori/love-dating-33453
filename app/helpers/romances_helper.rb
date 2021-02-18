module RomancesHelper
  def romance_lists(romances)
    html = ''
    romances.each do |romance|
      html += render(partial: 'romance', locals: { romance: romance })
    end
    raw(html)
  end
end
