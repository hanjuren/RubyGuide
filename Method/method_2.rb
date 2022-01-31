print "(t)imes or (p)lus : "
op = gets
print "number : "
number = Integer(gets)

if /^t/ =~ op
  calc = lambda { |n| n*number }
else
  calc = lambda { |n| n+number }
end

pp (1..10).collect(&calc)
