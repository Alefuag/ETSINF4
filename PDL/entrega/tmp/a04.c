// Ejemplo de funciones y variables globales y locales
//----------------------------------------------------
int x; int y;

int suma(int x, int y)
{ int a;
  a = x + y;
  return a;
}

int a[10];

int division(int x, int y)
{
  return x/y;
}

int main()
{ int i;

  i = 9;
  while (i >= 0)  { a[i] = i; i = i+1; }
  read(x); read(y);
  if (((x >= 0) && (x <= 9)) && ((y >= 0) && (y <= 9)))
    print(division(suma(a[x],a[y]),2));
  else {}
  
  return 0;
}
