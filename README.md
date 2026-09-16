# Práctica: tu primer aporte a un repositorio

**Curso:** Introducción a GitHub y Docker — Ingeniería Comercial, UAJMS Sede Yacuiba

En este repositorio hay una página web que se arma entre todos. Tu trabajo es agregar
tu propia tarjeta al muro, subir el cambio a GitHub y levantar la página con Docker
para verla funcionando.

---

## Parte 1 — Aportar con Git (individual)

### 1. Traé el repositorio a tu máquina

```bash
git clone <URL-del-repositorio>
cd practica-git-docker
```

### 2. Creá tu rama

Nunca trabajes directo sobre `main`. Usá tu apellido para nombrar la rama:

```bash
git checkout -b aporte/gutierrez
```

### 3. Modificá `index.html`

Abrí el archivo y buscá el bloque comentado que dice
`COPIÁ EL BLOQUE DE ABAJO`. Copiá esa tarjeta, pegala **antes** del comentario
`FIN DE LOS APORTES` y cambiá:

- tu nombre y apellido,
- tu carrera y semestre,
- el mensaje (una o dos líneas, tuyas),
- tu usuario de GitHub.

No borres ni edites las tarjetas de tus compañeros.

### 4. Revisá qué cambiaste antes de guardar nada

```bash
git status
git diff
```

Leé el `diff`: tiene que haber solo líneas agregadas (`+`), ninguna borrada.

### 5. Commit

```bash
git add index.html
git commit -m "Agrega aporte de Ana Gutiérrez al muro"
```

Mensaje en presente, describiendo qué hace el cambio. No `"cambios"`, no `"asdasd"`.

### 6. Subí tu rama y abrí un Pull Request

```bash
git push -u origin aporte/gutierrez
```

Entrá al repositorio en GitHub, abrí el Pull Request hacia `main` y escribí una
línea explicando tu aporte.

---

## Parte 2 — Levantar la página con Docker

Desde la carpeta del proyecto:

```bash
# Construir la imagen
docker build -t muro-aportes .

# Correr el contenedor
docker run -d -p 8080:80 --name muro muro-aportes
```

Abrí <http://localhost:8080> en el navegador. Deberías ver el muro con tu tarjeta.

Comandos útiles mientras trabajás:

```bash
docker ps              # ver contenedores corriendo
docker logs muro       # ver qué dice nginx
docker stop muro       # detener
docker rm muro         # eliminar el contenedor
```

Si cambiás el HTML o el CSS, tenés que volver a construir la imagen
(`docker build`) y correr un contenedor nuevo. Ese es justamente el punto:
la imagen es una foto del proyecto en un momento dado.

---

## Parte 3 (opcional) — Provocá un conflicto a propósito

En parejas, los dos modifican **la misma línea** del `<footer>` en ramas distintas
y hacen merge. Cuando Git marque el conflicto, resuélvanlo a mano, borren los
marcadores `<<<<<<<`, `=======`, `>>>>>>>` y hagan el commit de resolución.

---

## Entrega

- Rama subida al repositorio remoto.
- Pull Request abierto con descripción.
- Captura de pantalla de la página corriendo en `localhost:8080`.

## Criterios de evaluación

| Criterio | Puntos |
|---|---|
| Rama con el nombre correcto | 1 |
| La tarjeta se agrega sin borrar aportes ajenos | 2 |
| Mensaje de commit claro y descriptivo | 2 |
| Pull Request abierto y explicado | 2 |
| Imagen construida y contenedor funcionando (captura) | 3 |
