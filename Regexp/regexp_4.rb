#
# MatchData
#

def regexp_test(str, pattern)
  match = pattern.match(str)
  if match
    pp "#{match.pre_match} => #{match[0]} => #{match.post_match}"
  else
    pp "No match"
  end
end

regexp_test('hello my name is han juryeon', /is/)