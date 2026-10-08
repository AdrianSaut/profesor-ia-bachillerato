# Perfil: Tecnología e Ingeniería (I y II)

> Orientativo. El currículo LOMLOE deja mucha libertad al centro: el temario real es el de `info/`. Revisa también `info/examenes/` de tu comunidad.

## Bloques habituales
- **Proyectos de ingeniería:** fases del proceso tecnológico, documentación técnica, gestión, sostenibilidad.
- **Materiales:** propiedades, ensayos (tracción: diagrama tensión-deformación, módulo de Young, límite elástico; dureza Brinell/Vickers/Rockwell; resiliencia Charpy), aleaciones y diagramas de equilibrio, tratamientos.
- **Sistemas mecánicos:** mecanismos de transmisión (engranajes, poleas, relación de transmisión), máquinas, momentos, potencia y rendimiento.
- **Máquinas térmicas y eléctricas:** ciclos termodinámicos, motores, máquinas frigoríficas y bomba de calor (COP), motores eléctricos.
- **Sistemas eléctricos y electrónicos:** circuitos CC y CA (Ohm, Kirchhoff, potencia), electrónica analógica básica.
- **Electrónica digital:** sistemas de numeración, álgebra de Boole, puertas lógicas, tablas de verdad, mapas de Karnaugh, circuitos combinacionales y secuenciales.
- **Neumática e hidráulica:** componentes, simbología normalizada, circuitos, cálculo de fuerzas y consumo de aire.
- **Sistemas de control y automatización:** lazo abierto/cerrado, diagramas de bloques y función de transferencia, sensores y actuadores, programación de controladores (Arduino, autómatas).
- **Energía:** fuentes, consumo, eficiencia, impacto ambiental.

## Cómo enseñar
- Cada fórmula con su **significado físico** y unidades; muchos problemas mezclan física y matemáticas.
- Problemas de cálculo con el mismo método que en Física: esquema → datos en SI → ley → desarrollo → resultado con unidades → comprobación.
- **Digital:** tabla de verdad → función canónica → simplificación (Karnaugh) → circuito con puertas. Que compruebe el circuito con un simulador (Logisim, Falstad, Tinkercad).
- **Neumática:** dibujar el circuito con simbología normalizada y explicar la secuencia de funcionamiento paso a paso (FluidSIM o similar si lo usan en clase).
- Relacionar con aplicaciones reales (coches, ascensores, domótica, impresoras 3D).

## Errores típicos a vigilar
- Unidades: MPa vs. N/mm², kW·h vs. J, rpm vs. rad/s (K/E).
- Relación de transmisión invertida (P).
- Confundir potencia útil, absorbida y rendimiento (C).
- Karnaugh: agrupaciones no potencia de 2, olvidar adyacencias de los bordes (P).
- Diagramas de bloques: signos del comparador y realimentación (P).
- Neumática: confundir cilindro de simple y doble efecto, válvulas 3/2 y 5/2 (C).

## Formato
- Esquemas eléctricos/neumáticos: descríbelos con lista de componentes y conexiones, o ASCII; recomienda dibujarlos a mano o en simulador.
- Tablas de verdad siempre en formato tabla.
