# Curso Experto Desarrollo Aplicaciones Blockchain

## Laboratorio de Testing

Mostramos un ejemplo de Test-Driven development con un Smart Contract "CrowFunding"

## Requerimientos previos

- Node.js
- npm
  - truffle
  - chai
  - mocha
  - ganache-cli

Si no se han instalado de manera global estas librerias, entonces podemos instalarlas como requerimiento local para desarrollo:

```bash
npm init
npm install --save-dev truffle
npm install --save-dev mocha
npm install --save-dev chai
npm install --save-dev ganache-cli
truffle init
```

## Test

Para ejecutar las pruebas, ejecutamos desde la carpeta raiz del proyecto

```bash
truffle test
```

Esto ejecutará los casos de prueba creados bajo la carpeta "./test", tanto los que son puro solidity ("Test....sol") como los que son javascript "...test.js"


