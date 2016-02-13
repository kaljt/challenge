require 'date'
# class Meetup used to find occurrence of of specific day
class Meetup
  attr_reader :month_start, :month_end

  SCHED = { teenth: [13, 14, 15, 16, 17, 18, 19] }.freeze
  ORDER = [:first, :second, :third, :fourth].freeze

  def initialize(month, year)
    @month_start = Date.new(year, month)
    @month_end = month_start.next_month.prev_day
  end

  def day(weekday, schedule)
    possible_days = month_start.step(month_end).select { |d| d.send((weekday.to_s + "?").to_sym) }
    if ORDER.include?(schedule)
      possible_days[ORDER.index(schedule)]
    elsif schedule == :teenth
      possible_days.select { |d| SCHED[schedule].include?(d.day) }.first
    else
      possible_days.last
    end
  end
end
