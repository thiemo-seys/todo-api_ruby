# frozen_string_literal

module TikTok
  def tiks
    @tiks ||= {}
  end

  def tik(namespace = :default)
    tiks[namespace] = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  # Returns time delta in seconds
  def tok(namespace = :default)
    return 0 unless tiks[namespace]
    (Process.clock_gettime(Process::CLOCK_MONOTONIC) - tiks[namespace]).truncate(3)
  end

  # Returns time delta in milliseconds
  def tak(namespace = :default)
    return 0 unless tiks[namespace]

    ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - tiks[namespace]) * 1000).truncate(3)
  end
end
