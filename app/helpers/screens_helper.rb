module ScreensHelper
    def layout_options
        Display::DISPLAYABLE_TYPES.map do |t|
            t.to_s.underscore.humanize.titleize
        end
    end

  def time_zones
    ActiveSupport::TimeZone.all.sort_by(&:utc_offset).map { |tz| [tz.name, tz.name] }
  end
end