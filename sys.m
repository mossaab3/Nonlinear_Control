function dydt = sys(t ,x)
 u = 0
 a = 1
 b = 1
dydt = [sin(x(1)) + x(2) ; a* x(1)^2 + (1+b)*u];