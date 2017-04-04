module Subject
  extend ActiveSupport::Concern
  included do

    attr_reader :observers

    after_initialize :initialize_observers

    def initialize_observers
      @observers = []
      BadgeJudge.new(self)
    end

    def add_observer(*observers)
      observers.each { |observer| @observers << observer }
    end

    def delete_observer(*observers)
      observers.each { |observer| @observers.delete(observer) }
    end

    def notify_observers(*args)
      observers.each { |observer| observer.update(*args) }
    end

  end

end
