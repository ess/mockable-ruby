require "mockable/version"

module Mockable
  VARNAME = 'MOCKABLE'

  def self.mocked?
    ENV[VARNAME] ? true : false
  end

  def self.enable
    ENV[VARNAME] = '1' unless mocked?
  end

  def self.disable
    ENV.delete(VARNAME) if mocked?
  end

end
