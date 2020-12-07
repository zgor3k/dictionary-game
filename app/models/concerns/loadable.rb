module Loadable
  extend ActiveSupport::Concern

  class_methods do
    def update_timestamps!
      time_now = Time.zone.now

      where(created_at: nil)
        &.update_all(created_at: time_now, updated_at: time_now)
    end
  end
end
