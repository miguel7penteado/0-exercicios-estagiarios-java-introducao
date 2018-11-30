# Contornando o bug da biblioteca awt do java em ambientes x-windows no Linux

O bug está relacionado ao erro da extensão x-render do X , conforme definido no link [https://bugs.freedesktop.org/show_bug.cgi?id=48045](https://bugs.freedesktop.org/show_bug.cgi?id=48045)

```bash
java -Dsun.java2d.xrender=false -jar meu-pacote.jar
```
