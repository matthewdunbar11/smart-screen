class DisplaysPage < PublicPage
  def self.display_row(display)
    displays_table.find("[data-id='#{display.id}']")
  end

  def self.displays_table
    find('.table.displays')
  end
end