//======================> Crear colección para Equipos <======================//
db.equipos.insertMany([
  {
    "nombre": "Tiburones",
    "entrenador": {
      "nombre": "Carlos Pérez",
      "documento": "123456789",
      "experiencia": "5 años"
    },
    "jugadores": [
      { "nombre": "Juan García", "documento": "123456001", "fecha_nacimiento": "1995-03-15", "posicion": "Líbero" },
      { "nombre": "Luis López", "documento": "123456002", "fecha_nacimiento": "1996-04-20", "posicion": "Atacante" }
    ]
  },
  {
    "nombre": "Águilas",
    "entrenador": {
      "nombre": "María Gómez",
      "documento": "223344556",
      "experiencia": "8 años"
    },
    "jugadores": [
      { "nombre": "Ana Torres", "documento": "123456003", "fecha_nacimiento": "1997-05-10", "posicion": "Central" },
      { "nombre": "Laura Díaz", "documento": "123456004", "fecha_nacimiento": "1998-06-25", "posicion": "Armadora" }
    ]
  },
  {
    "nombre": "Leones",
    "entrenador": {
      "nombre": "Pedro Ramírez",
      "documento": "345678910",
      "experiencia": "10 años"
    },
    "jugadores": [
      { "nombre": "Carlos Ortega", "documento": "123456005", "fecha_nacimiento": "1999-01-30", "posicion": "Opuesto" },
      { "nombre": "Miguel Ruiz", "documento": "123456006", "fecha_nacimiento": "2000-02-15", "posicion": "Líbero" }
    ]
  }
]);


//======================> Crear colección para Árbitros <======================//
db.arbitros.insertMany([
  { "nombre": "Alberto Castro", "documento": "100200300", "experiencia": "5 años", "disponibilidad": ["2024-11-20", "2024-11-22"] },
  { "nombre": "Sofía Moreno", "documento": "200300400", "experiencia": "7 años", "disponibilidad": ["2024-11-21", "2024-11-23"] },
  { "nombre": "Jorge Rojas", "documento": "300400500", "experiencia": "3 años", "disponibilidad": ["2024-11-22", "2024-11-24"] }
]);


//======================> Crear colección para Encuentros <======================//

db.encuentros.insertMany([
  {
    "equipo_local": "Tiburones",
    "equipo_visitante": "Águilas",
    "fecha": "2024-11-20",
    "hora": "10:00",
    "lugar": "Coliseo Central",
    "arbitro": "Alberto Castro"
  },
  {
    "equipo_local": "Leones",
    "equipo_visitante": "Tiburones",
    "fecha": "2024-11-21",
    "hora": "14:00",
    "lugar": "Coliseo Norte",
    "arbitro": "Sofía Moreno"
  }
]);

//======================> Crear colección para Resultados <======================//

db.resultados.insertMany([
  {
    "encuentro_id": ObjectId("64bf1df2f1cda00012585bc1"), // ID del primer encuentro
    "set_local": [25, 23, 25],
    "set_visitante": [15, 25, 20],
    "ganador": "Tiburones"
  },
  {
    "encuentro_id": ObjectId("64bf1df2f1cda00012585bc2"), // ID del segundo encuentro
    "set_local": [15, 23, 20],
    "set_visitante": [25, 25, 25],
    "ganador": "Águilas"
  }
]);

//======================> Crear colección para Tabla de Posiciones <======================//

db.tabla_posiciones.insertMany([
  { "equipo_id": "Tiburones", "partidos_jugados": 2, "victorias": 1, "derrotas": 1, "puntos": 3 },
  { "equipo_id": "Águilas", "partidos_jugados": 2, "victorias": 2, "derrotas": 0, "puntos": 6 },
  { "equipo_id": "Leones", "partidos_jugados": 1, "victorias": 0, "derrotas": 1, "puntos": 0 }
]);


//======================> Consultas <======================//
// consultas de las colecciones
db.equipos.find(); 

db.tabla_posiciones.find();

db.tabla_posiciones.find();


