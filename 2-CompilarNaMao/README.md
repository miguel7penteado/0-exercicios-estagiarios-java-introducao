

# Compilando um programa JAVA "na mão", usando script.

![](https://lh3.googleusercontent.com/-5f5vVAeuWRA/VB-NKTBQK6I/AAAAAAAAB2o/ppniM_UzrOQ/w390-h551-no/Exercicios.jpg)

1. 1- O programa que estamos compilando:

![](https://lh5.googleusercontent.com/-sz-mh1fHz-U/VB-RmvJhQFI/AAAAAAAAB3A/FXHD6s8Pz2w/w390-h551-no/classes.jpg)


1. 2- O código das classes JAVA.

**MinhaMultiplicacao.java**
```java
package matematica.multiplicacao;

public class MinhaMultiplicacao
{
	public int multiplica(int parcela1, int parcela2)
	{
		return (parcela1 * parcela2);
	}
}
```

**JuntaTudoEExecuta.java**
```java
import matematica.multiplicacao.MinhaMultiplicacao;

public class JuntaTudoEExecuta
{
	public static void main(String[] args)
	{
		MinhaMultiplicacao objeto1 = new MinhaMultiplicacao();
		System.out.println("O resultado é: " + objeto1.multiplica(5, 10) );
	}
} 

```



