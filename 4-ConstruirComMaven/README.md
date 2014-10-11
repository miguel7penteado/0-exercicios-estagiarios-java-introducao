

# Compilando um programa JAVA usando o Apache Maven, usando script.

![](https://lh3.googleusercontent.com/-5f5vVAeuWRA/VB-NKTBQK6I/AAAAAAAAB2o/ppniM_UzrOQ/w390-h551-no/Exercicios.jpg)

1. 1- Arquetipo ou Archetype:

Deve ser selecionado, para que o Maven escolha um template ( estrutura de diretórios, plugins) que ele utilizará para criar
o Projeto.

1. 2- Cabeçalhos:

São selecionadas após escolher-se o arquetipo. Selecionaremos as seguintes propriedades no POM.xml :


| Propriedade:  | Descrição:                                                                                 |
|---------------|--------------------------------------------------------------------------------------------|
| modelVersion  | Versão do Maven para construção.                                                           |
| groupId       | Estrutura do pacote (subdiretórios) no formato "DNS".                                      |
| artifactId    | Nome do projeto.                                                                           |
| version       | Versão do projeto.                                                                         |
| packaging     | Empacotamento deste projeto, que pode ser: jar, ejb, war, ear, (também pom e maven-plugin) |
| name          | Descrição do projeto.                                                                      |
| url           | Endereço da página do desenvolvedor.                                                       |


exemplo:
```xml

    <modelVersion>4.0.0</modelVersion>
 
    <groupId>org.wildfly.quickstarts</groupId>
    <artifactId>wildfly-ejb-remote-server-side</artifactId>
    <version>8.0.0-SNAPSHOT</version>
	
    <packaging>ejb</packaging>
    <name>WildFly Quickstarts: Server side of remote EJB</name>

    <url>http://wildfly.org</url>
	
```



1. 3- Licença:

| Propriedade:  | Descrição:             |
|---------------|------------------------|
| name          | Nome da licença.       |
| distribution  | ponto de distrubuição. |
| url           | Endereço da Licença.   |

exemplo:
```xml
<licenses>
        <license>
            <name>Apache License, Version 2.0</name>
            <distribution>repo</distribution>
            <url>http://www.apache.org/licenses/LICENSE-2.0.html</url>
        </license>
    </licenses>
```

1. 4- Propriedades:

exemplo:
```xml
<properties>
 
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>

        <!-- JBoss dependency versions -->
        
        <version.wildfly.maven.plugin>1.0.2.Final</version.wildfly.maven.plugin>
        
        <version.jboss.spec.javaee.7.0>1.0.0.Final</version.jboss.spec.javaee.7.0>


        <!-- other plugin versions -->
        <version.compiler.plugin>3.1</version.compiler.plugin>
        <version.ejb.plugin>2.3</version.ejb.plugin>

        <!-- maven-compiler-plugin -->
        <maven.compiler.target>1.7</maven.compiler.target>
        <maven.compiler.source>1.7</maven.compiler.source>
    </properties>
```

1. 5- Gerenciamento de Dependências:


exemplo:
```xml
    <dependencyManagement>
        <dependencies>
             <dependency>
                <groupId>org.jboss.spec</groupId>
                <artifactId>jboss-javaee-7.0</artifactId>
                <version>${version.jboss.spec.javaee.7.0}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>

```



1. 6- Dependências em sí:

exemplo:
```xml
    <dependencies>

        <dependency>
            <groupId>org.jboss.spec.javax.annotation</groupId>
            <artifactId>jboss-annotations-api_1.2_spec</artifactId>
            <scope>provided</scope>
        </dependency>

        <dependency>
            <groupId>org.jboss.spec.javax.ejb</groupId>
            <artifactId>jboss-ejb-api_3.2_spec</artifactId>
            <scope>provided</scope>
        </dependency>

    </dependencies>
```


1. 7- Construção:

exemplo:
```xml
    <build>
        <!-- Set the name of the deployment -->
        <finalName>${project.artifactId}</finalName>
        <plugins>
            <!-- WildFly plugin to deploy the application -->
            <plugin>
                <groupId>org.wildfly.plugins</groupId>
                <artifactId>wildfly-maven-plugin</artifactId>
                <version>${version.wildfly.maven.plugin}</version>
                <configuration>
                    <filename>${project.build.finalName}.jar</filename>
                </configuration>
            </plugin>
            <!-- Compiler plugin enforces Java 1.6 compatibility and activates 
                annotation processors -->
            <plugin>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>${version.compiler.plugin}</version>
                <configuration>
                    <source>${maven.compiler.source}</source>
                    <target>${maven.compiler.target}</target>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-ejb-plugin</artifactId>
                <version>${version.ejb.plugin}</version>
                <configuration>
                    <ejbVersion>3.1</ejbVersion>
                    <!-- this is false by default -->
                    <generateClient>true</generateClient>
                </configuration>
            </plugin>

        </plugins>
    </build>
```








