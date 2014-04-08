# encoding: utf-8

require 'helper'

# Author Guapolo <github.com/guapolo>
class TestIDCodeMX < Test::Unit::TestCase

  def test_rfc
    re = /\A[a-zñÑ&]{3,4}\d{2}[0-1][0-9][0-3][0-9][a-z0-9]{3}\z/i
    assert_match(re, Faker::IDCodeMX.rfc)
  end
  
  def test_rfc_persona_moral
    re = /\A[a-zñÑ&]{3}\d{2}[0-1][0-9][0-3][0-9][a-z0-9]{3}\z/i
    assert_match(re, Faker::IDCodeMX.rfc_persona_moral)
  end
  
  def test_rfc_persona_fisica
    re = /\A[a-zñÑ]{4}\d{2}[0-1][0-9][0-3][0-9][a-z0-9]{3}\z/i
    assert_match(re, Faker::IDCodeMX.rfc_persona_fisica)
  end

  def test_curp
    or_curp_states_abbr = Faker::IDCodeMX::CURP_STATE_ABBR.join("|")
    re = /\A[a-z][aeioux][a-z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][hm]#{or_curp_states_abbr}[bcdfghjklmnñpqrstvwxyz]{3}[0-9a-z][0-9]\z/i
    assert_match(re, Faker::IDCodeMX.curp)
  end
  
end
