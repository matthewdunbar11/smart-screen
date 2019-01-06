module ScreensHelper
    def layout_options
        Display::DISPLAYABLE_TYPES.map do |t|
            t.to_s.underscore.humanize.titleize
        end
    end
end